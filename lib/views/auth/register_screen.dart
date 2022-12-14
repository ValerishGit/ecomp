import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/controllers/auth_controller.dart';

import '../../utils/const_values.dart';
import '../components/common_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController _emailController = TextEditingController(),
      _displayNameController = TextEditingController(),
      _passwordController = TextEditingController();
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Globals.primary_1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Obx(
            () => Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        _authController.errText("");
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "REGISTER",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  )
                ],
              ),
              Expanded(
                child: !_authController.isLoading.value
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthTextField(
                              inverse: true,
                              controller: _emailController,
                              hint: "Email",
                              icon: Icons.email),
                          const SizedBox(
                            height: 10,
                          ),
                          AuthTextField(
                              inverse: true,
                              controller: _passwordController,
                              hint: "Password",
                              icon: Icons.password,
                              isHashed: true),
                          const SizedBox(
                            height: 10,
                          ),
                          AuthTextField(
                              inverse: true,
                              controller: _displayNameController,
                              hint: "Display Name",
                              icon: Icons.person,
                              isHashed: false),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => SizedBox(
                                height: 30,
                                child: Text(
                                  _authController.errText.value,
                                  style: const TextStyle(color: Colors.white),
                                )),
                          ),
                          SizedBox(
                            width: 200,
                            child: TextButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.white)),
                                onPressed: () {
                                  _authController.createUserWithCred(
                                      _emailController.text,
                                      _passwordController.text,
                                      _displayNameController.text);
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: Globals.primary_1),
                                )),
                          )
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
