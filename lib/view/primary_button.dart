import 'package:flutter/cupertino.dart';
import 'package:mpcore/mpcore.dart';
import 'package:miniapp_codebase/styles/styles.dart';

/// {@template primary_button}
/// Primary button
/// {@endtemplate}
class PrimaryButton extends StatelessWidget {
  /// {@macro primary_button}
  const PrimaryButton({
    key,
    this.onTap,
    required this.title,
    this.height,
    this.width,
    this.padding,
    this.borderRadius = 8,
    this.enabled = true,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.titleStyle,
    this.margin
  }) : super(key: key);

  /// On tap callback
  final VoidCallback? onTap;

  /// Button title
  final String title;

  /// Button height
  final double? height;

  /// Button width
  final double? width;

  /// Button insets
  final EdgeInsets? padding;
  /// Button insets
  final EdgeInsets? margin;

  /// Button border radius
  final double borderRadius;

  /// Button state
  final bool enabled;

  /// Button state
  final bool isLoading;

  /// Prefix widget (Icon add, save,...)
  final Widget? prefixIcon;

  /// Suffix widget
  final Widget? suffixIcon;

  /// Background color
  final Color? backgroundColor;

  /// Title style
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        child: Container(
          margin: margin ?? EdgeInsets.zero,
          padding: padding ?? EdgeInsets.symmetric(vertical: 12),
          height: height,
          // height: height ?? 42,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular($style.corners.md),
            color: backgroundColor ?? $style.colors.primary400,
            // disabledColor: $style.colors.neutral100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null) prefixIcon!,
              if (prefixIcon != null) const SizedBox(width: 10),
              Text(
                title,
                style: titleStyle ??
                    $style.texts.bodyBold.copyWith(
                      color: $style.colors.whileColorN0,
                    ),
              ),
              if (suffixIcon != null) const SizedBox(width: 8),
              if (isLoading) const SizedBox(width: 18),
              if (isLoading)
                MPCircularProgressIndicator(
                  color: $style.colors.neutral0,
                  size: $style.iconSize.sm,
                )
              else if (suffixIcon != null)
                suffixIcon!,
            ],
          ),
        ),
      ),
    );
  }
}
