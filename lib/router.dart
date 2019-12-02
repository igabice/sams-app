import 'package:flutter/material.dart';
import 'package:sc_app/constants/routing_constant.dart';
import 'package:sc_app/views/create_bus_attendance/create_bus_attendance_view.dart';
import 'package:sc_app/views/driver/route_detail/route_detail_view.dart';
import 'package:sc_app/views/home/home_view.dart';
import 'package:sc_app/views/login/login_view.dart';
import 'package:sc_app/views/profile_edit/profile_edit_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstant.HOME:
      return MaterialPageRoute(builder: (context) => Home());
    case RouteConstant.LOGIN:
      return MaterialPageRoute(builder: (context) => Login());
    case RouteConstant.EDIT_PROFILE:
      var user = settings.arguments;
      return MaterialPageRoute(builder: (context) => EditProfile(user: user));
    case RouteConstant.ROUTE_DETAIL:
    var route = settings.arguments;
    return MaterialPageRoute(builder: (context) => RouteDetailView(route: route));
    case RouteConstant.CREATE_BUS_ATTENDANCE:
    var id = settings.arguments;
    return MaterialPageRoute(builder: (context) => CreateBussAttendance(id: id));
    
    default:
      return MaterialPageRoute(builder: (context) => Home());
  }
}