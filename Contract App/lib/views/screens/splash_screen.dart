import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put<SplashController>(SplashController());
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(scale: 3, kAppLogo),
              const Text(
                'connectify',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 70),
              const CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
