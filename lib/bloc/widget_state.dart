// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable
part of 'widget_bloc.dart';

class InitialState extends Equatable {
  bool isSwitch;
  double slider;
  InitialState({this.isSwitch = false, this.slider = 1.0});

  InitialState copyWith({bool? isSwitch, double? slider}) {
    return InitialState(
      isSwitch: isSwitch ?? this.isSwitch,
      slider: slider ?? this.slider,
    );
  }

  @override
  List<Object?> get props => [isSwitch, slider];
}

class OnNotificationState extends InitialState {
  final String Status;

  OnNotificationState({required this.Status});
  List<Object?> get props => [Status];
}

class OffNotificationState extends InitialState {
  final String Status;

  OffNotificationState({required this.Status});
  List<Object?> get props => [Status];
}

// class OffNotificationState extends WidgetState {}

// class ErrorState extends WidgetState {
//   final String Error;
//   ErrorState({required this.Error});
//   List<Object?> get props => [Error];
// }
