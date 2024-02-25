// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class FavModel extends Equatable {
  final String id;
  final String value;

  late final bool isFavourite;
  final bool isDelete;

  FavModel({
    required this.id,
    required this.value,
    this.isFavourite = false,
    this.isDelete = false,
  });

  FavModel copyWith({
    String? id,
    String? value,
    bool? isFavourite,
    bool? isDelete,
  }) {
    return FavModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isFavourite: isFavourite ?? this.isFavourite,
      isDelete: isDelete ?? this.isDelete,
    );
  }

  List<Object?> get props => [
        id,
        value,
        isFavourite,
        isDelete,
      ];
}
