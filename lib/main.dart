import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';
import 'package:miniapp_codebase/app/data/services.dart';
import 'package:miniapp_codebase/app/pages/first_page/screen/first_page_screen.dart';
import 'package:miniapp_codebase/app/pages/home/screens/home_page.dart';


void main() {
  AppServices.init();
  runApp(MyApp());
  MPCore().connectToHostChannel();
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MPApp(
      // title: 'MPFlutter Demo1',
      color: Colors.blue,
      routes: {
        '/': (context) => HomePage(),
        FirstPageScreen.route: (context) => FirstPageScreen(),
      },
      navigatorObservers: [MPCore.getNavigationObserver()],
    );
  }
}
