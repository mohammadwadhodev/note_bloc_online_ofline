import 'package:mw_todo_notes/data/models/view_data_screen_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite_common/sqlite_api.dart';

class DBHelper{
  static Future<Database> database() async{
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath,'social'),
    onCreate: (db,version){
      return db.execute('create table posts(id INTEGER PRIMARY KEY, title text, body text)');
    },version: 1);
  }

  static addAllRecordOffline(List<ViewDataScreenModel> allPosts) async {
    final database = await DBHelper.database();
    print('length 4...... ${allPosts.length}');

    for(int i = 0; i<15; i++){

      // await database.delete(
      //   'posts',
      //   // Use a `where` clause to delete a specific dog.
      //   where: 'id = ?',
      //   // Pass the Dog's id as a whereArg to prevent SQL injection.
      //   whereArgs: [allPosts[i].id],
      // );
      var result = await database.query(
          'posts', where: 'id = ?', whereArgs: [allPosts[i].id]);


      if (result.isEmpty) {
        var res = await database.insert('posts', allPosts[i].toJson());
        if (res == 0) return throw Exception('FAILED TO INSERT .......');
        allPosts[i].id = res;
        print('$i downloaded');
         return allPosts[i];

      } else {
        print('$i already exist');
        // return throw Exception('ALREADY EXISTS........');
      }

    }

  }

  static fetchAllPostsProv() async {
    List<ViewDataScreenModel> allPosts=[];
    final database = await DBHelper.database();
    var response = await database.query('posts');
    if(response.isNotEmpty){
      for(var data in response){
        allPosts.add(ViewDataScreenModel.fromJson(data));
      }
      return allPosts;
    }else{
      return throw Exception('there is no data');
    }

  }


}