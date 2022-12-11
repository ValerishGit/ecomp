import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/controllers/search_controller.dart';
import 'package:playground/modals/search_results_modal.dart';
import 'package:playground/utils/const_values.dart';
import 'package:playground/views/components/product_section.dart';

import 'components/product_details.dart';
import 'components/section_title.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({super.key});
  final SearchController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ProductSection(
            headerTitle: "Cheapest",
            subTitle: "The cheapest result from each site",
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var site in _searchController.siteResults)
                _buildResultItems(
                  context,
                  site,
                )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => SectionTitle(
                title:
                    "${_searchController.selectedResult.value?.name} Results",
                subtitle: "Top results from each site"),
          ),
          resultList(context),
        ]),
      ),
    );
  }

  Widget resultList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ItemCard(
              product: _searchController.selectedResult.value!.products[index],
              src: _searchController.selectedResult.value!.name,
            );
          },
          itemCount: _searchController.selectedResult.value?.products.length,
        ),
      ),
    );
  }

  Widget _buildResultItems(BuildContext context, SiteResult site) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Obx(
        () => InkWell(
          onTap: () {
            _searchController.selectedResult(site);
          },
          child: Chip(
              backgroundColor: _searchController.selectedResult.value == site
                  ? Globals.primary_1
                  : null,
              label: Container(
                  width: 80,
                  child: Center(
                      child: Text(
                    site.name,
                    style: TextStyle(
                        color: _searchController.selectedResult.value == site
                            ? Colors.white
                            : null),
                  )))),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  ItemCard({
    super.key,
    required this.product,
    required this.src,
  });

  final Product product;
  final String src;

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
            builder: (context) => ProductDetails(product: product, src: src));
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
              child: Image.network(product.img,
                  width: 130, height: 130, fit: BoxFit.cover),
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
                          Text(src,
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
                              Text(product.rating,
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
                        child: Text(product.name,
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
                  Text(product.price,
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
