import 'dart:typed_data';
import 'package:amina_project/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import '../../models/friend_model.dart';
import '../widgets/custom_form_field.dart';

class AddFriendsScreen extends StatefulWidget {
  const AddFriendsScreen({super.key});

  @override
  State<AddFriendsScreen> createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  Uint8List? userImage;
  final nameCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final addFriendCtrl = Get.put<AddFriendsController>(AddFriendsController());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showSheet();
                      },
                      child: CircleAvatar(
                        radius: 55.0,
                        backgroundImage: userImage == null
                            ? const AssetImage('assets/images/friends.png')
                            : MemoryImage(userImage!) as ImageProvider,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    CustomFormField(
                      hint: 'Add Name',
                      controller: nameCtrl,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return '^please add name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomFormField(
                      hint: 'Add Number',
                      controller: mobileCtrl,
                      keyboardType: TextInputType.phone,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return '^please add number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomFormField(
                      hint: 'Add Description',
                      controller: descCtrl,
                      maxLines: 10,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return '^please add description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var friendBox =
                              await Hive.openBox<FriendModel>('friends');
                          FriendModel friendModel = FriendModel(
                            userImage!,
                            nameCtrl.text,
                            mobileCtrl.text,
                            descCtrl.text,
                          );

                          friendBox.add(friendModel).then((value) {
                            Get.snackbar(
                                'connectify', 'Friend Saved Successfully');
                            userImage = null;
                            nameCtrl.clear();
                            mobileCtrl.clear();
                            descCtrl.clear();

                            setState(() {});
                          }).then((onValue) {
                            Get.to(const HomeScreen());
                          });
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text('Form Saved Successfull'),
                          //   ),
                          // );
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
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showSheet() async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: Get.height / 4,
            child: Column(
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  'Pick Image From',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        pickeImageSource(ImageSource.camera).then((value) {
                          Navigator.pop(context);
                        });
                      },
                      child: Column(
                        children: [
                          const Text('Camera'),
                          Image.asset(
                            'assets/images/camera.png',
                            height: 50.0,
                            width: 50.0,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    InkWell(
                      onTap: () {
                        pickeImageSource(ImageSource.gallery).then((value) {
                          Navigator.pop(context);
                        });
                      },
                      child: Column(
                        children: [
                          const Text('Gallery'),
                          Image.asset(
                            'assets/images/gallery.png',
                            height: 50.0,
                            width: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  Future<void> pickeImageSource(ImageSource source) async {
    XFile? tempImage = await ImagePicker().pickImage(source: source);

    if (tempImage == null) {
      return;
    } else {
      userImage = await tempImage.readAsBytes();
      setState(() {});
    }
  }
}
