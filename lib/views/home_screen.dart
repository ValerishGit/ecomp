import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/controllers/search_controller.dart';
import 'package:playground/utils/const_values.dart';
import 'package:playground/views/components/loading_section.dart';
import 'package:playground/views/components/logo_section.dart';
import 'package:playground/views/components/search_section.dart';
import 'package:playground/views/results_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final SearchController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LogoSection(),
                const SizedBox(height: 20),
                SearchSection(),
                const SizedBox(height: 60),
                Obx(() => !_searchController.showLogo.value
                    ? _searchController.isLoading.value
                        ? const LoadingSection()
                        : Expanded(child: ResultsPage())
                    : Container()),
              ],
            )),
          ),
        ));
  }
}
