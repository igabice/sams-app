import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sc_app/styles/app_colors.dart';
import 'package:sc_app/views/profile_edit/profile_edit_contract.dart';
import 'package:sc_app/widgets/raised_button.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> implements ProfileEditContract {
  var coinSymbol = "BTC";
  BuildContext ctx;
  
  TextEditingController nameController, emailController, phoneController;

  Future<bool> alert(ctxx){
    return Alert(
      context: ctxx,
      type: AlertType.success,
      title: "Success!",
      desc: "Your profile details has been successfully updated",
      //image: Image.asset(''),
      content: Padding(
        padding: EdgeInsets.only(top:20),
        child: 
          RaisedGradientButton(
                          child: Text(
                            "Completed",
                            style: 
                            TextStyle(
                              color: AppColors.green, 
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway'),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[AppColors.green, AppColors.green],
                          ),
                          onPressed: (){
                            alert(ctx);
                            //Navigator.of(context).pop();
                          }
                        )
      ),
      buttons: []
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
                    iconSize: 20,
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 20,
                  color: AppColors.green,
                ),
              ),
        title: Text('Edit Profile',
        style: TextStyle(
                backgroundColor: Colors.white,
                color: AppColors.green,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway'),),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.only(top:25, left: 7, right: 7, bottom: 7),
            elevation: 1,
            child: EditText (nameController, "Full name", TextInputType.text ),
          )
,          Card(
            margin: EdgeInsets.all(7),
            elevation: 1,
            child: EditText (emailController, "Email Address", TextInputType.text ),
          ),
          Card(
            margin: EdgeInsets.all(7),
            elevation: 1,
            child: EditText (phoneController, "Phone number", TextInputType.phone ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: RaisedGradientButton(
                          child: Text(
                            "Save Profile",
                            style: 
                            TextStyle(
                              color: Colors.white, 
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway'),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[AppColors.green, AppColors.lightGreen],
                          ),
                          onPressed: (){
                            alert(ctx);
                            //Navigator.of(context).pop();
                          }
                        ),
          )
        ],
      ),
      )
    );
  }

  Widget EditText (controller, hint, inputType ){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top:10, left: 10, right: 10,bottom: 5),
            child: Text(
            hint,
            style: 
            TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.normal,
            fontFamily: 'Raleway'),
            ),
            ),
    TextField(
              controller: controller,
              keyboardType: inputType,
              style: 
            TextStyle(
            color: AppColors.green,
            fontSize: 20,
            fontWeight: FontWeight.normal,
            fontFamily: 'Raleway'),            
              decoration: new InputDecoration(
              contentPadding: EdgeInsets.only(left: 15, right: 25, bottom: 5, top: 10),
              focusedBorder: UnderlineInputBorder(
               borderSide: BorderSide(color: AppColors.green, width: 1.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                hintText: hint,
              ),
              )
      ],)
  ,
    );}

  @override
  void onEditSuccess() {
    // TODO: implement onEditSuccess
  }

  @override
  void showError(message) {
    // TODO: implement showError
  }
}