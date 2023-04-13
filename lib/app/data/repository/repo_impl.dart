import 'package:miniapp_codebase/app/data/data_source/remote/api/api_service.dart';
import 'package:miniapp_codebase/app/data/models/base_reponse.dart';
import 'package:miniapp_codebase/app/data/models/first_page_response.dart';
import 'package:miniapp_codebase/app/data/repository/repo.dart';

class RepoImpl implements Repo{
  final _service = ApiService();

  @override
  Future<BaseResponse<FirstPageResponse>> getFirstPageResponse() {
    return _service.getFirstPageResponse();
  }
}