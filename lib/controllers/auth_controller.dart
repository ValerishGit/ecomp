import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:playground/services/firebase_service.dart';
import 'package:playground/views/auth/login_screen.dart';
import 'package:playground/views/home_screen.dart';

import '../modals/user_modal.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errText = "".obs;
  late Rx<UserClass> activeUser = UserClass().obs;

  AuthController() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        activeUser(UserClass(
            displayName: user.displayName ?? "",
            email: user.email ?? "",
            lastLogin: DateTime.now(),
            token: await user.getIdToken()));
        FirebaseService.updateLastLogin();
        // Get.off(() => HomeScreen());
      } else {
        activeUser(UserClass());
      }
    });
  }

  Future<void> logOutUser() async {
    await FirebaseService.logOutUser();
    Get.off(() => LoginScreen());
  }

  void checkAuthStatus() {}

  Future<void> loginWithCred(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      errText("Fields cant be empty");
      return;
    }
    isLoading(true);
    try {
      UserCredential? cred =
          await FirebaseService.loginWithCred(email, password);
      if (cred != null) {
        activeUser(UserClass(
            displayName: cred.user!.displayName ?? "",
            email: cred.user!.email ?? "",
            token: await cred.user!.getIdToken()));
      }
    } catch (e) {
      errText(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading(true);
    try {
      UserCredential? cred = await FirebaseService.signInWithGoogle();
      if (cred == null) return;
      activeUser(UserClass(
          displayName: cred.user!.displayName ?? "",
          email: cred.user!.email ?? "",
          lastLogin: DateTime.now(),
          token: await cred.user!.getIdToken()));
      FirebaseService.addToDB(activeUser.value);
    } catch (e) {
      errText(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> createUserWithCred(
      String email, String password, String displayName) async {
    isLoading(true);
    try {
      UserCredential? cred = await FirebaseService.createUserWithCred(
          email, password, displayName);
      if (cred != null) {
        cred = await FirebaseService.loginWithCred(email, password);
        if (cred != null) {
          await cred.user!.updateDisplayName(displayName);
          activeUser(UserClass(
              displayName: cred.user!.displayName ?? "",
              email: cred.user!.email ?? "",
              lastLogin: DateTime.now(),
              token: await cred.user!.getIdToken()));
        }
      }
      await FirebaseService.addToDB(activeUser.value);
      Get.offAll(() => HomeScreen());
    } catch (e) {
      errText(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
