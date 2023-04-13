import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:miniapp_codebase/app/data/models/base_reponse.dart';
import 'package:miniapp_codebase/app/data/models/first_page_response.dart';


import '../base/base_client.dart';

class ApiService {
  final _baseService = Get.find<BaseApi>();

  Future<BaseResponse<FirstPageResponse>> getFirstPageResponse() async {
    // var response = await _baseService.getRequest(
    //     url: ApiConfig.firstPageUrl,
    //     token: (await ApiConfig.accessToken)!,
    //     data: {
    //     });
    // if (response.data != null) {
    //   return BaseResponse.fromJson(response.data, (json) => FirstPageResponse.fromJson(json as Map<String, dynamic>));
    // }

    //test thread
    var response = dio.Response(data: {"data": {"id" : 123}}, requestOptions: dio.RequestOptions(path: ''));
    await Future.delayed(Duration(seconds: 2));
    if (response.data != null) {
      return BaseResponse.fromJson(response.data as Map<String, dynamic>, (json) => FirstPageResponse.fromJson(json as Map<String, dynamic>));
    }
    throw Exception("Some thing went wrong!");
  }
}
