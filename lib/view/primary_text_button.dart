import 'package:flutter/cupertino.dart';
import 'package:newcase/styles/styles.dart';

/// [CupertinoButton] wrapper
class PrimaryTextButton extends StatelessWidget {
  /// {@macro primary_text_button}
  const PrimaryTextButton({
    key,
    this.padding,
    required this.text,
    this.style,
    this.onTap,
  }) : super(key: key);

  /// Button padding
  final EdgeInsets? padding;

  /// Button title
  final String text;

  /// Button title text style
  final TextStyle? style;

  /// on tap callback
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
          text,
          style: style ?? $style.texts.subHeadline,
        ),
      ),
    );
  }
}
