import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/surrah_controller.dart';

class AyahPagination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SurahController controller = Get.find();
    return Obx(() {
      if (controller.ayahs.isEmpty) return Center(child: Text("Select a Surah"));
      return ListView.builder(
        itemCount: controller.ayahs.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(controller.ayahs[index]));
        },
      );
    });
  }
}
