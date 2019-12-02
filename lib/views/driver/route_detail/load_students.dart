import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sc_app/model/bus_users.dart';
import 'package:sc_app/model/user.dart';
import 'package:sc_app/styles/styles.dart';
import 'package:sc_app/views/driver/route_detail/StateNotifier.dart';

class LoadStudents extends StatefulWidget {

     LoadStudents({Key key, this.id}) : super(key: key);

     int id = 0;

  @override
  LoadStudentsState createState()  => LoadStudentsState();
}
   
  class LoadStudentsState extends State<LoadStudents>{
  int id = 0;
  List<busUsers> _users = [];

  Widget _buildUserRow(BuildContext context, int index){
            var user = _users[index];
            print("phone: "+user.phone);
      return new Container(
        padding: const EdgeInsets.all(4.0),
        child: Card(
        margin: EdgeInsets.symmetric(horizontal: 4),
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),   ),
        elevation:0,
        child: 
        Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              child: new ListTile(
                    onTap: (){
                     // Navigator.pushNamed(context, RouteConstant.ROUTE_DETAIL, arguments: route);
                    },
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    leading: new CircleAvatar(
                backgroundImage: new NetworkImage(
                    "https://schoolcanal.com/uploads/students/"+user.student.image)),
                    //CircleAvatar(child: Text(user.student.name. substring(0,1)),),
                    title: Text(user.student.getFullName(), style: Style.mediumTextStyle,),
                    subtitle: Text(user.phone, style: Style.smallTextStyle,),
                    ),
              ),
              
      ),
      );
    }
    
  @override
  Widget build(BuildContext context) {

    final state = Provider.of<RouteDetailNotifier>(context);
    _users = state.getUsers;
    if(state.isFetching){
      state.updateUsers(id);
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      child:
    state.isFetching ?
      Center(child: CircularProgressIndicator(),) :
        new Container(
      child: Container(
        height: 359,
        width: 440,
        color: Colors.white,
        child: ListView.builder(
          //addSemanticIndexes: false,
          //scrollDirection: Axis.vertical,
          itemCount: state.getUsers.length,
          itemBuilder: _buildUserRow,   
              ),),
    
      )
    );
     
  }

 
   
}