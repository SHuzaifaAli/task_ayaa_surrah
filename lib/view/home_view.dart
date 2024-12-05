import 'package:ayaa_surrah/view/ayaa_pgination.dart';
import 'package:ayaa_surrah/view/surrah_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/surrah_controller.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SurahController controller = Get.put(SurahController());
    return Scaffold(
      appBar: AppBar(title: Text('Surah Reader')),
      body: Column(
        children: [
          SurahDropdown(),
          Expanded(child: AyahPagination()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.nextPage();
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
