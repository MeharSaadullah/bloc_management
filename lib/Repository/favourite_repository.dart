import 'package:bloc_management/models/favourite_item_model.dart';

class FavouriteRepository {
  // FavouriteItemModel  come from class which we have created
  // then we create function fetchItem
  Future<List<FavouriteItemModel>> fetchItem() async {
    // this function return list
    await Future.delayed(Duration(seconds: 3));
    return List.of(
        _generateList(10)); // here we use list of bcz of multiple items
  }

  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(
        length,
        (index) =>
            FavouriteItemModel(id: index.toString(), value: 'Item $index '));
  }
}
