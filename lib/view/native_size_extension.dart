import 'package:flutter/material.dart';

/// heightDesign
const double _heightDesign = 926;

/// widthDesign
const double _widthDesign = 428;

/// NativeSizeExt
extension NativeSizeExt on double {
  /// Get the item's height according to the design's scale
  /// this is item's height in design
  /// [MediaQuery.of(context).size.height] is height screen device
  /// getHeight] = [MediaQuery.of(context).size.height] * this / [_heightDesign]
  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * (this / _heightDesign);
  }

  /// Get the item's width according to the design's scale
  /// this is item's width in design
  /// [MediaQuery.of(context).size.width] is width screen device
  /// [getWidth] = [MediaQuery.of(context).size.width] * this / [_widthDesign]
  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * (this / _widthDesign);
  }
}
