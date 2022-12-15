import 'package:flutter/material.dart';

class HomeContentSection extends StatelessWidget {
  const HomeContentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return developmentPlaceholder();
  }

  Column developmentPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Try searching for a product!".toUpperCase(),
          style: const TextStyle(color: Colors.grey, fontSize: 20),
        ),
        const Text(
          "More content coming soon!",
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
