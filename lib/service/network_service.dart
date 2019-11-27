import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkService {

  Future<Response> get(String apiUrl) async {
    return http.get(apiUrl);
  }

  Future<Response> authorizedGet(String apiUrl, String token) async {
    return http.get(apiUrl, headers: {HttpHeaders.authorizationHeader: "Bearer "+token});
  }

  Future<Response> post(String _apiBaseUrl, dynamic data) {
    return http.post(_apiBaseUrl, body: data);
  }

  Future<dynamic> postData(String url, {Map headers, body, encoding}) async {
    return await http.post(url, body: body, headers: headers, encoding: encoding);
    //     .then((http.Response response) {
    //   final String res = response.body;
    //   final int statusCode = response.statusCode;

    //   if (statusCode < 200 || statusCode > 400 || json == null) {
    //     throw new Exception("Error while fetching data");
    //   }
    //   return _decoder.convert(res);
    // });
  }

  Map<String, dynamic> convertJsonToMap(String response) {
    print("response: "+response);
    return json.decode(response);
  }

  String getErrorMessage(dynamic exception) {
    String errorMessage;
    if (exception is SocketException) {
      errorMessage = exception.message;
    } else if (exception is TimeoutException) {
      errorMessage = exception.message;
    } else if (exception is HttpException) {
      errorMessage = exception.message;
    }

    return errorMessage;
  }
}
