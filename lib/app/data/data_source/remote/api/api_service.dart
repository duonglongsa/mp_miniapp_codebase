import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:newcase/app/data/models/base_reponse.dart';
import 'package:newcase/app/data/models/first_page_response.dart';
import 'package:newcase/config/api_config.dart';


import '../base/base_client.dart';

class ApiService {
  final _baseService = Get.find<BaseApi>();

  Future<BaseResponse<FirstPageResponse>> getFirstPageResponse() async {
    // var response = await _baseService.getRequest(
    //     url: ApiConfig.firstPageUrl,
    //     token: (await ApiConfig.accessToken)!,
    //     data: {
    //     });
    //test thread
    var response = BaseResponse();
    await Future.delayed(Duration(seconds: 2));
    if (response != null) {
      return BaseResponse.fromJson(response.data, (json) => FirstPageResponse.fromJson(json as Map<String, dynamic>));
    }
    throw Exception("Some thing went wrong!");
  }
}
