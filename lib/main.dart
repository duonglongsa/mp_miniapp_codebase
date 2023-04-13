import 'package:flutter/widgets.dart';
import 'package:mpcore/mpcore.dart';
import 'package:newcase/app/data/services.dart';
import 'package:newcase/app/pages/first_page/screens/first_page_screen.dart';
import 'package:newcase/app/pages/home/screens/home_page.dart';


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
