import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  var profilePicUrl = ''.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _fetchUserProfilePicUrl();
  }

  void _fetchUserProfilePicUrl() async {
    String? userId = _auth.currentUser?.uid;

    if (userId != null) {
      try {
         DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();

        if (userDoc.exists) {
          Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
          profilePicUrl.value = userData['profilePicUrl'] ?? '';
        }
      } catch (e) {
        print("Errore nel recupero dell'URL dell'immagine del profilo: $e");
      }
    }
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    switch (index) {
      case 0:
        Get.toNamed('/menu');
        break;
      case 1:
        Get.toNamed('/cart');
        break;
      default:
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.AUTH);
  }

  void goToProfile() {
    Get.toNamed(Routes.PROFILE);
  }
}
