

import 'package:flutter/foundation.dart';
import 'package:sc_app/model/BusRoute.dart';

class RouteNotifier with ChangeNotifier{

  List<BusRoute> _routes = [];

  get getRoutes => _routes;

  set setRoutes(List<BusRoute> route){
    _routes = route;
    notifyListeners();
  }


}