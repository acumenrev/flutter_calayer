import 'dart:math';

import 'package:flutter/material.dart';

abstract class CALayerEvent {}

/// user change alignment
class CALayerChangeAlignmentEvent extends CALayerEvent {
  Alignment contentAlignment;

  CALayerChangeAlignmentEvent(this.contentAlignment);
}

/// user change opacity
class CALayerChangeOpacityEvent extends CALayerEvent {
  double opacity;

  CALayerChangeOpacityEvent(this.opacity);
}

/// user change border color
class CALayerChangeBorderColorEvent extends CALayerEvent {
  Color color;

  CALayerChangeBorderColorEvent(this.color);
}

/// user change background color
class CALayerChangeBackgroundColorEvent extends CALayerEvent {
  Color color;

  CALayerChangeBackgroundColorEvent(this.color);
}

/// user change shadow opacity
class CALayerChangeShadowOpacityEvent extends CALayerEvent {
  double opacity;

  CALayerChangeShadowOpacityEvent(this.opacity);
}

// user change shadow offset
class CALayerChangeShadowOffsetEvent extends CALayerEvent {
  Point<double> offset;

  CALayerChangeShadowOffsetEvent(this.offset);
}

/// user change shadow radius
class CALayerChangeShadowRadiusEvent extends CALayerEvent {
  double radius;

  CALayerChangeShadowRadiusEvent(this.radius);
}

class CALayerChangeBorderWidthEvent extends CALayerEvent {
  double width;

  CALayerChangeBorderWidthEvent(this.width);
}

/// user change shadow color
class CALayerChangeShadowColorEvent extends CALayerEvent {
  Color color;

  CALayerChangeShadowColorEvent(this.color);
}

/// user change magnification filter
