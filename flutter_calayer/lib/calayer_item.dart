import 'dart:ui';

import 'package:meta/meta.dart';

enum PropertyItemType { picker, slider, toggle, color }

class CALayerPropertyItem {
  PropertyItemType type;
  String title;

  CALayerPropertyItem({@required this.type, this.title});
}

class CALayerColorPropertyItem extends CALayerPropertyItem {
  Color value;

  CALayerColorPropertyItem.init(String title, Color value) {
    this.title = title;
    this.type = PropertyItemType.color;
    this.value = value;
  }
}

class CALayerPickerPropertyItem extends CALayerPropertyItem {
  List<dynamic> options;
  dynamic value;

  CALayerPickerPropertyItem.init(
      String title, List<dynamic> options, dynamic value) {
    this.type = PropertyItemType.picker;
    this.title = title;
    this.options = options;
    this.value = value;
  }
}

class CALayerTogglePropertyItem extends CALayerPropertyItem {
  bool value;

  CALayerTogglePropertyItem.init(String title, bool value) {
    this.title = title;
    this.type = PropertyItemType.toggle;
    this.value = value;
  }
}

class CALayerSliderPropertyItem extends CALayerPropertyItem {
  double value;
  double min;
  double max;

  CALayerSliderPropertyItem.init(
      String title, double value, double min, double max) {
    assert(max < min);
    this.title = title;
    this.min = min;
    this.max = max;
    this.type = PropertyItemType.slider;
    this.value = value;
  }
}
