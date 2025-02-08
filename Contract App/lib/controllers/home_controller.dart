import 'package:amina_project/views/auth_views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../utils/shared_pref.dart';
import '../views/screens/add_friends_screen.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Userprefrences up = Userprefrences();
  void logout() async {
    try {
      await _auth.signOut();
      Get.to(Login());
      Get.snackbar('Logout', 'Seee You Soon 🥲');
      up.removeuser();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.code);
    }
  }

  void goToAddFriendScreen() {
    Get.to(
      () => AddFriendsScreen(),
    );
  }
}
