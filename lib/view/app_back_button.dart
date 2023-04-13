import 'package:flutter/cupertino.dart';

/// Back button
class AppBackButton extends StatelessWidget {
  /// {@macro back_button}
  const AppBackButton({
    key,
    this.onBackPressed,
    this.color,
  }): super(key: key);

  /// onBackPressed callback
  final VoidCallback? onBackPressed;

  /// Color icon
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBackPressed ??
          () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
      child: Image.asset('assets/icons/ic_arrow_left.png',
        // color: $style.colors.primary400,
        width: 24, 
        height: 24,
      )
    );
  }
}
