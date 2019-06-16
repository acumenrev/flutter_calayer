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
  }
}

final blocCALayer = CALayerBloc();
