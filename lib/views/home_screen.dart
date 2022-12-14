import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/controllers/auth_controller.dart';
import 'package:playground/controllers/search_controller.dart';
import 'package:playground/utils/const_values.dart';
import 'package:playground/views/components/loading_section.dart';
import 'package:playground/views/components/search_section.dart';
import 'package:playground/views/results_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final SearchController _searchController = Get.find();
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(
                  height: 20,
                ),
                SearchSection(),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Obx(() => _searchController.isSearched.value
                          ? _searchController.isLoading.value
                              ? const LoadingSection()
                              : Expanded(child: ResultsPage())
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Welcome Back".toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Globals.primary_1),
                                      ),
                                      Text(
                                        _authController
                                            .activeUser.value.displayName
                                            .toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 100,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Try searching for a product!"
                                                .toUpperCase(),
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20),
                                          ),
                                          const Text(
                                            "More content coming soon!",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ));
  }
}
