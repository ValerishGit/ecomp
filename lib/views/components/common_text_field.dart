import 'package:flutter/material.dart';

import '../../utils/const_values.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.inverse = false,
      this.isHashed = false,
      required this.icon});

  final String hint;
  final IconData icon;
  final bool isHashed;
  final bool inverse;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        obscureText: isHashed,
        cursorColor: !inverse ? Globals.primary_1 : Colors.white,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            prefixIcon: Icon(
              icon,
              color: !inverse ? Globals.primary_1 : Colors.white,
            ),
            hintStyle:
                TextStyle(color: !inverse ? Globals.text_color : Colors.white),
            hintText: hint),
        controller: controller,
        style: TextStyle(color: !inverse ? Globals.text_color : Colors.white),
      ),
    );
  }
}
