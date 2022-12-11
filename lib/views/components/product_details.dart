import 'package:flutter/material.dart';

import 'package:playground/modals/search_results_modal.dart';
import 'package:playground/utils/const_values.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product, required this.src});

  final Product product;
  final String src;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
              child: Image.network(
                product.img,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            product.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.price,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Globals.primary_1,
                      fontSize: 50),
                ),
                Text(
                  "from $src",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Globals.primary_1,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
            width: 200,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "BUY NOW",
                style: TextStyle(color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
