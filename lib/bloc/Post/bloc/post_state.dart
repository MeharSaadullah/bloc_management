part of 'post_bloc.dart';

class PostState extends Equatable {
  final PostStatus postStatus; // here post status come from utils=>enum
  final List<PostModel> postlist; // here <PostModel> come from model=>PostMODEL
  final List<PostModel>
      temppostlist; // here we use this temp list to show the itemm which search
  final String messages;
  final String searchMessage;
  const PostState(
      {this.temppostlist = const <PostModel>[],
      this.messages = "",
      this.searchMessage = "",
      this.postStatus = PostStatus.loading,
      this.postlist = const <PostModel>[]});

  PostState copyWith({
    List<PostModel>? postlist,
    List<PostModel>? temppostlist,
    String? messages,
    String? searchMessage,
    PostStatus? postStatus,
  }) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      temppostlist: temppostlist ?? this.temppostlist,
      postlist: postlist ?? this.postlist,
      messages: messages ?? this.messages,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object> get props =>
      [messages, postStatus, postlist, temppostlist, searchMessage];
}

final class PostInitial extends PostState {}
