import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:newcase/app/pages/first_page/screens/first_page_screen.dart';
import 'package:newcase/utils/token_local_data_source.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    key,
  }) : super(key: key);

  /// Home route
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    getInitParams().then((value) async {
      var accessToken;
      var refreshToken;
      if (value != null &&
          value['accessToken'] != null &&
          value['refreshToken'] != null) {
        accessToken = value['accessToken'];
        refreshToken = value['refreshToken'];
      } else {
        accessToken = "";
        refreshToken = "";
      }
      final SharedPreferencesTokenLocalDataSource _iTokenLocalDataSource =
          SharedPreferencesTokenLocalDataSource();
      if (accessToken.toString().isNotEmpty &&
          refreshToken.toString().isNotEmpty) {
        final cacheAccessToken =
            await _iTokenLocalDataSource.cacheAccessToken(token: accessToken);
        final cacheRefreshToken =
            await _iTokenLocalDataSource.cacheRefreshToken(token: refreshToken);
      }
    });
    return MPScaffold(
        body: Center(
      child: GestureDetector(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.redAccent,
          child: Text("Navigate to first page"),
        ),
        onTap: () => Navigator.pushNamed(
          context,
          FirstPageScreen.route,
        ),
      ),
    ));
  }
}
