import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../routes/routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar('Errore', 'Impossibile effettuare il login');
    }
  }

  void logout() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.AUTH);
  }

  void signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim()
      );
      String userId = userCredential.user!.uid;
      await _firestore.collection('users').doc(userId).set({
        'email': email.trim(),
        'profilePicUrl': null,
      });
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar('Errore', 'Impossibile registrare l\'utente: ${e.toString()}');
      print(e.toString());
    }
  }
}