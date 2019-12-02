import 'package:flutter/widgets.dart';
import 'package:sc_app/api_endpoint.dart';
import 'package:sc_app/model/bus_users.dart';
import 'package:sc_app/model/user.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sc_app/util/preferences.dart';
import 'package:sc_app/util/request_exception.dart';

class RouteDetailNotifier extends ChangeNotifier{
  RouteDetailNotifier();

  final JsonDecoder _decoder = new JsonDecoder();

  List<busUsers> _users = [];

  List<busUsers> _selectedUsers = [];

  List<busUsers> get getSelectedUsers => _selectedUsers;

  List<busUsers> get getUsers => _users;

  bool _isFetching = true;
  
  bool _sort = false;

  bool get isFetching => _isFetching;

  bool get isSorted => _sort;

  Future<void> setSorted(bool sort){
    _sort = sort;
  }
  
  Future<void> addSelectedUsers(busUsers user){
    _selectedUsers.add(user);
    print('added user to notifier');
    print('count :'+_selectedUsers.length.toString());
  }
  
  Future<void> removeSelectedUsers(busUsers user){
    _selectedUsers.remove(user);
    print('removed user to notifier');
    print('count :'+_selectedUsers.length.toString());
  }

  Future<void> updateUsers(int routeId) async {
    
    //notifyListeners();  
    String token = await Preferences.getToken();
    final response = await http.get(ApiEndPoint.BUSES+"/$routeId/students", 
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    var statusCode = response.statusCode;
    var jsonBody = response.body;
    print(jsonBody.toString());

    if (statusCode != 200 || null == statusCode) {
      throw new RequestException( "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }

    final List routesBody = _decoder.convert(jsonBody);
    //final List contacts = contactsBody['results'];
    _users = routesBody.map((route) => new busUsers.fromJson(route)).toList();
    
    notifyListeners(); 
    _isFetching = false;
    notifyListeners(); 
}


}