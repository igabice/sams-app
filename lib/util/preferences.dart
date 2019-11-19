import 'package:rxdart/rxdart.dart';
import 'package:sc_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {


  static String _token = "PREF_TOKEN";
  static String _id = "USER_ID";
  static String _email = "EMAIL";
  static String _phone = "PHONE";
  static String _image = "IMAGE";
  static String _dob = "DATE_OF_BIRTH";
  static String _name = "NAME";
  static String _lastname = "LASTNAME";
  static String _othername = "OTHERNAME";
  static String _address = "ADDRESS";
  static String _roleId = "ROLE_ID";
  static String _activeClass = "ACTIVE_CLASS";
  static String _schoolId = "SCHOOL_ID";
  static String _active = "IS_ACTIVE";

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }
  static Future<String> getFullName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_name);
  }

  static Future<User> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return new User(
      id:prefs.getString(_id),
      name: prefs.getString(_name), 
      othername: prefs.getString(_othername), 
      lastname: prefs.getString(_lastname),
      email: prefs.getString(_email),
      phone: prefs.getString(_phone),
      image: prefs.getString(_image),
      dateOfBirth: prefs.getString(_dob),
      address: prefs.getString(_address),
      roleId: prefs.getString(_roleId),
      activeClass: prefs.getString(_activeClass),
      schoolId: prefs.getString(_schoolId),
      isActive: prefs.getString(_active),
    );
  }
  

  static Observable<void> setUser(User user) {
    return Observable.fromFuture(SharedPreferences.getInstance()).map((prefs) {
      prefs.setString(_id, user.id);
      prefs.setString(_roleId, user.roleId);
      prefs.setString(_email, user.email);
      prefs.setString(_phone, user.phone);
      prefs.setString(_image, user.image);
      prefs.setString(_dob, user.dateOfBirth);
      prefs.setString(_address, user.address);
      prefs.setString(_activeClass, user.activeClass);
      prefs.setString(_schoolId, user.schoolId);
      prefs.setString(_name, user.name);
      prefs.setString(_lastname, user.lastname);
      prefs.setString(_othername, user.othername);
      prefs.setString(_active, user.isActive);
    });
    
  }    

  static Observable<void> setToken(String token) {
    return Observable.fromFuture(SharedPreferences.getInstance()).map((prefs) {
      return prefs.setString(_token, token);
    });
  }    

  static Observable<void> set(String token) {
    return Observable.fromFuture(SharedPreferences.getInstance()).map((prefs) {
      return prefs.setString(_token, token);
    });
  }    

  // static Observable<void> setToken(String token) {
  //   return Observable.fromFuture(SharedPreferences.getInstance()).map((prefs) {
  //     return prefs.setString(_token, token);
  //   });
  // }

  static Observable<void> clear() {
    return Observable.fromFuture(SharedPreferences.getInstance()).map((prefs) {
      return prefs.clear();
    });
  }
}
