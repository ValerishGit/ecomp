import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground/controllers/auth_controller.dart';
import 'package:playground/views/auth/register_screen.dart';

import '../../utils/const_values.dart';
import '../components/common_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Globals.primary_1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Obx(
              () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ONE",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 60,
                                      shadows: [
                                    const Shadow(
                                        color: Colors.white, blurRadius: 5)
                                  ]),
                            ),
                            const Text(
                              "SHOP",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  shadows: [
                                    Shadow(color: Colors.white, blurRadius: 5)
                                  ],
                                  fontWeight: FontWeight.w100,
                                  fontSize: 60,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                          "TO RULE THEM ALL",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              const Shadow(color: Colors.white, blurRadius: 5)
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    SizedBox(
                      height: 400,
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
                                Obx(
                                  () => SizedBox(
                                      height: 30,
                                      child: Text(
                                        _authController.errText.value,
                                        style: const TextStyle(
                                            color: Colors.white),
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
                                        _authController.loginWithCred(
                                            _emailController.text,
                                            _passwordController.text);
                                      },
                                      child: Text(
                                        "Sign In",
                                        style:
                                            TextStyle(color: Globals.primary_1),
                                      )),
                                ),
                                const Text(
                                  "OR",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: TextButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll<Color>(
                                                  Colors.white)),
                                      onPressed: () {
                                        _authController.signInWithGoogle();
                                      },
                                      child: Text(
                                        "Connect With Google",
                                        style:
                                            TextStyle(color: Globals.primary_1),
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => RegisterScreen());
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "First Time?",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        " Sign up",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
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
      ),
    );
  }
}
