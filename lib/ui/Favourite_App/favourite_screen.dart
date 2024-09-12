import 'package:bloc_management/bloc/favouite_app/bloc/favourite_app_bloc.dart';
import 'package:bloc_management/models/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteAppBloc>().add(
        FetchFavouriteList()); // here we add this to fetch list from FavouriteAppBloc
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favourite App"), actions: [
        BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
          builder: (context, state) {
            return Visibility(
              visible: state.tempselectList.isNotEmpty ? true : false,
              child: IconButton(
                  onPressed: () {
                    context.read<FavouriteAppBloc>().add(DeleteItem());
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  )),
            );
          },
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return Center(child: CircularProgressIndicator());
              case ListStatus.failuer:
                return Text("SomeThing Went Wrong");
              case ListStatus.success:
                return ListView.builder(
                    itemCount: state.favouriteitemList
                        .length, //favouriteitemList come from bloc state
                    itemBuilder: (context, index) {
                      final item = state.favouriteitemList[index];
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                              value: state.tempselectList.contains(item)
                                  ? true
                                  : false,
                              onChanged: (value) {
                                if (value!) {
                                  context
                                      .read<FavouriteAppBloc>()
                                      .add(SelectItem(item: item));
                                } else {
                                  context
                                      .read<FavouriteAppBloc>()
                                      .add(UnSelectItem(item: item));
                                }
                              }),
                          title: Text(item.value.toString()),
                          trailing: IconButton(
                              onPressed: () {
                                FavouriteItemModel itemModel =
                                    FavouriteItemModel(
                                        id: item
                                            .id, // item come from bloc event
                                        value: item.value,
                                        isFavourite:
                                            item.isFavourite ? false : true);
                                context
                                    .read<FavouriteAppBloc>()
                                    .add(FavouriteItem(item: itemModel));
                              },
                              icon:
                                  Icon(item.isFavourite // if item.is favourite
                                      ? Icons.favorite
                                      : Icons.favorite_outline)),
                        ),
                      );
                    });
            }
          },
        ),
      ),
    );
  }
}
