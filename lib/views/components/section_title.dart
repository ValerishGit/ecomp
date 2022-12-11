import 'package:flutter/material.dart';

import '../../utils/const_values.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Globals.primary_1, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Globals.text_color, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
