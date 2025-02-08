import 'dart:typed_data';

import 'package:amina_project/models/friend_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AddFriendsController extends GetxController {
  Future<void> saveFriendToDB(
    Uint8List? friendImage,
    String? friendName,
    String? friendNumber,
    String? desc,
  ) async {
    var friendBox = await Hive.openBox<FriendModel>('friends');
    FriendModel friendModel =
        FriendModel(friendImage, friendName, friendNumber, desc);

    friendBox.add(friendModel).then((value) {
      Get.snackbar('My Partners', 'Data Saved Successfully');
    });
  }
}
