import 'package:get/get.dart';

class RxDataStatus<T> {
  T? data;
  RxStatus status = RxStatus.loading();

  RxDataStatus(this.status, {this.data});

  RxDataStatus.empty(){
    this.status = RxStatus.empty();
  }

  RxDataStatus.loading();

  RxDataStatus.success(this.data) {
    this.status = RxStatus.success();
  }

  RxDataStatus.error(String message) {
    this.status = RxStatus.error(message);
  }
}
