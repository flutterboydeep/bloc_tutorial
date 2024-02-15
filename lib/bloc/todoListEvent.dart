import 'package:equatable/equatable.dart';

abstract class TodoListEvent extends Equatable {}

class AddTitleEvent extends TodoListEvent {
  final String title;
  AddTitleEvent({required this.title});
  @override
  List<Object?> get props => [title];
}

class DeletTitleEvent extends TodoListEvent {
  final int DelIndex;
  DeletTitleEvent({required this.DelIndex});
  @override
  List<Object?> get props => [DelIndex];
}

class UpdateTitleEvent extends TodoListEvent {
  final String UpdateTitle;
  final int updateIndex;
  UpdateTitleEvent({required this.UpdateTitle, required this.updateIndex});
  List<Object?> get props => [UpdateTitle, updateIndex];
}
