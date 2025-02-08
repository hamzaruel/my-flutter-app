import 'package:amina_project/views/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/shared_pref.dart';

class LoginControllery extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final Rx<TextEditingController> emailcontroller = TextEditingController().obs;
  final Rx<TextEditingController> passwordcontroller =
      TextEditingController().obs;
  final RxBool loadingicon = false.obs;
  void onlogin() async {
    try {
      loadingicon.value = true;
      await _auth.signInWithEmailAndPassword(
          email: emailcontroller.value.text.toString(),
          password: passwordcontroller.value.text.toString());

      loadingicon.value = false;
      Get.to(const HomeScreen());
      Get.snackbar('Yeahoo', 'Loged in');
      Userprefrences().onsave(_auth.currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      loadingicon.value = false;
      Get.snackbar('Error', e.code);
    }
  }
}
