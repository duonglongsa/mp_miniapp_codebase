import 'package:flutter/widgets.dart';
import 'package:newcase/styles/colors.dart';


/// App Style instance
final $style = AppStyle();

/// {@template}
/// App Style
/// {@endtemplate}
@immutable
class AppStyle {
  /// The current theme colors for the app
  late final AppColors colors = AppColors();

  /// Rounded edge corner radius
  late final corners = _Corners();

  /// Border thickness
  late final borderWidth = _BorderWidth();

  /// Padding and margin values
  late final insets = _Insets();

  /// Animation duration
  late final times = _Times();

  /// Icon size
  late final iconSize = _IconSize();

  /// Text style
  late final texts = _Text();
}

@immutable
class _Text {
  final _textStyle = TextStyle(
    // fontFamily: FontFamily.avertaStdCY,
    fontFamily: 'AvertaStdCY',
    color: $style.colors.neutral400,
    package: 'shared',
  );

  late final TextStyle largeTitle = copy(
    _textStyle,
    sizePx: 34,
    heightPx: 41,
    spacingPc: 0.37,
  );

  late final TextStyle largeTitleSemiBold = largeTitle.copyWith(
    fontWeight: FontWeight.w600,
  );

  late final TextStyle largeTitleBold = largeTitle.copyWith(
    fontWeight: FontWeight.w700,
  );

  late final TextStyle title1 = copy(
    _textStyle,
    sizePx: 28,
    heightPx: 34,
    spacingPc: 0.36,
  );

  late final TextStyle title1Bold = title1.copyWith(
    fontWeight: FontWeight.w700,
  );

  late final TextStyle title2 = copy(
    _textStyle,
    sizePx: 22,
    heightPx: 28,
    spacingPc: 0.35,
  );

  late final TextStyle title2Bold = title2.copyWith(
    fontWeight: FontWeight.w700,
  );

  late final TextStyle title3 = copy(
    _textStyle,
    sizePx: 20,
    heightPx: 25,
    spacingPc: 0.35,
  );

  late final TextStyle title3Bold = title3.copyWith(
    fontWeight: FontWeight.w700,
  );

  late final TextStyle body = copy(
    _textStyle,
    sizePx: 17,
    heightPx: 22,
    spacingPc: -0.41,
  );

  late final TextStyle body2 = copy(
    _textStyle,
    sizePx: 14,
    heightPx: 21,
  );

  late final TextStyle body3 = copy(
    _textStyle,
    sizePx: 12,
    heightPx: 18,
  );

  late final TextStyle bodyBold = body.copyWith(
    fontWeight: FontWeight.bold,
  );

  late final TextStyle callout = copy(
    _textStyle,
    sizePx: 16,
    heightPx: 21,
    spacingPc: -0.32,
  );

  late final TextStyle calloutBold = callout.copyWith(
    fontWeight: FontWeight.bold,
  );

  late final TextStyle textField = copy(
    _textStyle,
    sizePx: 14,
    heightPx: 18,
    spacingPc: -0.08,
  );

  late final TextStyle textFieldBold = textField.copyWith(
    fontWeight: FontWeight.bold,
  );

  late final TextStyle footnote = copy(
    _textStyle,
    sizePx: 13,
    heightPx: 18,
    spacingPc: -0.08,
  );

  late final TextStyle footnoteBold = footnote.copyWith(
    fontWeight: FontWeight.bold,
  );

  late final TextStyle caption = copy(
    _textStyle,
    sizePx: 14,
    heightPx: 16,
    spacingPc: 0,
  );

  late final TextStyle captionBold = caption.copyWith(
    fontWeight: FontWeight.bold,
  );

  late final TextStyle caption1 = copy(
    _textStyle,
    sizePx: 12,
    heightPx: 20,
    spacingPc: 0,
  );

  late final TextStyle caption1Bold = caption1.copyWith(
    fontWeight: FontWeight.bold,
  );

  late final TextStyle caption2 = copy(
    _textStyle,
    sizePx: 11,
    heightPx: 13,
    spacingPc: 0,
  );

  late final TextStyle caption2Bold = caption2.copyWith(
    fontWeight: FontWeight.bold,
  );

  late final TextStyle headline = copy(
    _textStyle,
    sizePx: 20,
    heightPx: 17,
    spacingPc: -0.41,
  );

  late final TextStyle headLineBold = headline.copyWith(
    fontWeight: FontWeight.bold,
  );

  late final TextStyle subHeadline = copy(
    _textStyle,
    sizePx: 15,
    heightPx: 20,
    spacingPc: 0.095,
  );

  late final TextStyle subHeadlineBold = subHeadline.copyWith(
    fontWeight: FontWeight.bold,
  );

  TextStyle copy(
    TextStyle style, {
    required double sizePx,
    double? heightPx,
    double? spacingPc,
    FontWeight? weight,
  }) {
    return style.copyWith(
      fontSize: sizePx,
      height: heightPx != null ? (heightPx / sizePx) : style.height,
      letterSpacing:
          spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
      fontWeight: weight,
    );
  }
}

@immutable
class _Corners {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 16;
  late final double xl = 32;

  double pill(double height) {
    return height / 2;
  }

  double circle(double height) {
    return height;
  }
}

@immutable
class _BorderWidth {
  late final double thin = 1;
  late final double medium = 2;
  late final double thick = 3;
}

@immutable
class _Insets {
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 40;
  late final double xxl = 64;
  late final double offset = 80;
}

@immutable
class _Times {
  final Duration extraFast = const Duration(milliseconds: 100);
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration pageTransition = const Duration(milliseconds: 200);
}

@immutable
class _IconSize {
  late final double xs = 12;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
}
