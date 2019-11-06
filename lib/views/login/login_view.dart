import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sc_app/styles/app_colors.dart';
import 'package:sc_app/styles/strings.dart';
import 'package:sc_app/styles/styles.dart';
import 'package:sc_app/views/home/home_view.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
//import 'package:sc_app/views/home/home_view.dart';
import 'package:sc_app/views/login/login_contract.dart';
import 'package:sc_app/views/login/login_presenter.dart';
import 'package:sc_app/widgets/raised_button.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';
//import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  static String routeName = "/Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: LoginForm()),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> implements LoginContract {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPresenter _presenter;
  bool isLoggedIn = false;

  Widget createEmailTextField() {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Email cannot be empty';
                } else {
                  return validateEmail(value);
                }
              },
              maxLines: 1,
              style: Style.formFieldStyle,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                focusColor: Colors.white,
                hoverColor: Colors.white,
                hintStyle: TextStyle(color: Colors.grey, fontFamily: "Raleway",),
                hintText: "Enter your email",
                labelText: "Email",
              ),
            ),
          )
        ])
        );
  }

  Widget createPasswordField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
      child: TextFormField(
        controller: _passwordController,    
        validator: (value) {
          if (value.isEmpty) {
            return 'Password cannot be empty';
          } else {
            if (value.length < 6) {
              return 'Password length must be at least 6 characters';
            }
          }
        },
        keyboardType: TextInputType.visiblePassword,
        maxLines: 1,
        style: Style.formFieldStyle,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          focusColor: Colors.white,
          hoverColor: Colors.white,
          hintStyle: TextStyle(color: Colors.grey, fontFamily: "Raleway",),
          hintText: "Enter your password",
          labelText: "Password",
        ),
      ),
    );
  }

  Widget createSignInButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
      width: double.infinity,
      child: RaisedGradientButton(
                          onPressed: () {
                          if (_formKey.currentState.validate()) {
                            showLoading();
                            _presenter.login(_emailController.text, _passwordController.text);
                          }
                        },
                        gradient: LinearGradient(
                            colors: <Color>[AppColors.green, AppColors.lightGreen],
                          ),
                        child: Text(
                              AppStrings().login,
                              style: Style.bigButtonTextStyle,
                            ),
                        ),
    );
  }



  @override
  void initState() {
    super.initState();
    _presenter = LoginPresenter(this);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  void showLoading() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                CircularProgressIndicator(),
                Text("Logging in...", textAlign: TextAlign.center)
              ]));
        });
  }

  @override
  void onLoginSuccess() {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed(Home.routeName);
  }

  @override
  void showError(String message) {
    Navigator.of(context).pop();
    print("Error: $message");
  }

  @override
  Widget build(BuildContext context) {
    loginHeader() => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.home,
              color: AppColors.green,
              size: 80.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
                "Login to your school",
                style: Style.welcomeTextStyle,
              ),
          ],
        );

    loginFields() => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              createEmailTextField(),
              createPasswordField(),
              SizedBox(height: 12.0),
              createSignInButton(context),
            ],
          ),
        );

    loginBody() => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[loginHeader(), loginFields()],
          ),
        );

    return Form(key: _formKey, child: loginBody());
  }
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}
