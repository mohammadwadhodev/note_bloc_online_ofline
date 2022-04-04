import 'package:mw_todo_notes/data/models/view_data_screen_model.dart';
import 'package:mw_todo_notes/data/provider/api_provider.dart';
import 'package:mw_todo_notes/data/provider/database.dart';
import 'package:connectivity/connectivity.dart';

class Repository{

  var apiProvider = ApiProvider();
  void addRecordOffline(List<ViewDataScreenModel> allPosts){
    print('length 3...... ${allPosts.length}');
    DBHelper.addAllRecordOffline(allPosts);
  }


  Future<List<ViewDataScreenModel>> fetchAllPostsRepo(bool isInternet)async{
    List<ViewDataScreenModel> allPosts = [];
    if(isInternet==true){
      allPosts = await apiProvider.fetchAllPostsProv();
    }else{
      allPosts = await DBHelper.fetchAllPostsProv();
      print('length @@@@@@@@ ${allPosts.length}');
    }
    return allPosts;
  }








}

