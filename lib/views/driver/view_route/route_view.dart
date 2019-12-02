import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:sc_app/constants/routing_constant.dart';
import 'package:sc_app/model/BusRoute.dart';
import 'package:sc_app/my_app.dart';
import 'package:sc_app/styles/app_colors.dart';
import 'package:sc_app/styles/styles.dart';
import 'package:sc_app/views/driver/view_route/route_contract.dart';
import 'package:sc_app/views/driver/view_route/route_presenter.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';


class BusRouteView extends StatefulWidget {
  //BusRouteView({Key key}) : super(key: key);

  @override
  _BusRouteViewState createState() => _BusRouteViewState();
}

class _BusRouteViewState extends State<BusRouteView> with AutomaticKeepAliveClientMixin<BusRouteView> implements BusRouteContract{
  BusRoutePresenter _presenter;
  var tag = "BusRouteView"; 
  BuildContext _context;

  int _count = 0;

  EasyRefreshController _controller;
  
    List _routes = [];

    Widget _buildRouteRow(BuildContext context, int index){
      var route = _routes[index];
      return new Card(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),   ),
        elevation:7,
        child: 
        Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, RouteConstant.ROUTE_DETAIL, arguments: route);
                    },
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    leading: CircleAvatar(child: Text(route.name.substring(0,1)),),
                    title: Text(route.name, style: Style.mediumTextStyle,),
                    subtitle: Text(route.location, style: Style.smallTextStyle,),
                    ),
              ),
              
      );
    }

    Widget _refreshListview(){
      return EasyRefresh(
        child: new ListView.builder(
        itemCount: _routes.length,
        itemBuilder: _buildRouteRow,
      ),
          enableControlFinishRefresh: false,
          enableControlFinishLoad: false,
          controller: _controller,
          header: BezierCircleHeader(backgroundColor: AppColors.green),
          footer: BallPulseFooter(color: AppColors.green),
          onRefresh: ()  {
            _presenter.loadRoutes();
           // _controller.resetLoadState();
          },
          onLoad: ()  {
            _presenter.loadRoutes();
           // _controller.resetLoadState();
          },
        );
    }

  @override
  void initState() {
  
    _presenter = BusRoutePresenter(this);
    _controller = EasyRefreshController();
    _presenter.loadRoutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    Widget content;

    if (_routes.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {

      content = _refreshListview();
    }
    return Scaffold(
     // key: _scaffoldKey,
      body:content,
    );
  }

  @override
  void onRoutesReceived(List route) {
    setState(() {
      _count = _routes.length;
     _routes.addAll(route); 
     _controller.finishLoad(success: true);
    });
    print("routeRecieved");
  }

  @override
  void showError(message) {
    MyApp.internal().showToast("Routes Error","$message", _context, icon: Icons.info_outline, color: Colors.red.shade300);
    print("$tag :Error");

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}