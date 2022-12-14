import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:playground/modals/search_results_modal.dart';
import 'package:playground/utils/const_values.dart';

class SearchController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSearched = false.obs;
  Rx<SiteResult?> selectedResult = SiteResult(
      "name", Product("name", "price", "link", "img", "rating", ""), []).obs;
  FocusNode searchFocus = FocusNode();

  RxList<SiteResult> siteResults = <SiteResult>[].obs;
  TextEditingController searchController = TextEditingController();

  Future<void> searchCall(String searchTerm) async {
    isLoading(true);
    isSearched(true);
    try {
      //res = await ApiCalls.searchProducts(searchTerm);
      await Future.delayed(const Duration(seconds: 2));

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
