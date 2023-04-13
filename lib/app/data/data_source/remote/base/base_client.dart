import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:newcase/config/api_config.dart';
import 'package:path/path.dart';

import 'network_intercepstors.dart';

class BaseApi {
  late Dio dio;

  interceptors() async {
    dio.interceptors.add(NetworkInterceptor());
  }

  Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        headers: {'content-type': 'application/json'},
        connectTimeout: 120 * 1000,
        receiveTimeout: 120 * 1000,
        sendTimeout: 120 * 1000, // 120s
      ),
    );
    await interceptors();
  }

  void settingHeaderRequest(String token) {
    if (token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    dio.options.responseType = ResponseType.json;
    dio.options.contentType = 'application/json';
  }

  Future<Response?> getRequest(
      {required String url, String token = '', var data}) async {
    try {
      settingHeaderRequest(token);

      if (data != null) return await dio.get(url, queryParameters: data);
      return await dio.get(url);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Response?> postRequest(
      {required String url, String token = '', required String data}) async {
    try {
      settingHeaderRequest(token);
      return await dio.post(url, data: data);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Response?> putRequest(String url, String token, String data) async {
    try {
      settingHeaderRequest(token);
      return await dio.put(url, data: data);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Response?> getFileRequest(String url, String token, {var data}) async {
    try {
      settingHeaderRequest(token);
      dio.options.responseType = ResponseType.bytes;

      if (data != null) return await dio.get(url, queryParameters: data);
      return await dio.get(url);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Response?> uploadFile(String url, String token, File file) async {
    try {
      String fileName = file.path
          .split('/')
          .last;
      settingHeaderRequest(token);

      final parFile = await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: MediaType('image', 'png'),
      );
      FormData formData = FormData.fromMap({
        "file": parFile,
        "fileType": 'FILE_IMAGE_SIGNATURE',
      });
      return await dio.post(url, data: formData);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Response?> uploadMultipleFile(String url, String token,
      List<File> files) async {
    try {
      settingHeaderRequest(token);
      dio.options.contentType = 'multipart/form-data';

      final formData = FormData();

      for (File file in files) {
        final itemFile = await MultipartFile.fromFile(
          file.path,
          filename: basename(file.path),
        );
        formData.files.add(MapEntry("files", itemFile));
      }

      formData.fields.add(const MapEntry("fileType", 'FILE_EXTRA'));

      return await dio.post(url, data: formData);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}