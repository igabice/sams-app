import 'package:sc_app/base/base_contract.dart';
import 'package:sc_app/model/BusRoute.dart';
import 'package:sc_app/views/driver/view_route/route_view.dart';

abstract class BusRouteContract extends BaseContract {
  
  void onRoutesReceived(List<BusRoute> route);
}
