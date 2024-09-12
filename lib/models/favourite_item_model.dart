// this model code is matched with bloc status code

import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;

  const FavouriteItemModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavourite = false,
  });
// copy with is used to create new instance
// when we do changing in the values then we are copywith it works as setstate
  FavouriteItemModel copyWith(
      {String? id, String? value, bool? isDeleting, bool? isFavourite}) {
    return FavouriteItemModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isDeleting: isDeleting ?? this.isDeleting,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, value, isDeleting, isFavourite];
}
