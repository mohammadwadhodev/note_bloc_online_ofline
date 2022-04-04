import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mw_todo_notes/constants/routes_variables.dart';
import 'package:mw_todo_notes/routes.dart';
import 'blocs/view_bloc/view_data_cubit.dart';
void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context)=>ViewDataCubit()),
        ],
        child: const MaterialApp(
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: kViewData,
        ))
  );
}

