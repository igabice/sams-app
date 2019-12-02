import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sc_app/constants/routing_constant.dart';
import 'package:sc_app/model/BusRoute.dart';
import 'package:sc_app/model/user.dart';
import 'package:sc_app/my_app.dart';
import 'package:sc_app/styles/app_colors.dart';
import 'package:sc_app/styles/strings.dart';
import 'package:sc_app/styles/styles.dart';
import 'package:sc_app/views/driver/route_detail/StateNotifier.dart';
import 'package:sc_app/views/driver/route_detail/load_students.dart';
import 'package:sc_app/views/driver/route_detail/route_detail_contract.dart';
import 'package:sc_app/widgets/raised_button.dart';

class RouteDetailView extends StatelessWidget implements RouteDetailContract {

 final BusRoute route;
List _users = [];
  
   RouteDetailView({Key key, this.route}) : super(key: key);

  Widget _routeDetailCard(BuildContext context){
    return  Container(
        width: 450,
        height: 190,
        child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),   ),
            elevation: 17,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.black,
                      child: Padding(
                        child: Icon(FontAwesomeIcons.bus, color: Colors.white, size: 15,),
                        padding: EdgeInsets.all(2),
                      ),
                          ),
                    Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                                  route.location,
                                  style: Style.smallGreyTextStyle,
                                  ),
                        ),
                    new Spacer(),
                    RaisedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, RouteConstant.CREATE_BUS_ATTENDANCE, arguments: route.id );
                          },
                          disabledColor: Colors.white,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0), 
                            side: BorderSide(
                              color: Colors.grey, 
                              width: 0.7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(FontAwesomeIcons.plus, size: 10, color: Colors.black,),
                              ),
                              Text(
                                AppStrings.CREATE_ATTENDANCE,
                                style: 
                                TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway'),
                              ),
                            ],
                          ),
                        ),
                     
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(route.name+" ("+route.subscribedStudents.toString()+")", style: Style.bigTextStyle,
                          ),
                        ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedGradientButton(
                      width: 160,
                      height: 40,
                      child: Center(child: Text(AppStrings.VIEW_ALL_ATTENDANCE, style: Style.mediumButtonStyle,),),
                      gradient: LinearGradient(
                        colors: <Color>[Colors.green, Colors.green],
                      ),
                      onPressed: (){
                        //MyApp.internal().startPage(ctx, HomePage());
                        
                      }
                    ),
                ),
              ],
            ),
            ),
            
          ),
      )
    ;
  }
  

  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(leading: MyApp.internal().backButton(context), elevation: 0,
      title: Text('Route Detail', style: Style.headerTextStyle,),
      backgroundColor: AppColors.green,),
            body: Column(
              children: <Widget>[
                Stack(
              children: <Widget>[
                Container(
                  color: AppColors.green,
                  height: 70.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0, top:20.0),
                  child: Container(
                    
                    child: _routeDetailCard(context),
                  ),
                )
                
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 400,
            height: 50,
            color: Colors.white,
            child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                'Students Subscribed',
                style: Style.mediumTextStyle,
              ),
          
          ],
        ),
      ),
      ),
      ChangeNotifierProvider<RouteDetailNotifier>(
        builder: (_) => RouteDetailNotifier(),
      child:
      LoadStudents(id: route.id,)
      )
      ],
            )
       
          );
  }

  @override
  void showError(message) {
    // TODO: implement showError
  }

}