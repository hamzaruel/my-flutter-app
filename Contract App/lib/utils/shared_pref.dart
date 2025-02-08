import 'package:shared_preferences/shared_preferences.dart';

class Userprefrences {
  Future<bool> onsave(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString('token', token.toString());
    return true;
  }

  Future getuers() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('token');
  }

  Future<bool> removeuser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.clear();

    return true;
  }
}
