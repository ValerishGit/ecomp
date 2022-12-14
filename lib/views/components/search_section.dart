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
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Obx(
            () => AnimatedSize(
              duration: const Duration(milliseconds: 200),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _searchController.resetView();
                    },
                    child: Icon(
                      Icons.arrow_back.reactive.value,
                      color: Globals.primary_1,
                      size: _searchController.isSearched.value ? 20 : 0,
                    ),
                  ),
                  SizedBox(width: _searchController.isSearched.value ? 20 : 0),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: Obx(
                () => TextField(
                  readOnly: _searchController.isLoading.value,
                  cursorColor: Globals.primary_1,
                  onSubmitted: (val) {
                    _searchController.searchCall(val);
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            _searchController.searchController.clear();
                          },
                          child: const Icon(Icons.clear)),
                      hintText: "Search for a product"),
                  controller: _searchController.searchController,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              _searchController
                  .searchCall(_searchController.searchController.text);
            },
            child: Icon(
              Icons.search,
              color: Globals.primary_1,
            ),
          ),
        ],
      ),
    );
  }
}
