import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:mw_todo_notes/data/models/view_data_screen_model.dart';
import 'database.dart';


class ApiProvider {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/');
  Future<List<ViewDataScreenModel>> fetchAllPostsProv()async {
    List<ViewDataScreenModel> allPosts=[];
    final response = await http.get(url);
    if(response.statusCode == 200){
      var convertedData = convert.jsonDecode(response.body);
      for(var data in convertedData){
        allPosts.add(ViewDataScreenModel.fromJson(data));
      }
      return allPosts;
    }else{
      throw Exception();
    }
  }


}