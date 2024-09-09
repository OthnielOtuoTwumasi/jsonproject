import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:anotherjsonproject/model/comment_model.dart';

class CommentServices{
  static const String BASE_URL = "https://jsonplaceholder.typicode.com/";

  Future<List<Comment>> fetchData () async{
    final response = await http.get(Uri.parse("$BASE_URL/comments"));
    if(response.statusCode == 200){
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data)=> Comment.fromJson(data)).toList();
    }else{
      throw Exception("error");
    }
}
}