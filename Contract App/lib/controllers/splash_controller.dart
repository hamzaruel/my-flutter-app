import 'package:amina_project/utils/shared_pref.dart';
import 'package:amina_project/views/auth_views/login.dart';
import 'package:amina_project/views/screens/home_screen.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  Userprefrences up = Userprefrences();

  @override
  void onInit() {
    up.getuers().then((value) {
      if (value == null) {
        Get.to(Login());
      } else {
        Future.delayed(const Duration(seconds: 3), () {
          Get.off(
            () => HomeScreen(),
          );
        });
      }
    });

    super.onInit();
  }
}
