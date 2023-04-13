import 'package:get/get.dart';
import 'package:newcase/app/data/models/base_reponse.dart';
import 'package:newcase/app/data/models/first_page_response.dart';
import 'package:newcase/app/data/models/rx_data_status.dart';
import 'package:newcase/app/data/repository/repo.dart';
import 'package:newcase/app/data/repository/repo_impl.dart';
import 'package:newcase/app/pages/first_page/entity/first_page_entity.dart';
import 'package:newcase/config/api_config.dart';

class FirstPageControlelr extends GetxController {
  final Repo _repository = RepoImpl();

  Rx<RxDataStatus<FirstPageEntity>> firstPageEntityState =
      (RxDataStatus<FirstPageEntity>.loading()).obs;

  String? accessTokenLocal;

  @override
  onReady() {
    super.onReady();
    getEntity();
    ApiConfig.accessToken.then((value) => {accessTokenLocal = value});
  }

  getEntity() async {
    try {
      firstPageEntityState.value = RxDataStatus.loading();
      BaseResponse? response = await _repository.getFirstPageResponse();
      if (response.data != null) {
        if (response.data != null) {
          firstPageEntityState.value = RxDataStatus.success(FirstPageEntity.fromResponse(response.data));
        } else {
          firstPageEntityState.value = RxDataStatus.empty();
        }
      } else {
        //handle exception
        print("${response.code?.toString()} ${response.message?.toString()}");
        firstPageEntityState.value = RxDataStatus.error("No data");
      }
    } catch (e) {
      print(e);
      //  hanle error
      firstPageEntityState.value = RxDataStatus.error("No data");
    }
  }
}
