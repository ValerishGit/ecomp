import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/search_controller.dart';
import '../../utils/const_values.dart';

class LogoSection extends StatelessWidget {
  LogoSection({
    Key? key,
  }) : super(key: key);

  final SearchController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Obx(
      () => AnimatedCrossFade(
        duration: const Duration(milliseconds: 200),
        crossFadeState: _searchController.isSearched.value
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        secondChild: Container(),
        firstChild: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "ECOMP",
                style: theme.textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w900, color: Globals.primary_1),
              ),
              Text(
                "Find the cheapest product across multiple sites",
                style: theme.textTheme.headline6!.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
