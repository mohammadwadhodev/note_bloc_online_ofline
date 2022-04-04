import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mw_todo_notes/blocs/view_bloc/view_data_cubit.dart';

class ViewDataScreen extends StatefulWidget {
  const ViewDataScreen({Key? key}) : super(key: key);

  @override
  _ViewDataScreenState createState() => _ViewDataScreenState();
}

class _ViewDataScreenState extends State<ViewDataScreen> {
  @override
  Widget build(BuildContext context) {
     BlocProvider.of<ViewDataCubit>(context).fetchAllPost();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          actions:  [
            Padding(
                padding: const EdgeInsets.all(14.0),
                child: BlocBuilder<ViewDataCubit, ViewDataState>(
                  builder: (context, state) {
                    if(state is ViewDataPostsLoaded){
                      return  state.isInternetAvailable==true?
                      const Text('online',style: TextStyle(
                          fontSize: 20,
                          color: Colors.green),)
                          :const Text('offline',style: TextStyle(
                          fontSize: 20,
                          color: Colors.red),);

                    }
                    return const Text("");

                  },
                ))

          ],
        ),
        body: RefreshIndicator(
          onRefresh: BlocProvider
              .of<ViewDataCubit>(context).fetchAllPost,
          child: BlocBuilder<ViewDataCubit, ViewDataState>(
            builder: (context, state) {
              if (state is ViewDataLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ViewDataPostsLoaded) {
                final posts = state.allPostsList;
                return ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(posts[index].title),
                          ),
                          const SizedBox(
                              height: 200,
                              child: Text('there was image....'))
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Text('There is no any post');
              }
            },
          ),
        ));
  }
}
