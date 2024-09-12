import 'package:bloc/bloc.dart';
import 'package:bloc_management/Repository/post_repository.dart';
import 'package:bloc_management/Utils/enum.dart';
import 'package:bloc_management/models/post_models.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> temppostlist = []; // add templi st
  PostRepository postRepository =
      PostRepository(); // here we r initilizing postrepository we can also do dependency injection

  PostBloc() : super(PostState()) {
    // on<PostEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<PostFetch>(fetchpostApi); // postfetch is event
    on<SearchItem>(_searchitem); // searchiteam is event
    //on<>();
  }
  void fetchpostApi(PostFetch event, Emitter<PostState> emit) async {
    await postRepository
        .fetchPost() // this fetchppost function come from repository
        .then((value) {
      emit(state.copyWith(
          // this states come from post  states
          postStatus: PostStatus.success,
          messages: 'success',
          postlist: value));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
          postStatus: PostStatus.failuer, messages: error.toString()));
    });
  }

  void _searchitem(SearchItem event, Emitter<PostState> emit) async {
    // here we handle condition is templist is not empty but their is no data mtched with that serch words then what it will do
    if (event.StSearch.isEmpty) {
      emit(state.copyWith(temppostlist: [], searchMessage: ""));
    } else {
      // here we use logic that if data(id) from postlist is equal to event stsearch show that into list
      // temppostlist = state.postlist
      // .where(
      //     (element) => element.id.toString() == event.StSearch.toString())
      // .toList();

      temppostlist = state.postlist
          .where((element) => element.email.toString().toLowerCase().contains(event
                  .StSearch
              .toLowerCase())) // this is for email  if we write 3 4 charcater it will show us
          .toList();
      if (temppostlist.isEmpty) {
        emit(state.copyWith(
            temppostlist: temppostlist, searchMessage: "No Data Found"));
      } else {
        emit(state.copyWith(temppostlist: temppostlist, searchMessage: ""));
      }
    }
  }
}
