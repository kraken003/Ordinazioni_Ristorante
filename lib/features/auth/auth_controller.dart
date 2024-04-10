import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ordinazioni_ristorante_flutter/routes/routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
      await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      Get.offAllNamed(Routes.HOME); // O naviga alla pagina che preferisci dopo la registrazione
    } catch (e) {
      Get.snackbar('Errore', 'Impossibile registrare l\'utente: ${e.toString()}');
    }
  }

}
