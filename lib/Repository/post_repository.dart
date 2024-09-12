import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_management/models/post_models.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    // here we create function which return list of postmodel which we created in model
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final body = json.decode(response.body)
            as List; // here we decode the data as list  which we get from api
        return body.map((e) {
          return PostModel(
              id: e['id'] as int,
              postId: e['postId']
                  as int, // postid name of parameter(variable)in our data in api
              email: e['email'] as String, // here title is parameter
              body: e['body'] as String);
        }).toList(); // here we return in form of list
      }
    } on SocketException {
      throw Exception("ERROR WHILE FETCHING DATA");
    } on TimeoutException {
      throw Exception("Time Out");
    }

    throw Exception("ERROR WHILE FETCHING DATA");
  }
}

// the result from here to go to postbloch inside emit