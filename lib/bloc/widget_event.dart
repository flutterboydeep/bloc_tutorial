// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widget_bloc.dart';

sealed class WidgetEvent {
  WidgetEvent();
  @override
  List<Object?> get props => [];
}

class OnOffNotificationEvent extends WidgetEvent {}

class SliderEvent extends WidgetEvent {
  double sliderValue;
  SliderEvent({
    required this.sliderValue,
  });
  List<Object?> get props => [sliderValue];
}
