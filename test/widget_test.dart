// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.
//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// import 'package:ayaa_surrah/main.dart';
//
// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());
//
//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);
//
//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();
//
//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import '../lib/controllers/surrah_controller.dart';
import '../lib/data/models/surrah_model.dart';

void main() {
  final SurahController controller = Get.put(SurahController());

  // Mock Surah Data
  final List<Data> mockSurahs = [
    Data(number: 1, name: "Al-Fatihah", englishName: "The Opening", numberOfAyahs: 7),
    Data(number: 2, name: "Al-Baqarah", englishName: "The Cow", numberOfAyahs: 286),
    Data(number: 3, name: "Al-Imran", englishName: "The Family of Imran", numberOfAyahs: 200),
  ];

  group('SurahController Tests', () {
    setUp(() {
      controller.surahList.assignAll(mockSurahs);
      controller.resetSurahFilter();
    });

    test('Search Surah by English Name', () {
      controller.searchSurahByName("The Cow");
      expect(controller.filteredSurahList.length, 1);
      expect(controller.filteredSurahList.first.englishName, "The Cow");

      controller.searchSurahByName("Non-existing name");
      expect(controller.filteredSurahList.isEmpty, true);
    });

    test('Reset Surah Filter', () {
      controller.searchSurahByName("The Opening");
      expect(controller.filteredSurahList.length, 1);

      controller.resetSurahFilter();
      expect(controller.filteredSurahList.length, mockSurahs.length);
    });
  });
}
