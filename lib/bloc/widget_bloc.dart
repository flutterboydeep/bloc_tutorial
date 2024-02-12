import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widget_event.dart';
part 'widget_state.dart';

class WidgetBloc extends Bloc<WidgetEvent, InitialState> {
  WidgetBloc() : super(InitialState()) {
    on<OnOffNotificationEvent>(_onOffNotificationEvent);
    on<SliderEvent>(_sliderEvent);
  }

  void _onOffNotificationEvent(
      OnOffNotificationEvent event, Emitter<InitialState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderEvent(SliderEvent event, Emitter<InitialState> emit) {
    emit(state.copyWith(slider: event.sliderValue));
    // emit(state.copyWith(slider: ));
  }
}
