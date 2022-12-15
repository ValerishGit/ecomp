import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/const_values.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    super.key,
  });

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back".toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold, color: Globals.primary_1),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(
              () => Text(
                _authController.activeUser.value.displayName.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        GestureDetector(
            onTap: () async {
              await _authController.logOutUser();
            },
            child: Icon(
              Icons.logout_sharp,
              color: Globals.primary_1,
            ))
      ],
    );
  }
}
