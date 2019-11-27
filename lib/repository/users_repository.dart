import 'dart:convert';

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

abstract class UsersRepository {
  
  Future<List<User>> fetchUsers(int page);
  Future<List<BusRoute>> fetchRoutes();

  Observable<void> login(String email, String password);
  Observable<void> logout();
  Future<User> getUser();
}

class UsersRepositoryImpl implements UsersRepository {
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
    final response = await http.get(ApiEndPoint.BUSES);
    var statusCode = response.statusCode;
    var jsonBody = response.body;

    if (statusCode != 200 || null == statusCode) {
      throw new RequestException( "Cannnot fecth data, code: $statusCode, ${response.reasonPhrase}");
    }

    final List routesBody = _decoder.convert(jsonBody);
    //final List contacts = contactsBody['results'];

    return routesBody.map((route) => new BusRoute.fromJson(route)).toList();
  }

  @override
  Observable<void> login(String email, String password) {
    Map data = {'email': email, 'password': password};

    return Observable.fromFuture(_networkService.post(ApiEndPoint.LOGIN, data))
        .flatMap((res) {
      if (res.statusCode != 200 || null == res.statusCode) {
        print('Error: ${res.body}');
        throw new RequestException("Login error, code: ${res.statusCode}, ${res.reasonPhrase}");
      }
      final String token = _networkService.convertJsonToMap(res.body)["token"];
      final User user = new User.fromJson(_networkService.convertJsonToMap(res.body)["profile"], token);
      print(user.toJson().toString());
      print(user.lastname);
       return Preferences.setUser(user);
    });
  }


  // Future<User> handleFacebookLogin() async {
  //   var facebookLogin = FacebookLogin();
  //   var facebookLoginResult = facebookLogin.logInWithReadPermissions(['email']);
  //   return facebookLoginResult;
  // }

  @override
  Future<Observable<void>> updateProfile(String firstname, String lastname, String phone, String address ) async {
    String token = await Preferences.getToken();

    var body = jsonEncode({ "firstname": firstname, "lastname": lastname, "phone": phone, "address": address });
    print(ApiEndPoint.GET_USER);
    return Observable.fromFuture(_networkService.postData(ApiEndPoint.GET_USER, 
    headers: {'Accept' : 'application/json', 'Authorization' : "Bearer "+ token},
    body: body)).flatMap((res) {
      print(res.toString());
      if(res["error"]) throw new Exception(res["error_msg"]);
      //return new User.map(res["user"]);
    });
  }

  // @override
  // Observable<void> updateProfile(String firstname, String lastname, String phone, String address ) {
  //   Map data = {'firstname': firstname, 'lastname': lastname, 'phone': phone, 'address': address};

  //   return Observable.fromFuture(_networkService.post(ApiEndPoint.EDIT_PROFILE, data))
  //       .flatMap((res) {
  //     if (res.statusCode != 200 || null == res.statusCode) {
  //       print('Error: ${res.body}');
  //       throw new RequestException("Login error, code: ${res.statusCode}, ${res.reasonPhrase}");
  //     }
  //     final String token = _networkService.convertJsonToMap(res.body)["token"];
  //     print(res.body);
  //     return Preferences.setToken(token);
  //   });
  // }

  @override
  Observable<void> logout() {
    return Preferences.clear();
  }

  @override
  Future<User> getUser()  {
    return  Preferences.getName();
  }
}
