import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_bloc/r_model/favModel.dart';
import 'package:learn_bloc/repo/data_repo.dart';

part 'fav_event.dart';
part 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavInitial> {
  List<FavModel> favList = [];
  final List<FavModel> favdataList = [];
  final List<FavModel> removeIconfav = [];
  final List<FavModel> checkBoxSelectedList = [];

  favRepo favRepoItem;
  FavBloc(this.favRepoItem) : super(FavInitial()) {
    on<FetchFavourite>(favEvent);
    on<favIconEvent>(_favIconEvent);
    on<nextScreenFavEvent>(_nextScreenFavEvent);
    on<nextScreenFavRemoveEvent>(_nextScreenFavRemoveEvent);
    on<SelcteCheckboxItemEvent>(_selcteCheckboxItemEvent);
    on<UnselcteCheckboxItemEvent>(_unselcteCheckboxItemEvent);
    on<DeleteItemEvent>(_deleteItemEvent);
    on<IsCheckboxEvent>(_isCheckBoxEvent);
  }

  void favEvent(FetchFavourite event, Emitter<FavInitial> emit) async {
    favList = await favRepoItem.fatchItem();
    emit(state.copyWith(
        favItemList: List.from(favList), listStatus: ListStatus.success));
  }

  void _favIconEvent(favIconEvent event, Emitter<FavInitial> emit) {
    final index = favList.indexWhere((element) {
      // print("This is element $element");
      // print("This is element id ${element.id}");

      // print("This is event item id ${event.item.id}");
      return element.id == event.item.id;
    });

    // log("The value of event.item.isfav= ${event.item.isFavourite}");
    // log("The value of checkBoxSelectedList.contains(favList[index])= ${checkBoxSelectedList.contains(favList[index])}");
    // checkBoxSelectedList.remove(favList[index]);
    // log("The value of  checkBoxSelectedList.remove(favList[index]= $checkBoxSelectedList}");
    // checkBoxSelectedList.add(event.item);
    // log("The value of checkBoxSelectedList.add(event.item)= ${checkBoxSelectedList}");

    // favList[index] = event.item;
    // bug solve
    if (event.item.isFavourite) {
      if (checkBoxSelectedList.contains(favList[index])) {
        checkBoxSelectedList.remove(favList[index]);
        checkBoxSelectedList.add(event.item);
      }
    } else {
      if (checkBoxSelectedList.contains(favList[index])) {
        checkBoxSelectedList.remove(favList[index]);
        checkBoxSelectedList.add(event.item);
      }
    }
    favList[index] = event.item;

    emit(state.copyWith(
        favItemList: List.from(favList),
        showdeleteCheckBox: List.from(checkBoxSelectedList)));
  }

  void _nextScreenFavEvent(nextScreenFavEvent event, Emitter<FavInitial> emit) {
    if (event.isfav == false) {
      // this value work properly if we write backword condition

      favdataList.add(FavModel(id: event.id, value: event.value));
    } else {
      favdataList.remove(FavModel(
        id: event.id,
        value: event.value,
      ));
    }
    emit(state.copyWith(showFavModel: List.from(favdataList)));
  }

  void _nextScreenFavRemoveEvent(
      nextScreenFavRemoveEvent event, Emitter<FavInitial> emit) {
    favdataList.remove(FavModel(
      id: event.id,
      value: event.value,
      isDelete: false,
      isFavourite: !event.isfav,
    ));
    final index = favList.indexWhere((element) {
      return element.id == event.id;
    });
    favList[index] = FavModel(id: event.id, value: event.value);

    emit(state.copyWith(
        showFavModel: List.from(favdataList), favItemList: List.from(favList)));
  }

  // delete portion here

  void _selcteCheckboxItemEvent(
      SelcteCheckboxItemEvent event, Emitter<FavInitial> emit) {
    checkBoxSelectedList.add(event.fmodel);
    emit(state.copyWith(showdeleteCheckBox: List.from(checkBoxSelectedList)));
  }

  void _unselcteCheckboxItemEvent(
      UnselcteCheckboxItemEvent event, Emitter<FavInitial> emit) {
    checkBoxSelectedList.remove(event.fmodel);
    emit(state.copyWith(showdeleteCheckBox: List.from(checkBoxSelectedList)));
  }

  void _deleteItemEvent(DeleteItemEvent event, Emitter<FavInitial> emit) {
    if (checkBoxSelectedList.isEmpty) {
      state.isCheckbox = false;
    } else {
      for (int i = 0; i < checkBoxSelectedList.length; i++) {
        favdataList.remove(FavModel(
            id: checkBoxSelectedList[i].id,
            value: checkBoxSelectedList[i].value,
            isFavourite: false));
        favList.remove(checkBoxSelectedList[i]);
        log('The value of checkboxselect list item is ${checkBoxSelectedList[i]}');
      }
      checkBoxSelectedList.clear();
    }
    // favList.removeRange(0, (checkBoxSelectedList.length));
    log("The store value of favdataList is $favdataList");
    emit(
      state.copyWith(
          favItemList: List.from(favList),
          showFavModel: List.from(favdataList),
          showdeleteCheckBox: List.from(checkBoxSelectedList),
          isCheckbox: false),
    );
  }

  void _isCheckBoxEvent(IsCheckboxEvent event, Emitter<FavInitial> emit) {
    emit(state.copyWith(isCheckbox: !state.isCheckbox));
  }
}
