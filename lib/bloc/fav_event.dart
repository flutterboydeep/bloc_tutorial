part of 'fav_bloc.dart';

sealed class FavEvent extends Equatable {
  const FavEvent();
  List<Object?> get props => [];
}

class FetchFavourite extends FavEvent {}

class favIconEvent extends FavEvent {
  final FavModel item;
  favIconEvent({required this.item});
  // List<Object> get props => [item];
}

class nextScreenFavEvent extends FavEvent {
  String id;
  String value;
  bool isfav;

  nextScreenFavEvent(
      {required this.id, required this.value, required this.isfav, l});
}

// remove favourite item from the favList
class nextScreenFavRemoveEvent extends FavEvent {
  String id;
  String value;
  bool isfav;
  FavModel fmodel;
  nextScreenFavRemoveEvent(
      {required this.fmodel,
      required this.id,
      required this.value,
      required this.isfav});
}

// delete portion
class SelcteCheckboxItemEvent extends FavEvent {
  final FavModel fmodel;

  SelcteCheckboxItemEvent({required this.fmodel});
}

class UnselcteCheckboxItemEvent extends FavEvent {
  final FavModel fmodel;

  UnselcteCheckboxItemEvent({required this.fmodel});
}

class DeleteItemEvent extends FavEvent {}

class IsCheckboxEvent extends FavEvent {}
