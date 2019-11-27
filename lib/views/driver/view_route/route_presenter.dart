
import 'package:sc_app/repository/routes_repository.dart';
import 'package:sc_app/views/driver/view_route/route_contract.dart';

class BusRoutePresenter {
  BusRouteContract _view;
  RoutesRepository _routeRepository;

  BusRoutePresenter(this._view) {
    _routeRepository = RoutesRepositoryImpl();
  }

  void loadRoutes() {
    print("loadUsers: ");

    if (null == _view) return;

    _routeRepository
        .fetchRoutes()
        .then((route) => _view.onRoutesReceived(route))
        .catchError((onError) {
      print(onError);
      _view.showError(onError.toString());
    });
  }
}

