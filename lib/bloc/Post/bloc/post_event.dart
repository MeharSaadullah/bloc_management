part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostFetch extends PostEvent {}

class SearchItem extends PostEvent {
  final String StSearch;
  SearchItem(this.StSearch);
}
