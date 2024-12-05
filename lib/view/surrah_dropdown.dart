import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/surrah_controller.dart';
import '../data/models/surrah_model.dart';

class SurahDropdown extends StatelessWidget {
  const SurahDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final SurahController controller = Get.find();
    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Search by Surah Name",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              controller.searchSurahByName(value);
            },
          ),
        ),
        // Dropdown
        Obx(() {
          return DropdownButton<Data>(
            value: controller.filteredSurahList.contains(controller.selectedSurah.value)
                ? controller.selectedSurah.value
                : null, // Reset value if invalid
            items: controller.filteredSurahList.map((surah) {
              return DropdownMenuItem(
                value: surah,
                child: Text(surah.englishName ?? 'Unknown'),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) controller.selectSurah(value);
            },
            hint: const Text("Select a Surah"),
          );
        }),
      ],
    );
  }
}
