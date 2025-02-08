import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendDetails extends StatelessWidget {
  const FriendDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final name = Get.arguments['name'];
    final image = Get.arguments['image'];
    final phone = Get.arguments['phone'];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: MemoryImage(image),
          ),
          Row(
            children: [
              Text('NAME :'),
              Text(name ?? 'nothing'),
            ],
          ),
          Row(
            children: [
              Text('Phone No:'),
              Text(phone),
            ],
          )
        ],
      ),
    );
  }
}
