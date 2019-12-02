import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sc_app/model/bus_users.dart';
import 'package:sc_app/my_app.dart';
import 'package:sc_app/styles/app_colors.dart';
import 'package:sc_app/styles/styles.dart';
import 'package:sc_app/views/create_bus_attendance/create_bus_attendance_contract.dart';
import 'package:sc_app/views/create_bus_attendance/load_table_view.dart';
import 'package:sc_app/views/driver/route_detail/StateNotifier.dart';

class CreateBussAttendance extends StatelessWidget implements CreateBusAttendanceContract{
   
   CreateBussAttendance({Key key, this.id}) : super(key: key);
  int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: MyApp.internal().backButton(context),
          title: Text("Create Attendance", style: Style.headerTextStyle),
          backgroundColor: AppColors.green, elevation: 0,
        ),
        body: new Container(
          child: ChangeNotifierProvider<RouteDetailNotifier>(
              builder: (_) => RouteDetailNotifier(),
              child: LoadTable(id: id)
              ),
        ),
      ),
    );
  }

  @override
  void showError(message) {
    // TODO: implement showError
  }
}