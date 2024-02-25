part of 'fav_bloc.dart';

enum ListStatus { Initial, loading, failure, success }

// sealed class FavState extends Equatable {
//   const FavState();

// @override
// List<Object> get props => [];
// }

class FavInitial extends Equatable {
  final List<FavModel> favItemList;
  final ListStatus listStatus;
  final List<FavModel> showFavModel;
  final List<FavModel> showdeleteCheckBox;
  bool isCheckbox;

  FavInitial({
    this.favItemList = const [],
    this.listStatus = ListStatus.loading,
    this.showFavModel = const [],
    this.showdeleteCheckBox = const [],
    this.isCheckbox = false,
  });

  FavInitial copyWith({
    List<FavModel>? favItemList,
    ListStatus? listStatus,
    List<FavModel>? showFavModel,
    List<FavModel>? showdeleteCheckBox,
    bool? isCheckbox,
  }) {
    return FavInitial(
      favItemList: favItemList ?? this.favItemList,
      listStatus: listStatus ?? this.listStatus,
      showFavModel: showFavModel ?? this.showFavModel,
      showdeleteCheckBox: showdeleteCheckBox ?? this.showdeleteCheckBox,
      isCheckbox: isCheckbox ?? this.isCheckbox,
    );
  }

  List<Object> get props =>
      [favItemList, listStatus, showFavModel, showdeleteCheckBox, isCheckbox];
}
