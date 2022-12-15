import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:playground/modals/search_results_modal.dart';
import 'package:playground/services/firebase_service.dart';
import 'package:playground/utils/const_values.dart';

class SearchController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSearched = false.obs;
  Rx<SiteResult?> selectedResult = SiteResult(
      "name", Product("name", "price", "link", "img", "rating", ""), []).obs;
  FocusNode searchFocus = FocusNode();

  RxList<SiteResult> siteResults = <SiteResult>[].obs;
  TextEditingController searchController = TextEditingController();
  RxString searchTerm = "".obs;

  Future<void> searchCall(String searchTerm) async {
    isLoading(true);
    isSearched(true);
    this.searchTerm(searchTerm);
    try {
      //res = await ApiCalls.searchProducts(_searchTerm);
      await Future.delayed(const Duration(seconds: 2));
      await FirebaseService.insertToSearch(searchTerm);
      siteResults(MockData.resultss);
      selectedResult(MockData.resultss[0]);
    } finally {
      isLoading(false);
    }
  }

  void resetView() {
    isLoading(false);
    searchController.text = "";
    isSearched(false);
    siteResults([]);
  }
}
