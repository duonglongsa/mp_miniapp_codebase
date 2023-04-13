
import 'package:newcase/app/data/models/base_reponse.dart';

abstract class Repo {
  //abtract repo func in here
  // Future<HistoryResponse?> getHistoryGiftList({
  //   int? size,
  //   int? type,
  //   int? page,
  //   String? fromDate,
  //   String? toDate,
  // });

  Future<BaseResponse> getFirstPageResponse();

}