import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mp_pull_to_refresh/smart_refresher.dart';
import 'package:mpcore/mpkit/mpkit.dart';
import 'package:miniapp_codebase/app/pages/first_page/controller/first_page_controller.dart';
import 'package:miniapp_codebase/view/error_widget/data_error_widget.dart';

class FirstPageScreen extends GetView<FirstPageControlelr> {
  static const route = "/first_page";
  
  FirstPageScreen() {
    Get.put(FirstPageControlelr());
  }

  @override
  Widget build(context) {
    return MPScaffold(
      appBar: MPAppBar(
        context: context,
        title: Text('First Page'),
      ),
      body: GetX<FirstPageControlelr>(
        assignId: true,
        builder: (controller) {
           if (controller.firstPageEntityState.value.status.isLoading ==
                true) {
              return Center(child: MPCircularProgressIndicator(),);
            }
            return Center(child: Text("First page content"),);
        },
      ),
    );
  }

}
