import 'package:miniapp_codebase/app/data/data_source/local/token_local_data_source.dart';

final ITokenLocalDataSource _iTokenLocalDataSource = SharedPreferencesTokenLocalDataSource();

class ApiConfig {
  static Future<String?> get accessToken => _iTokenLocalDataSource.getAccessToken();
  static const String baseUrl = "https://api-sandbox.mbbank.com.vn/";
  static const String firstPageUrl = "first_page_url";

}