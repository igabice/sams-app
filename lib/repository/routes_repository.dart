import 'dart:convert';
import 'dart:io';

//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:sc_app/api_endpoint.dart';
import 'package:sc_app/di/injection.dart';
import 'package:sc_app/model/BusRoute.dart';
import 'package:sc_app/model/user.dart';
import 'package:sc_app/service/network_service.dart';
import 'package:sc_app/util/preferences.dart';
import 'package:sc_app/util/request_exception.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

abstract class RoutesRepository {
  
  Future<List<User>> fetchUsers(int page);
  Future<List<BusRoute>> fetchRoutes();

}

class RoutesRepositoryImpl implements RoutesRepository {
  final NetworkService _networkService = Injector().networkService;
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<List<User>> fetchUsers(int page) async {
    final response = await http.get(ApiEndPoint.RANDOM_USERS +
        "?page=$page&results=10&inc=name,email,gender,picture,location,phone");
    var statusCode = response.statusCode;
    var jsonBody = response.body;

    if (statusCode != 200 || null == statusCode) {
      throw new RequestException(
          "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }

    final contactsBody = _decoder.convert(jsonBody);
    final List contacts = contactsBody['results'];

    return contacts.map((contact) => new User.fromJson(contact, "")).toList();
  }

  @override
  Future<List<BusRoute>> fetchRoutes() async {
    String token = await Preferences.getToken();
    final response = await http.get(ApiEndPoint.BUSES, headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    var statusCode = response.statusCode;
    var jsonBody = response.body;

    print("token :"+token);
    print(jsonBody.toString());

    if (statusCode != 200 || null == statusCode) {
      throw new RequestException( "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }

    final List routesBody = _decoder.convert(jsonBody);
    //final List contacts = contactsBody['results'];

    return routesBody.map((route) => new BusRoute.fromJson(route)).toList();
  }


}
