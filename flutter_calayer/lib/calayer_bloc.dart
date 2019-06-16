import 'package:bloc/bloc.dart';
import 'package:flutter_calayer/calayer_event.dart';
import 'package:flutter_calayer/calayer_state.dart';

class CALayerBloc extends Bloc<CALayerEvent, CALayerState> {
  @override
  CALayerState get initialState => CALayerState.init();

  @override
  Stream<CALayerState> mapEventToState(
    CALayerEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is CALayerChangeAlignmentEvent) {
      yield this._handleUserChangeAlignment(event);
    } else if (event is CALayerChangeBackgroundColorEvent) {
      yield this._handleUserBackgroundColor(event);
    } else if (event is CALayerChangeShadowColorEvent) {
      yield this._handleUserChangeShadowColor(event);
    } else if (event is CALayerChangeBorderColorEvent) {
      yield this._handleUserChangeBorderColor(event);
    } else if (event is CALayerChangeOpacityEvent) {
      yield this._handleUserChangeOpacity(event);
    } else if (event is CALayerChangeBorderWidthEvent) {
      yield this._handleUserChangeBorderWidth(event);
    }
  }

  _handleUserChangeBorderWidth(CALayerChangeBorderWidthEvent event) {
    return currentState.copyWith(borderWidth: event.width);
  }

  _handleUserChangeAlignment(CALayerChangeAlignmentEvent event) {
    return currentState.copyWith(contentAlign: event.contentAlignment);
  }

  _handleUserChangeOpacity(CALayerChangeOpacityEvent event) {
    return currentState.copyWith(opacity: event.opacity);
  }

  _handleUserChangeBorderColor(CALayerChangeBorderColorEvent event) {
    return currentState.copyWith(borderColor: event.color);
  }

  _handleUserBackgroundColor(CALayerChangeBackgroundColorEvent event) {
    return currentState.copyWith(backgroundColor: event.color);
  }

  _handleUserChangeShadowColor(CALayerChangeShadowColorEvent event) {
    return currentState.copyWith(shadowColor: event.color);
  }
}

final blocCALayer = CALayerBloc();
