part of 'view_data_cubit.dart';

@immutable
abstract class ViewDataState {}


class ViewDataInitial extends ViewDataState {

}

class ViewDataLoadingState extends ViewDataState{}
class ViewDataFetchingPosts extends ViewDataState{

}
class ViewDataPostsLoaded extends ViewDataState{
  final List<ViewDataScreenModel> allPostsList;
  final bool isInternetAvailable;
  ViewDataPostsLoaded({required this.allPostsList,required this.isInternetAvailable});
}

class NoInternetState extends ViewDataState{}

