import 'package:sc_app/repository/users_repository.dart';
import 'package:sc_app/service/network_service.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  UsersRepository get usersRepository {
    return new UsersRepositoryImpl();
  }

  NetworkService get networkService {
    return new NetworkService();
  }
}
