import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/search_controller.dart';
import '../../utils/const_values.dart';

class SearchSection extends StatelessWidget {
  SearchSection({
    Key? key,
  }) : super(key: key);

  final SearchController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedCrossFade(
        duration: const Duration(milliseconds: 200),
        secondChild: Row(
          children: [
            GestureDetector(
              onTap: () {
                _searchController.resetView();
              },
              child: Icon(
                Icons.arrow_back,
                size: 40,
                color: Globals.primary_1,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  cursorColor: Globals.primary_1,
                  onSubmitted: (val) {
                    _searchController.searchCall(val);
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search for a product"),
                  controller: _searchController.searchController,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _searchController
                    .searchCall(_searchController.searchController.text);
              },
              child: Icon(
                Icons.search,
                size: 40,
                color: Globals.primary_1,
              ),
            ),
          ],
        ),
        firstChild: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onSubmitted: (val) {
                  _searchController.searchCall(val);
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search for a product"),
                controller: _searchController.searchController,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                _searchController
                    .searchCall(_searchController.searchController.text);
              },
              child: const Text("Search"),
            ),
          ],
        ),
        crossFadeState: _searchController.showLogo.value
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }
}
