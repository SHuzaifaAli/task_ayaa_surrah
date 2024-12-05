// // // import 'package:get/get.dart';
// // // import '../data/models/surrah_model.dart';
// // // import '../data/services/api_service.dart';
// // //
// // // class SurahController extends GetxController {
// // //   final ApiService _apiService = ApiService();
// // //   var surahList = <Data>[].obs;
// // //   var selectedSurah = Data().obs;
// // //   var ayahs = <String>[].obs;
// // //   var isLoading = true.obs;
// // //
// // //   @override
// // //   void onInit() {
// // //     fetchSurahs();
// // //     super.onInit();
// // //   }
// // //
// // //   void fetchSurahs() async {
// // //     try {
// // //       isLoading(true);
// // //       var surahModel = await _apiService.fetchSurahs();
// // //       surahList(surahModel.data ?? []);
// // //     } finally {
// // //       isLoading(false);
// // //     }
// // //   }
// // //
// // //   void selectSurah(Data surah) {
// // //     selectedSurah(surah);
// // //     loadAyahs(surah.number ?? 1);
// // //   }
// // //
// // //   void loadAyahs(int surahNumber) {
// // //     // Logic to fetch Ayahs for pagination (mocked for simplicity)
// // //     ayahs(List.generate(9, (index) => "Ayah ${index + 1} from Surah $surahNumber"));
// // //   }
// // // }
// //
// // import 'package:get/get.dart';
// // import '../data/models/surrah_model.dart';
// // import '../data/services/api_service.dart';
// //
// // class SurahController extends GetxController {
// //   final ApiService _apiService = ApiService();
// //   var surahList = <Data>[].obs;
// //   var selectedSurah = Data().obs;
// //   var ayahs = <String>[].obs;
// //   var currentPage = 1.obs;
// //   var isLoading = true.obs;
// //
// //   static const int ayahsPerPage = 8; // Define ayahs per page
// //
// //   @override
// //   void onInit() {
// //     fetchSurahs();
// //     super.onInit();
// //   }
// //
// //   void fetchSurahs() async {
// //     try {
// //       isLoading(true);
// //       var surahModel = await _apiService.fetchSurahs();
// //       surahList(surahModel.data ?? []);
// //       if (surahList.isNotEmpty) selectSurah(surahList.first);
// //     } finally {
// //       isLoading(false);
// //     }
// //   }
// //
// //   void selectSurah(Data surah) {
// //     selectedSurah(surah);
// //     currentPage(1); // Reset page to 1 for new Surah
// //     loadAyahs(surah.number ?? 1);
// //   }
// //
// //   void loadAyahs(int surahNumber) {
// //     // Logic to fetch Ayahs for pagination (mocked here for simplicity)
// //     int totalAyahs = selectedSurah.value.numberOfAyahs ?? 0;
// //     int start = (currentPage.value - 1) * ayahsPerPage;
// //     int end = start + ayahsPerPage;
// //
// //     if (start < totalAyahs) {
// //       ayahs(List.generate(
// //         (end > totalAyahs ? totalAyahs - start : ayahsPerPage),
// //             (index) => "Ayah ${start + index + 1} from Surah $surahNumber",
// //       ));
// //     } else {
// //       ayahs([]); // No more Ayahs to display
// //     }
// //   }
// //
// //   void nextPage() {
// //     int totalAyahs = selectedSurah.value.numberOfAyahs ?? 0;
// //     int maxPage = (totalAyahs / ayahsPerPage).ceil();
// //
// //     if (currentPage.value < maxPage) {
// //       currentPage.value++;
// //       loadAyahs(selectedSurah.value.number ?? 1);
// //     } else {
// //       // Move to next Surah if available
// //       int currentIndex = surahList.indexOf(selectedSurah.value);
// //       if (currentIndex < surahList.length - 1) {
// //         selectSurah(surahList[currentIndex + 1]);
// //       }
// //     }
// //   }
// // }
//
// import 'package:get/get.dart';
// import '../data/models/surrah_model.dart';
// import '../data/services/api_service.dart';
//
// class SurahController extends GetxController {
//   final ApiService _apiService = ApiService();
//   var surahList = <Data>[].obs;
//   var filteredSurahList = <Data>[].obs; // For search functionality
//   var selectedSurah = Data().obs;
//   var ayahs = <String>[].obs;
//   var currentPage = 1.obs;
//   var isLoading = true.obs;
//
//   static const int ayahsPerPage = 8;
//
//   @override
//   void onInit() {
//     fetchSurahs();
//     super.onInit();
//   }
//
//   void fetchSurahs() async {
//     try {
//       isLoading(true);
//       var surahModel = await _apiService.fetchSurahs();
//       surahList(surahModel.data ?? []);
//       filteredSurahList.assignAll(surahList); // Initialize filtered list
//       if (surahList.isNotEmpty) selectSurah(surahList.first);
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   void searchSurahByNumber(int? number) {
//     if (number == null) return;
//     filteredSurahList(surahList.where((surah) => surah.number == number).toList());
//   }
//
//   void resetSurahFilter() {
//     filteredSurahList.assignAll(surahList); // Reset to full list
//   }
//
//   void selectSurah(Data surah) {
//     selectedSurah(surah);
//     currentPage(1);
//     loadAyahs(surah.number ?? 1);
//   }
//
//   void loadAyahs(int surahNumber) {
//     int totalAyahs = selectedSurah.value.numberOfAyahs ?? 0;
//     int start = (currentPage.value - 1) * ayahsPerPage;
//     int end = start + ayahsPerPage;
//
//     if (start < totalAyahs) {
//       ayahs(List.generate(
//         (end > totalAyahs ? totalAyahs - start : ayahsPerPage),
//             (index) => "Ayah ${start + index + 1} from Surah $surahNumber",
//       ));
//     } else {
//       ayahs([]);
//     }
//   }
//
//   void nextPage() {
//     int totalAyahs = selectedSurah.value.numberOfAyahs ?? 0;
//     int maxPage = (totalAyahs / ayahsPerPage).ceil();
//
//     if (currentPage.value < maxPage) {
//       currentPage.value++;
//       loadAyahs(selectedSurah.value.number ?? 1);
//     } else {
//       int currentIndex = surahList.indexOf(selectedSurah.value);
//       if (currentIndex < surahList.length - 1) {
//         selectSurah(surahList[currentIndex + 1]);
//       }
//     }
//   }
// }
import 'package:get/get.dart';
import '../data/models/surrah_model.dart';
import '../data/services/api_service.dart';

class SurahController extends GetxController {
  final ApiService _apiService = ApiService();
  var surahList = <Data>[].obs;
  var filteredSurahList = <Data>[].obs; // For search functionality
  var selectedSurah = Data().obs;
  var ayahs = <String>[].obs;
  var currentPage = 1.obs;
  var isLoading = true.obs;

  static const int ayahsPerPage = 8;

  @override
  void onInit() {
    fetchSurahs();
    super.onInit();
  }

  void fetchSurahs() async {
    try {
      isLoading(true);
      var surahModel = await _apiService.fetchSurahs();
      surahList(surahModel.data ?? []);
      filteredSurahList.assignAll(surahList); // Initialize filtered list
      if (surahList.isNotEmpty) selectSurah(surahList.first);
    } finally {
      isLoading(false);
    }
  }

  void searchSurahByName(String name) {
    if (name.isEmpty) {
      resetSurahFilter();
    } else {
      // Filter Surah list by English name
      filteredSurahList(
        surahList
            .where((surah) =>
            (surah.englishName ?? "").toLowerCase().contains(name.toLowerCase()))
            .toList(),
      );

      // Update selectedSurah if it is no longer part of the filtered list
      if (!filteredSurahList.contains(selectedSurah.value)) {
        selectedSurah(filteredSurahList.isNotEmpty ? filteredSurahList.first : Data());
      }
    }
  }

  void resetSurahFilter() {
    filteredSurahList.assignAll(surahList); // Reset to full list
  }

  void selectSurah(Data surah) {
    selectedSurah(surah);
    currentPage(1);
    loadAyahs(surah.number ?? 1);
  }

  void loadAyahs(int surahNumber) {
    int totalAyahs = selectedSurah.value.numberOfAyahs ?? 0;
    int start = (currentPage.value - 1) * ayahsPerPage;
    int end = start + ayahsPerPage;

    if (start < totalAyahs) {
      ayahs(List.generate(
        (end > totalAyahs ? totalAyahs - start : ayahsPerPage),
            (index) => "Ayah ${start + index + 1} from Surah $surahNumber",
      ));
    } else {
      ayahs([]);
    }
  }

  void nextPage() {
    int totalAyahs = selectedSurah.value.numberOfAyahs ?? 0;
    int maxPage = (totalAyahs / ayahsPerPage).ceil();

    if (currentPage.value < maxPage) {
      currentPage.value++;
      loadAyahs(selectedSurah.value.number ?? 1);
    } else {
      int currentIndex = surahList.indexOf(selectedSurah.value);
      if (currentIndex < surahList.length - 1) {
        selectSurah(surahList[currentIndex + 1]);
      }
    }
  }
}
