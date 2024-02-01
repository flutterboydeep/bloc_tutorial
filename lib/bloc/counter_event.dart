// import 'package:flutter_bloc/flutter_bloc.dart';
part of 'counter_bloc.dart';

sealed class CounterEvent {}

final class CounterIncrementedEvent extends CounterEvent {}

final class CounterDecrementEvent extends CounterEvent {}
