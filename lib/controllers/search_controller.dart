import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:playground/modals/search_results_modal.dart';
import 'package:playground/services/api_calls.dart';

class SearchController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool showLogo = true.obs;
  FocusNode searchFocus = FocusNode();

  RxList<SiteResult> siteResults = <SiteResult>[].obs;
  TextEditingController searchController = TextEditingController();

  Future<void> searchCall(String searchTerm) async {
    List<SiteResult>? res = [];
    isLoading(true);
    showLogo(false);
    try {
      res = await ApiCalls.searchProducts(searchTerm);
      siteResults(res);
    } finally {
      isLoading(false);
    }
  }

  void setShowLogo(value) {
    showLogo(value);
  }

  void resetView() {
    isLoading(false);
    showLogo(true);
    siteResults([]);
  }
}
