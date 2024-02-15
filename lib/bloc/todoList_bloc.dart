import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_bloc/Data/data_repo.dart';

import 'package:learn_bloc/bloc/todoListEvent.dart';
import 'package:learn_bloc/bloc/todoList_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final List<String> dataList = [];
  final DataRepo dataRepo;

  TodoListBloc(this.dataRepo) : super(TodoListState()) {
    on<AddTitleEvent>(_addTitle);
    on<DeletTitleEvent>(_delTitle);
    on<UpdateTitleEvent>(_updateTitle);
  }
  void _addTitle(AddTitleEvent event, Emitter<TodoListState> emit) {
    // final addedTitle = event.title;
    // final updatedList = List<String>.from(state.Addtitle)..add(addedTitle);
    //  emit(state.copyWith(Addtitle: updatedList));

    // or

    dataList.add(event.title);
    emit(state.copyWith(Addtitle: List.from(dataList)));

    // final repoListData = dataRepo.AddDatarepoFun(event);
    // log("This is  repo $repoListData");

    // emit(state.copyWith(Addtitle: List.from(repoListData)));
  }

  void _delTitle(DeletTitleEvent event, Emitter<TodoListState> emit) async {
    dataList.removeAt(event.DelIndex);
    emit(state.copyWith(Addtitle: List.from(dataList)));
  }

  void _updateTitle(UpdateTitleEvent event, Emitter<TodoListState> emit) async {
    dataList[event.updateIndex] = event.UpdateTitle;
    emit(state.copyWith(Addtitle: List.from(dataList)));

    final updateValue = dataList[event.updateIndex];
    // log("this is updatedvalue $updateValue");

    emit(state.copyWith(updateTextShow: updateValue));
  }
}

//   Stream<TodoState> mapEventToState(TodoEvent event) async* {
//     if (event is AddTodoEvent) {
//       yield state.copyWith(todos: List.of(state.todos)..add(event.todo));
//     } else if (event is UpdateTodoEvent) {
//       yield state.copyWith(
//           todos: List.of(state.todos)..[event.index] = event.updatedTodo);
//     } else if (event is DeleteTodoEvent) {
//       yield state.copyWith(
//           todos: List.of(state.todos)..removeAt(event.index));
//     }
//   }
// }
