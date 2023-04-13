import 'package:flutter/widgets.dart';

class Divider extends StatelessWidget {
  final double height;
  final double? width;
  final Color color;

  const Divider(this.height, this.color, {Key? key,this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: new Center(
        child: new Container(
          width: width,
          height: height,
          color: color,
        ),
      ),
    );
  }
}
