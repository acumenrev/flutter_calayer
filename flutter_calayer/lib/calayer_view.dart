import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'calayer_bloc.dart';
import 'calayer_state.dart';

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

  /// Build Property list
  _buildPropertiesList(BuildContext ctx, CALayerState state) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          _buildPickerItem('Hello World', 'Right Value', () {}),
          _buildToggleItem('toggle', true, (value) {}),
          _buildSlidersItem('Slider'),
          _buildColorItem('Color Picker', Colors.green, () {})
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
  _buildSlidersItem(String title) {
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
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Description',
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        CupertinoSlider(
                          onChanged: (double value) {},
                          value: 0.5,
                        ),
                        SizedBox(
                          width: 5.0,
                        )
                      ],
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
                color: state.backgroundColor,
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
