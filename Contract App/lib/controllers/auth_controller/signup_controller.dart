import 'package:amina_project/utils/shared_pref.dart';
import 'package:amina_project/views/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final Rx<TextEditingController> userconttroller = TextEditingController().obs;
  final Rx<TextEditingController> emailcontroller = TextEditingController().obs;
  final Rx<TextEditingController> passwordcontroller =
      TextEditingController().obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxBool loadingicon = false.obs;
  void onsigup() async {
    try {
      loadingicon.value = true;
      await _auth.createUserWithEmailAndPassword(
          email: emailcontroller.value.text.toString(),
          password: passwordcontroller.value.text.toString());
      // .then((ee) {
      Get.off(const HomeScreen());
      loadingicon.value = false;
      Get.snackbar('Yeahoo', 'Siged Up');
      Userprefrences().onsave(_auth.currentUser!.uid);
      // });
    } on FirebaseAuthException catch (e) {
      Get.snackbar('error', e.code);
      loadingicon.value = false;
    }
  }
}
