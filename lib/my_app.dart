import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flushbar/flushbar.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sc_app/styles/app_colors.dart';
import 'package:sc_app/styles/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp {
  static final MyApp _instance = new MyApp.internal();
  factory MyApp() => _instance;

  MyApp.internal();


  void showToast(String title, String msg, context, {IconData icon, Color color, int duration, int gravity}) {
    Flushbar(
      title: title,
      message: msg,
      icon: Icon(
        (icon != null ? icon: Icons.info_outline),
        size: 28,
        color: (color != null ? color: AppColors.green),
      ),
      leftBarIndicatorColor: (color != null ? color: AppColors.green),
      duration: Duration(seconds: (duration != null ? duration : 3)),
    )..show(context);
  }

Future checkConnectivity(BuildContext context) async {
  try{
    final result = await InternetAddress.lookup('google.com');
    if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
      print('connected');
    }
  } on SocketException catch (_){
    this.showToast("Connection Error", "Please check your internet connection.", context, color: Colors.red);
  }
}

  void startPage(ctx, page){
    Navigator.of(ctx).push(new MaterialPageRoute( builder: (BuildContext context) => page));
  }

  void popPage(ctx, page){
    Navigator.of(ctx).pop(new MaterialPageRoute( builder: (BuildContext context) => page));
  }

  Style getStyle(){
    return Style();
  }

  
  
  void popUntil(ctx, page){
    Navigator.of(ctx).pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false);
  }

  void setFirstRun(bool token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstRun', token);
  }

  Future<bool> getFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('firstRun') ?? true;
  }

  void setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }


  Future<bool> check() async {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile) {
          return true;
        } else if (connectivityResult == ConnectivityResult.wifi) {
          return true;
        }
        return false;
      }

  dynamic checkInternet(Function func) {
    check().then((intenet) {
      if (intenet != null && intenet) {
        func(true);
      }
      else{
    func(false);
  }
    });
  }
  //PROFILE DATA
  void setUsername(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', id);
  }

  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }
  void setEmail(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', id);
  }

  Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? '';
  }

  void setProfileId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('profileId', id);
  }

  Future<int> getProfileId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('profileId') ?? '';
  }
  void setUserId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', id);
  }

  Future<int> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId') ?? 0;
  }
  
  void setName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
  }

  Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name') ?? '';
  }
  
  void setBio(String bio) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('bio', bio);
  }

  Future<String> getBio() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('bio') ?? '';
  }
  
  void setImage(String image) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('image', image);
  }

  Future<String> getImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('image') ?? '';
  }
  
  void setPhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('phone', phone);
  }
  Future<String> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('phone') ?? '';
  }
 
  void setCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('city', city);
  }

  Future<String> getCity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('city') ?? '';
  }
  
  void setLat(double lat) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('lat', lat);
  }

  Future<double> getLat() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('lat') ?? 0.0;
  }
  
  void setLng(double lng) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('lng', lng);
  }

  Future<double> getLng() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('lng') ?? 0.0;
  }
  
  void setVerified(int verified) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('verified', verified);
  }

  Future<int> getVerified() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('verified') ?? 0;
  }
}