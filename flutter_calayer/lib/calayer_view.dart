import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calayer/calayer_event.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'calayer_bloc.dart';
import 'calayer_state.dart';
import 'package:sprintf/sprintf.dart';

class CALayerPlayer extends StatefulWidget {
  @override
  _CALayerPlayerState createState() => _CALayerPlayerState();
}

class _CALayerPlayerState extends State<CALayerPlayer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: blocCALayer,
      builder: (BuildContext context, CALayerState state) {
        return Container(
          child: Column(
            children: <Widget>[
              /// Preview Panel
              _buildPreviewPanel(context, state),
              Container(
                height: 1.0,
                color: Colors.grey,
              ),
              Container(
                  color: Colors.brown,
                  height: 50.0,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        'PROPERTIES',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),

              /// Properties list
              _buildPropertiesList(context, state)
            ],
          ),
        );
      },
    );
  }

  /// Show Color Picker
  _showColorPicker(
      String title, Color currentValue, ValueChanged<Color> callback) {
    /*
         MaterialColorPicker(
                onColorChange: callback,
                selectedColor: currentValue,
              )
          */
    showDialog(
        context: this.context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ColorPicker(
                onColorChanged: callback,
                pickerColor: currentValue,
                colorPickerWidth: 300.0,
              ),
            ),
          );
        });
  }

  /// Build Property list
  _buildPropertiesList(BuildContext ctx, CALayerState state) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          // Content Alignment
          _buildPickerItem(
              "Content Alignment", state.contentAlignment.toString(), () {}),

          // Opacity
          _buildSliderItem("Opacity", state.opacity, 0.0, 1.0, (value) {
            CALayerChangeOpacityEvent event = CALayerChangeOpacityEvent(value);
            blocCALayer.dispatch(event);
          }),

          // Border Width
          _buildSliderItem("Border Width", state.borderWidth, 0.0, 100.0,
              (value) {
            CALayerChangeBorderWidthEvent event =
                CALayerChangeBorderWidthEvent(value);
            blocCALayer.dispatch(event);
          }),

          // Border Color
          _buildColorItem("Border Color", state.borderColor, () {
            this._showColorPicker("Border Color", state.borderColor, (value) {
              CALayerChangeBorderColorEvent event =
                  CALayerChangeBorderColorEvent(value);
              blocCALayer.dispatch(event);
            });
          }),

          // Background color

          _buildColorItem("Background Color", state.backgroundColor, () {
            this._showColorPicker("Background Color", state.backgroundColor,
                (value) {
              CALayerChangeBackgroundColorEvent event =
                  CALayerChangeBackgroundColorEvent(value);
              blocCALayer.dispatch(event);
            });
          }),

          // Shadow color

          _buildColorItem("Shadow Color", state.shadowColor, () {
            this._showColorPicker("Shadow Color", state.shadowColor, (value) {
              CALayerChangeShadowColorEvent event =
                  CALayerChangeShadowColorEvent(value);
              blocCALayer.dispatch(event);
            });
          }),

          // shadow offset
        ],
      ),
    );
  }

  /// Build Toogle Item
  _buildToggleItem(String title, bool value, ValueChanged<bool> callback) {
    return Container(
      height: 50.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  CupertinoSwitch(
                    activeColor: Colors.blue,
                    value: value,
                    onChanged: callback,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  /// Build Picker Items
  _buildPickerItem(String title, String value, VoidCallback callback) {
    return Container(
      height: 50.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  // label title
                  Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  // label value
                  GestureDetector(
                    onTap: callback,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  /// Build Slider Item
  _buildSliderItem(String title, double value, double min, double max,
      ValueChanged<double> callback) {
    String stringValue = sprintf('%2.0f', [value]);
    if (max == 1.0) {
      stringValue = sprintf('%2.0f', [value * 100]);
    }
    return Container(
      height: 50.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        stringValue,
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      CupertinoSlider(
                        onChanged: callback,
                        value: value,
                        min: min,
                        max: max,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  /// Build Color Item
  _buildColorItem(String title, Color value, VoidCallback callback) {
    return Container(
      height: 50.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: callback,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                              color: value,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  /// Build Preview Panel
  _buildPreviewPanel(BuildContext ctx, CALayerState state) {
    double radius = MediaQuery.of(ctx).size.width / 2;

    return Container(
      color: Colors.amber,
      height: MediaQuery.of(ctx).size.width * 2 / 3,
      child: Center(
        child: Container(
            width: radius,
            height: radius,
            child: Center(
              child: Align(
                alignment: state.contentAlignment,
                child: Container(
                  width: radius / 2,
                  height: radius / 2,
                  child: Image.asset(
                    "resources/icon_heo.png",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                    width: state.borderWidth, color: state.borderColor),
                color: state.backgroundColor
                    .withAlpha((state.opacity * 100).toInt()),
                borderRadius: BorderRadius.circular(radius / 2),
                boxShadow: [
                  BoxShadow(
                    color: state.shadowColor,
                    blurRadius: 20.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow
                    offset: Offset(
                      state.shadowOffset.x, // horizontal, move right 10
                      state.shadowOffset.y, // vertical, move down 10
                    ),
                  )
                ])),
      ),
    );
  }
}
