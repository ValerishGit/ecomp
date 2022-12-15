import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/controllers/search_controller.dart';
import 'package:playground/services/firebase_service.dart';
import 'package:playground/views/components/loading_section.dart';
import 'package:playground/views/components/search_section.dart';
import 'package:playground/views/results_page.dart';

import '../utils/const_values.dart';
import 'components/header_section.dart';
import 'components/home_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final SearchController _searchController = Get.find();
  final TextEditingController _feedbacl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Globals.primary_1,
            onPressed: () {
              feedbackModal(context);
            },
            child: const Icon(
              Icons.feedback_outlined,
              color: Colors.white,
            )),
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SafeArea(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SearchSection(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => !_searchController.isSearched.value
                        ? Expanded(
                            child: Column(
                              children: [
                                HeaderWidget(),
                                const SizedBox(
                                  height: 40,
                                ),
                                const Expanded(
                                  child: HomeContentSection(),
                                ),
                              ],
                            ),
                          )
                        : !_searchController.isLoading.value
                            ? Expanded(child: ResultsPage())
                            : LoadingSection(
                                searchTerm: _searchController.searchTerm.value,
                              ),
                  ),
                ],
              ),
            )),
          ),
        ));
  }

  Future<dynamic> feedbackModal(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
        context: context,
        builder: ((context) => SizedBox(
              height: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 28.0, horizontal: 18),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Let us know what we can do to improve / add to the app",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        cursorColor: Globals.primary_1,
                        onSubmitted: (val) {},
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                              onTap: () {
                                _feedbacl.clear();
                              },
                              child: const Icon(Icons.clear)),
                        ),
                        controller: _feedbacl,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () async {
                            if (_feedbacl.text.isEmpty) return;
                            await FirebaseService.addFeedback(_feedbacl.text);
                            _feedbacl.clear();
                            Get.back();
                            Get.snackbar(
                                "Feedback sent", "Thank you for your feedback!",
                                snackPosition: SnackPosition.BOTTOM);
                          },
                          child: const Text(
                            "Submit feedback",
                            style: TextStyle(color: Colors.white),
                          ))
                    ]),
              ),
            )));
  }
}
