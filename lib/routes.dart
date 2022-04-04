import 'package:flutter/material.dart';
import 'package:mw_todo_notes/template/view_data_screen.dart';
import 'constants/routes_variables.dart';



class AppRoutes{
  static Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case kViewData:return MaterialPageRoute(
          builder:(_)=>  const ViewDataScreen()
        );
      default: return null;
    }
  }
}