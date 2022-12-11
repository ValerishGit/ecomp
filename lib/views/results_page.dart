import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:playground/controllers/search_controller.dart';
import 'package:playground/utils/const_values.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({super.key});
  final SearchController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Cheapest",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Globals.primary_1, fontWeight: FontWeight.bold),
          ),
          Text(
            "The cheapest result from each site",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(height: 370, child: cheapestCarousel(context)),
          Text(
            "Results",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Globals.primary_1, fontWeight: FontWeight.bold),
          ),
          Text(
            "All top results categorized by site",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white30, fontWeight: FontWeight.bold),
          ),
          SizedBox(child: resultList(context)),
        ]),
      ),
    );
  }

  Widget resultList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            // store this controller in a State to save the carousel scroll position
            itemCount: _searchController.siteResults.length,
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildResultItems(context, itemIndex, 150);
            },
          ),
        )
      ],
    );
  }

  Widget cheapestCarousel(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 340.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.7, initialPage: 1),
            itemCount: _searchController.siteResults.length,
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, itemIndex, 230);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex, double size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      child: Card(
        elevation: 6,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network(
                    _searchController.siteResults[itemIndex].cheap.img,
                    // width: 300,
                    height: size,
                    fit: BoxFit.fill),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                trailing: Text(
                  _searchController.siteResults[itemIndex].cheap.price
                      .replaceAll('<span class="DEFAULT">', "")
                      .replaceAll("</span>", ""),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Globals.primary_1,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  _searchController.siteResults[itemIndex].name,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Globals.primary_1),
                ),
                title: Text(
                    _searchController.siteResults[itemIndex].cheap.shortName(),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Globals.text_color,
                        fontWeight: FontWeight.bold)),
                isThreeLine: false,
              ),
            ]),
      ),
    );
  }

  Widget _buildResultItems(BuildContext context, int itemIndex, double size) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, // add this
          children: [
            ListTile(
              title: Text(_searchController.siteResults[itemIndex].name,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Globals.text_color, fontWeight: FontWeight.bold)),
              isThreeLine: false,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:
                    _searchController.siteResults[itemIndex].products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: ListTile(
                      trailing: Text(
                        _searchController
                            .siteResults[itemIndex].products[index].price
                            .replaceAll('<span class="DEFAULT">', "")
                            .replaceAll("</span>", ""),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Globals.primary_1,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            _searchController
                                .siteResults[itemIndex].products[index].img,
                            // width: 300,
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill),
                      ),
                      title: Text(
                          _searchController
                              .siteResults[itemIndex].products[index]
                              .shortName(),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Globals.text_color,
                                  fontWeight: FontWeight.bold)),
                      isThreeLine: false,
                    ),
                  );
                })
          ]),
    );
  }
}
