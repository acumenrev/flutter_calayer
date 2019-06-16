import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CALayerState {
  Alignment contentAlignment;
  double borderWidth;
  Color borderColor;
  Color backgroundColor;
  Color shadowColor;
  Point shadowOffset;
  double opacity;

  static const Point _defaultPoint = Point(0.0, 0.0);

  CALayerState(
      {this.contentAlignment = Alignment.center,
      this.borderWidth = 1.0,
      this.borderColor = Colors.grey,
      this.backgroundColor = Colors.green,
      this.shadowColor = Colors.blue,
      this.shadowOffset = _defaultPoint,
      this.opacity = 1.0});

  CALayerState.init() {
    this.contentAlignment = Alignment.center;
    this.borderWidth = 1.0;
    this.borderColor = Colors.grey;
    this.backgroundColor = Colors.green;
    this.shadowColor = Colors.blue;
    this.shadowOffset = _defaultPoint;
    this.opacity = 1.0;
  }

  CALayerState copyWith(
      {Alignment contentAlign,
      double borderWidth,
      Color borderColor,
      Color backgroundColor,
      Color shadowColor,
      Point shadowOffset,
      double opacity}) {
    return CALayerState(
        contentAlignment: contentAlign ?? this.contentAlignment,
        borderWidth: borderWidth ?? this.borderWidth,
        borderColor: borderColor ?? this.borderColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        shadowColor: shadowColor ?? this.shadowColor,
        shadowOffset: shadowOffset ?? this.shadowOffset,
        opacity: opacity ?? this.opacity);
  }
}
