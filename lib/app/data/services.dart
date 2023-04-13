import 'package:get/get.dart';
import 'package:newcase/app/data/data_source/remote/base/base_client.dart';

class AppServices {
  static Future<void> init() async {
    Get.put(BaseApi()).init();
  }
}

abstract class BaseService {
  Future<void> init() async {}
}
