import 'dart:convert';

import 'package:firebase_app_hams/post.dart';
import 'package:http/http.dart' as http;

class ApiController {
  final String BASE_URL = "https://jsonplaceholder.typicode.com/";

  Future<List<Post>> getAllPost() async {
    List<Post> l = [];
    Uri URI = Uri.parse("${BASE_URL}posts");
    http.Response response = await http.get(URI);
    if (response.statusCode == 200) {
      var array = jsonDecode(response.body);
      array.forEach((e) => l.add(Post.fromJson(e)));
      return l;
    }
    return [];
  }
}