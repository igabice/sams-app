import 'package:sc_app/base/base_contract.dart';
import 'package:sc_app/model/user.dart';

abstract class UsersContract extends BaseContract {
  void onUsersReceived(List<User> users);
}
