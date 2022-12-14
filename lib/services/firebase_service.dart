import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:playground/modals/user_modal.dart';

class FirebaseService {
  static Future<UserCredential?> createUserWithCred(
      String email, String password, String displayName) async {
    UserCredential credential;
    if (email.isEmpty || password.isEmpty || displayName.isEmpty) {
      throw "All fields are mandatory";
    }
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        credential.user!.updateDisplayName(displayName);
      }
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        throw "Email already in use";
      } else if (e.code == 'invalid-email') {
        throw "Email Address is not Valid";
      }
    }
    return null;
  }

  static Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  static addToDB(UserClass user) async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await FirebaseFirestore.instance
          .collection('usersCollection')
          .doc(currentUser.uid)
          .set({
        "displayName": currentUser.displayName,
        "email": currentUser.email,
        "lastLogin": user.lastLogin
      });
    }
  }

  static updateLastLogin() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await FirebaseFirestore.instance
          .collection('usersCollection')
          .doc(currentUser.uid)
          .update({"lastLogin": DateTime.now()});
    }
  }

  static Future<UserCredential?> loginWithCred(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw "Wrong Email or Password";
      } else if (e.code == 'wrong-password') {
        throw "Wrong Email or Password";
      } else if (e.code == 'invalid-email') {
        throw "Email Address is not Valid";
      }
    }
    return null;
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      return null;
    }
  }
}
