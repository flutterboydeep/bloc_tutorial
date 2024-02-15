// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/Data/data_repo.dart';
import 'package:learn_bloc/bloc/todoList_bloc.dart';

// TodoListBloc updateValue = TodoListBloc(DataRepo as DataRepo);

class TodoListState extends Equatable {
  // final update=BlocProvider.of<TodoListBloc>(context).
  final List<String> Addtitle;
  final String updateTextShow;
  TodoListState({this.Addtitle = const [], this.updateTextShow = ''});

  // TodoListState copyWith({List<String?>Addtitle}) {
  //   return TodoListState(Addtitle: this.Addtitle);
  // }

  TodoListState copyWith({List<String>? Addtitle, String? updateTextShow}) {
    return TodoListState(
      Addtitle: Addtitle ?? this.Addtitle,
      updateTextShow: updateTextShow ?? this.updateTextShow,
    );
  }

  @override
  List<Object?> get props => [Addtitle, updateTextShow];
}

// class showUpdateData extends TodoListState {
//   final String updateTextShow;
//   showUpdateData({this.updateTextShow = ''});

//   showUpdateData copyWith({String? updateTextShow}) {
//     return showUpdateData(
//         updateTextShow: updateTextShow ?? this.updateTextShow);
//   }
// }
