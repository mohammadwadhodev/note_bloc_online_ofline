import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';
import 'package:mw_todo_notes/data/models/view_data_screen_model.dart';
import 'package:mw_todo_notes/data/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'view_data_state.dart';

class ViewDataCubit extends Cubit<ViewDataState>
{
  final repository = Repository();
  Connectivity _connectivity = Connectivity();
  ViewDataCubit() : super((ViewDataInitial()));

  Future<void> fetchAllPost() async{
    emit(ViewDataLoadingState());
    bool isInternet  = await checkInternet();

print('checking internet ... $isInternet');
      List<ViewDataScreenModel> allPosts = await repository.fetchAllPostsRepo(isInternet);
    emit(ViewDataPostsLoaded(allPostsList: allPosts,isInternetAvailable: isInternet));
    print('length ...... ${allPosts.length}');
    addPostsInOfflineDatabase(allPosts);

  }

  Future<bool> checkInternet()async{
    bool isInternetAvailable = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _connectivity.onConnectivityChanged.listen((result) {


      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi ){
        prefs.setBool('isWifiAvailable',true);

      }else{
        prefs.setBool('isWifiAvailable',false);

      }
    });
    isInternetAvailable = prefs.getBool('isWifiAvailable')!;
    return isInternetAvailable;
  }

  /////// OFFLINE DATABASE PORTION /////////
  void addPostsInOfflineDatabase(List<ViewDataScreenModel> allPosts)async{

    bool isWifiAvailable = await checkInternet();
    if(isWifiAvailable){
      print('length 2...... ${allPosts.length}');
      repository.addRecordOffline(allPosts);
    }
  }




}