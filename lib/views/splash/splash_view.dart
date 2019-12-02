import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sc_app/styles/app_colors.dart';
import 'package:sc_app/styles/strings.dart';
import 'package:sc_app/styles/styles.dart';
import 'package:sc_app/util/preferences.dart';
import 'package:sc_app/views/home/home_view.dart';
import 'package:sc_app/views/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    splashTimeout();
  }

  splashTimeout() async {
    var _duration = new Duration(seconds: 3);

    
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    String token = await Preferences.getToken();

    if (null == token || token.isEmpty)
      Navigator.of(context).pushReplacementNamed(Login.routeName);
    else
      Navigator.of(context).pushReplacementNamed(Home.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: new Center(child: 
    Column(
      
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.home,
              size: 100,
              color: Colors.white,
            ),
            Text(
                AppStrings.APP_NAME,
                style: Style.appNameTextStyle,
              ),
            
          ],
        )
        )
        );
  }
}
