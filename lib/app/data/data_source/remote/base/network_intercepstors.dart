import 'package:dio/dio.dart';
import 'package:mpcore/mpcore.dart';
import 'package:miniapp_codebase/app/data/models/base_reponse.dart';
import 'package:miniapp_codebase/app/data/models/refresh_token_response.dart';
import 'package:miniapp_codebase/app/data/models/refresh_token_response.dart';
import 'package:miniapp_codebase/utils/jwt_decoder.dart';
import 'package:miniapp_codebase/app/data/data_source/local/token_local_data_source.dart';
import 'package:uuid/uuid.dart';


class NetworkInterceptor extends Interceptor {
  final ITokenLocalDataSource _iTokenLocalDataSource =
      SharedPreferencesTokenLocalDataSource();
  var uuid = Uuid();

  bool _tokenHasExpired(String? token) {
    if (token == null) return true;
    return JwtDecoder.isExpired(token);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers.containsKey("no-auth")) {
      options.headers.remove("no-auth");
      return handler.next(options);
    }
    final accessToken = await _iTokenLocalDataSource.getAccessToken();
    if (accessToken == null || _tokenHasExpired(accessToken)) {
      return handler.reject(
        DioError(
          requestOptions: options,
          response: Response(
            requestOptions: options,
            statusCode: 401,
          ),
        ),
        true,
      );
    }
    options.headers['Authorization'] = 'Bearer $accessToken';
    options.headers['ClientMessageId'] = '${uuid.v4()}';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      final refreshToken = await _iTokenLocalDataSource.getRefreshToken();
      if (refreshToken == null || _tokenHasExpired(refreshToken)) {
        var message = {
          'type': 'refresh_token_has_expired',
          'message': {
            'action': 'refreshToken',
            'refreshToken': '$refreshToken',
          }
        };
        MPCore.postMapMessage(message);
      } else {
        /// get access token from server
        final dio = Dio();
        dio.options.connectTimeout = 10000;
        dio.options.sendTimeout = 15000;
        dio.options.receiveTimeout = 15000;
        try {
          final response = await dio.post<dynamic>(
            'https://api-sandbox.mbbank.com.vn/ms/hcm-self-service-uat/v1.0/refresh-token',
            options: Options(
              method: 'POST',
              contentType: 'application/x-www-form-urlencoded',
            ),
            data: {
              'clientId': 'hcm-frontend',
              'refreshToken': refreshToken,
            },
          );
          final data = response.data;
          print("data = $data");
          if (response.statusCode! < 300 &&
              data != null &&
              data is Map<String, dynamic>) {
            final authData = BaseResponse<RefreshTokenResponse>.fromJson(
              data,
              (json) => RefreshTokenResponse.fromJson(json as Map<String, dynamic>)
            );
            //
            final accessNewToken = authData.data?.accessToken;
            if (accessNewToken != null && accessNewToken.isNotEmpty) {
              var message = {
                'type': 'get_access_token',
                'message': {
                  'action': 'accessToken',
                  'accessToken': '$accessNewToken',
                }
              };
              MPCore.postMapMessage(message);
            }
            /// luu token moi
            // final refreshNewToken = authData.data?.refreshToken;
            // if (accessNewToken != null && refreshNewToken != null) {
            //   await _iTokenLocalDataSource.cacheAccessToken(
            //     token: accessNewToken,
            //   );
            //   await _iTokenLocalDataSource.cacheRefreshToken(
            //     token: refreshNewToken,
            //   );
            // }
            // create request with new access token;
            err.requestOptions.headers['Authorization'] =
                'Bearer $accessNewToken';
            final cloneReq = await dio.fetch<dynamic>(err.requestOptions);
            return handler.resolve(cloneReq);
          }
        } on DioError catch (e) {
          if (e.requestOptions.uri.toString() ==
              'https://api-sandbox.mbbank.com.vn/ms/hcm-self-service-uat/v1.0/refresh-token') {
            if (e.response?.statusCode == 401 ||
                e.response?.statusCode == 403) {
              print('state emit ');
            }
            // handle login when refresh and access token expired
            return;
          }
          return handler.next(e);
        }
      }
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
