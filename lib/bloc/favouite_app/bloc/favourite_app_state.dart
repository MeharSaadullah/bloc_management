// favitemlist and liststatus passed from here

part of 'favourite_app_bloc.dart';

enum ListStatus { loading, success, failuer } // for checking the list

class FavouriteAppState extends Equatable {
  final List<FavouriteItemModel> favouriteitemList;
  final List<FavouriteItemModel> tempselectList;
  final ListStatus listStatus;
  const FavouriteAppState(
      {this.favouriteitemList = const [],
      this.tempselectList = const [],
      this.listStatus = ListStatus.loading});

  FavouriteAppState copyWith(
      {List<FavouriteItemModel>? favouriteitemList,
      List<FavouriteItemModel>? tempselectList,
      ListStatus? listStatus}) {
    return FavouriteAppState(
      favouriteitemList: favouriteitemList ?? this.favouriteitemList,
      tempselectList: tempselectList ?? this.tempselectList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object> get props => [favouriteitemList, listStatus, tempselectList];
}

final class FavouriteAppInitial extends FavouriteAppState {}
