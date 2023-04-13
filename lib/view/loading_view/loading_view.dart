import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
import 'package:miniapp_codebase/styles/styles.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key? key,
    this.size,
  }) : super(key: key);

  final Size? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size?.width ?? double.infinity,
        height: size?.height ?? 100,
        child: Center(
          child: MPCircularProgressIndicator(
            color: $style.colors.color0071DA,
          ),
        )
        //  Center(
        //   child: TargetPlatform.android
        //       ? CircularProgressIndicator(
        //           color: _color,
        //         )
        //       : CupertinoActivityIndicator(
        //           radius: 15,
        //           color: _color,
        //         ),
        // ),
        );
  }
}
