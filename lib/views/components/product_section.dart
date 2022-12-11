import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/controllers/search_controller.dart';
import 'package:playground/views/components/product_details.dart';
import 'package:playground/views/components/section_title.dart';

import '../../modals/search_results_modal.dart';
import '../../utils/const_values.dart';

class ProductSection extends StatelessWidget {
  ProductSection(
      {super.key, required this.headerTitle, required this.subTitle});

  final String headerTitle;
  final String subTitle;
  final SearchController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: [
        SectionTitle(
          title: headerTitle,
          subtitle: subTitle,
        ),
        ItemList(results: _searchController.siteResults.value),
      ],
    );
  }
}

class ItemList extends StatelessWidget {
  ItemList({super.key, required this.results});
  final List<SiteResult> results;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // store this controller in a State to save the carousel scroll position
      itemCount: results.length,
      itemBuilder: (BuildContext context, int itemIndex) {
        return ItemListItem(itemIndex: itemIndex);
      },
    );
  }
}

class ItemListItem extends StatelessWidget {
  ItemListItem({
    super.key,
    required this.itemIndex,
  });

  final int itemIndex;
  final SearchController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            context: context,
            builder: (context) => ProductDetails(
                product: _searchController.siteResults[itemIndex].cheap,
                src: _searchController.siteResults[itemIndex].name));
      },
      child: Card(
        elevation: 2,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
              child: Image.network(
                  _searchController.siteResults[itemIndex].cheap.img,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_searchController.siteResults[itemIndex].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Globals.primary_1)),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 15,
                              ),
                              Text(
                                  _searchController
                                      .siteResults[itemIndex].cheap.rating,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                            _searchController.siteResults[itemIndex].cheap.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Globals.text_color,
                                    fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(_searchController.siteResults[itemIndex].cheap.price,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Globals.primary_1,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
