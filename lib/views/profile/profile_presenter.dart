import 'package:sc_app/di/injection.dart';
import 'package:sc_app/model/user.dart';
import 'package:sc_app/repository/users_repository.dart';
import 'package:sc_app/util/preferences.dart';
import 'package:sc_app/views/profile/profile_contract.dart';

class ProfilePresenter {
  ProfileContract _view;
  UsersRepository _usersRepository;

  ProfilePresenter(_view) {
      _usersRepository = new Injector().usersRepository;
  }

   setUser(User user) async {
    user = (await _usersRepository.getUser()) ;
  }

  setName(String user)  async {
    return user = await Preferences.getFullName();
  }


}
