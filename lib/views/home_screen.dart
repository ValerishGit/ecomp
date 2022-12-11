import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/controllers/search_controller.dart';
import 'package:playground/views/components/loading_section.dart';
import 'package:playground/views/components/search_section.dart';
import 'package:playground/views/results_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final SearchController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SearchSection(),
                const SizedBox(height: 20),
                Obx(() => _searchController.isSearched.value
                    ? _searchController.isLoading.value
                        ? const LoadingSection()
                        : Expanded(child: ResultsPage())
                    : const Center(child: Text("Home Page"))),
              ],
            )),
          ),
        ));
  }
}
