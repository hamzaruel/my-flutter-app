import 'package:amina_project/constants/app_constants.dart';
import 'package:amina_project/controllers/auth_controller/signup_controller.dart';
import 'package:amina_project/views/auth_views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_form_field.dart';

class Siginup extends StatelessWidget {
  Siginup({super.key});
  final signupController = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset(
                kAppLogo,
                scale: 3,
              ),
              const SizedBox(
                height: 30,
                child: Center(
                  child: Text(
                    'Sigup With connectify',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormField(
                  controller: signupController.userconttroller.value,
                  hint: "User Name",
                  validator: (val) {
                    if (val!.isEmpty) {
                      return '^please add name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormField(
                  controller: signupController.emailcontroller.value,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return '^please add Email';
                    }
                    return null;
                  },
                  hint: "Email",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormField(
                  controller: signupController.passwordcontroller.value,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return '^please add Password';
                    }
                    return null;
                  },
                  hint: "Password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Get.off(Login());
                  },
                  child: Text('Already have an account ')),
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => signupController.loadingicon.value
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            signupController.onsigup();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Fill Up All Entities')),
                            );
                          }
                        },
                        style: ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(
                            Size(
                              Get.width / 2,
                              50.0,
                            ),
                          ),
                        ),
                        child: const Text('Sign-in'),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
