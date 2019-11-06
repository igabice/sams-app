import 'package:flutter/material.dart';
import 'package:sc_app/views/home/home_view.dart';
import 'package:sc_app/views/login/login_view.dart';
import 'package:sc_app/views/splash/splash_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        //accentColor: Colors.yellowAccent,
      ),
      routes: <String, WidgetBuilder>{
          Home.routeName: (BuildContext context) {
            return Home();
          },
          Login.routeName: (BuildContext context) {
            return Login();
          },
        },
        debugShowCheckedModeBanner: false,
        home: Splash()
    );
  }
}
