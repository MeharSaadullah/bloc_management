//.....states........
// message
// postlist
// poststatus

//......enum poststatus.....
// loading
// failuer
// success

//......these parameters comes from postrepository
// email
// id
// body
// etc

import 'package:bloc_management/Utils/enum.dart';
import 'package:bloc_management/bloc/Post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  // here we use init methood tonused the postfetch  event
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Api's"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) // checkinf states from poststaus=>enum
          {
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());

            case PostStatus.failuer:
              return Center(child: Text(state.messages.toString()));

            case PostStatus.success:
              return Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Search With Email",
                        border: OutlineInputBorder()),
                    onChanged: (filterkey) {
                      context.read<PostBloc>().add(SearchItem(filterkey));
                    },
                  ),
                  Expanded(
                    child: state.searchMessage.isNotEmpty
                        ? Center(child: Text(state.searchMessage.toString()))
                        : ListView.builder(
                            itemCount: state.temppostlist
                                    .isEmpty // if templist is emty show postlist
                                ? state.postlist.length
                                : state.temppostlist
                                    .length, // if not empty then shoe templist lenght which we search
                            itemBuilder: (context, index) {
                              if (state.temppostlist.isNotEmpty) {
                                final item = state.temppostlist[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item.email.toString()),
                                    subtitle: Text(item.body.toString()),
                                  ),
                                );
                              } else {
                                final item = state.postlist[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item.email.toString()),
                                    subtitle: Text(item.body.toString()),
                                  ),
                                );
                              }
                            }),
                  )
                ],
              );
          }
        },
      ),
    );
  }
}
