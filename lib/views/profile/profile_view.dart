import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sc_app/model/user.dart';
import 'package:sc_app/my_app.dart';
import 'package:sc_app/styles/app_colors.dart';

import 'package:sc_app/styles/strings.dart';
import 'package:sc_app/util/preferences.dart';
import 'package:sc_app/views/profile/profile_contract.dart';
import 'package:sc_app/views/profile/profile_presenter.dart';
import 'package:sc_app/views/profile_edit/profile_edit_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> implements ProfileContract {
  ProfilePresenter _presenter;
  User user;
  var name = "User Name";

  @override
  void initState() {
    super.initState();
    _presenter = ProfilePresenter(this);
    _presenter.setUser(user);
    getName();
  }


void getName() async {
    String token = await Preferences.getFullName();
    setState(() {
     name = name+token; 
    });
  }

  @override
  Widget build(BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Card(
                margin: EdgeInsets.only(bottom: 15,  top: 15),
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),   ),
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  
                  children: <Widget>[
                    CircleAvatar(
                    backgroundColor: AppColors.green,
                    child: Padding(
                      child: Icon(FontAwesomeIcons.userCircle, color: Colors.white,),
                      padding: EdgeInsets.all(6),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                              padding: EdgeInsets.all(0),
                              child: new Text(
                                      name,
                                  style: 
                                  TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Raleway'),
                                  ),
                        ),
                ],
              )
              ,
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  MyApp.internal().startPage(context, EditProfile());
                },
                child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                AppStrings().editProfile,
                style: 
                TextStyle(
                color: Colors.grey,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway'),
                ),
              ),
              ),
              
                     ],
            ),
            ),          
          ),
          Card(
            margin: EdgeInsets.only(bottom: 10,  top: 15),
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),   ),
            elevation: 2,
            child: ListTile(
            title: Text(
                        "Change Password",
                        style: 
                        TextStyle(
                        color: AppColors.blue,
                        fontSize: 22.0,
                        fontFamily: 'Raleway'),
                        ),
            trailing: Icon(FontAwesomeIcons.caretRight),
          )
          ),
          Card(
            margin: EdgeInsets.only(bottom: 10,  ),
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),   ),
            elevation: 2,
            child: ListTile(
            title: Text(
                        "About Us",
                        style: 
                        TextStyle(
                        color: AppColors.blue,
                        fontSize: 22.0,
                        fontFamily: 'Raleway'),
                        ),
            trailing: Icon(FontAwesomeIcons.caretRight),
          )
          ),
          Card(
            margin: EdgeInsets.only(bottom: 20,  ),
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),   ),
            elevation: 2,
            child: ListTile(
            title: Text(
                        "Visit Website",
                        style: 
                        TextStyle(
                        color: AppColors.blue,
                        fontSize: 22.0,
                        fontFamily: 'Raleway'),
                        ),
            trailing: Icon(FontAwesomeIcons.caretRight),
          )
          ),
          RaisedButton(
                          onPressed: null,
                          disabledColor: Colors.white,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0), 
                            side: BorderSide(
                              color: Colors.red, 
                              width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                "Logout",
                                style: 
                                TextStyle(
                              color: Colors.red,
                              fontSize: 20.0,
                              fontFamily: 'Raleway'),
                              ),
                              ),
                              
                            ],
                          ),
                        ),
      ],
      ),
    );
  }


  @override
  void showError(message) {
    // TODO: implement showError
  }

  
}