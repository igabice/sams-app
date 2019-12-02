
import 'package:sc_app/repository/routes_repository.dart';
import 'package:sc_app/views/driver/route_detail/route_detail_contract.dart';

class RouteDetailPresenter {
  RouteDetailContract _view;
  RoutesRepository _routeRepository;

  RouteDetailPresenter(this._view) {
    _routeRepository = RoutesRepositoryImpl();
  }

  // void loadStudents(int routeId) {
  //    print("loadStudents: started");

  //   if (null == _view) return;

  //   _routeRepository
  //       .fetchRoutesStudents(routeId)
  //       .then((students) => _view.onStudentsReceived(students))
  //       .catchError((onError) {
  //     print(onError);
  //     _view.showError(onError.toString());
  //   });
  // }
}

