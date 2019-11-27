import 'package:flutter/material.dart';
import 'package:sc_app/constants/routing_constant.dart';
import 'package:sc_app/views/home/home_view.dart';
import 'package:sc_app/views/login/login_view.dart';
import 'package:sc_app/views/splash/splash_view.dart';
import 'package:sc_app/router.dart' as router;

void main() => runApp(App());

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        //accentColor: Colors.yellowAccent,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: RouteConstant.HOME,
        debugShowCheckedModeBanner: false,
        home: Splash()
    );
  }

}
