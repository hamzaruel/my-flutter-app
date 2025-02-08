import 'package:amina_project/views/auth_views/siginup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../controllers/auth_controller/login_controllery.dart';
import '../widgets/custom_form_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final _formKey = GlobalKey<FormState>();

  final logincontroller = Get.put(LoginControllery());

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
                    'Sigin With connectify',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: CustomFormField(
              //     controller: signupController.userconttroller.value,
              //     hint: "User Name",
              //     validator: (val) {
              //       if (val!.isEmpty) {
              //         return '^please add name';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomFormField(
                  controller: logincontroller.emailcontroller.value,
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
                  controller: logincontroller.passwordcontroller.value,
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
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    Get.off(Siginup());
                  },
                  child: Text("don't have an Account")),
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => logincontroller.loadingicon.value
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            logincontroller.onlogin();
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
                        child: const Text('Signup'),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
