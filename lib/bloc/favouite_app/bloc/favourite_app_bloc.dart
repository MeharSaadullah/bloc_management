import 'package:bloc/bloc.dart';
import 'package:bloc_management/Repository/favourite_repository.dart';
import 'package:bloc_management/models/favourite_item_model.dart';

import 'package:equatable/equatable.dart';

part 'favourite_app_event.dart';
part 'favourite_app_state.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  List<FavouriteItemModel> favouriteList =
      []; // this come from repository bcz repository return list // also stored that in favouritelis
  List<FavouriteItemModel> tempList = []; // same as favouritelist

  FavouriteRepository favouriteRepository; // HERE WE DO DEPENDENCY INJECTION
  FavouriteAppBloc(
      this.favouriteRepository) // inside this() is also come as dependenci injection

      : super(FavouriteAppState()) {
    // on<FavouriteAppEvent>((event, emit) {
    //   // TODO: implement event handler
    // }
    // );

    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_UnselectItem);
    on<DeleteItem>(_deleteItem);
  }
  void fetchList(
      FetchFavouriteList event, Emitter<FavouriteAppState> emit) async {
    favouriteList = await favouriteRepository
        .fetchItem(); // here the data (list) come from repository we add that into favouritelist nd then add at top
    emit(state.copyWith(
        favouriteitemList: List.from(favouriteList),
        listStatus: ListStatus
            .success)); // here favitemlist and liststatus comes from Bloc sTATUS // BUT THE VALUE OF BOTH OF THESE COME FROM FAV REPOSITORY SO WE DO DEPENDENCY INJECTION AT TOP
  }

  void _addFavouriteItem(
      FavouriteItem event, Emitter<FavouriteAppState> emit) async {
    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);
    favouriteList[index] = event.item;

    if (event.item.isFavourite) {
      if (tempList.contains(favouriteList[index])) {
        tempList.remove(favouriteList[index]);
        tempList.add(event.item);
      }
    } else {
      if (tempList.contains(favouriteList[index])) {
        tempList.remove(favouriteList[index]);
        tempList.add(event.item);
      }
    }

    emit(state.copyWith(favouriteitemList: List.from(favouriteList)));
  }

  void _selectItem(SelectItem event, Emitter<FavouriteAppState> emit) async {
    tempList.add(event.item);

    emit(state.copyWith(
        tempselectList:
            List.from(tempList))); // tempselectlist come from state bloc
  }

  void _UnselectItem(
      UnSelectItem event, Emitter<FavouriteAppState> emit) async {
    tempList.remove(event.item);
    emit(state.copyWith(tempselectList: List.from(tempList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteAppState> emit) async {
    for (int i = 0; i < tempList.length; i++) {
      favouriteList.remove(tempList[i]);
    }
    tempList.clear();
    emit(state.copyWith(
        favouriteitemList: List.from(favouriteList),
        tempselectList: List.from(tempList)));
  }
}
