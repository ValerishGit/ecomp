import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/const_values.dart';

class LoadingSection extends StatelessWidget {
  const LoadingSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitSpinningLines(
            color: Globals.primary_1,
            size: 150.0,
          ),
          const SizedBox(height: 50),
          Text(
            "Hang tight, we will find what you are looking for",
            style: TextStyle(color: Globals.primary_1.withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}
