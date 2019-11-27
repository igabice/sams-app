import 'package:flutter/material.dart';
import 'package:sc_app/constants/routing_constant.dart';
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
    default:
      return MaterialPageRoute(builder: (context) => Home());
  }
}