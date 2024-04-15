import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import '../utils/order.dart';

class ProfileController extends GetxController {
  var profileImageUrl = ''.obs;
  var userEmail = ''.obs;
  var orders = <RestaurantOrder>[].obs;
  var isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  @override
  void onReady() {
    super.onReady();
    fetchUserData();
    fetchOrders();
  }

  void fetchUserData() async {
    isLoading(true);
    try {
      var user = _auth.currentUser;
      if (user != null) {
        userEmail.value = user.email ?? '';
        var userDoc = await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.data() != null) {
          profileImageUrl.value = userDoc.data()!['profilePicUrl'] ?? '';
        }
      }
    } catch (e) {
      Get.snackbar('Errore', 'Impossibile caricare i dati utente');
    } finally {
      isLoading(false);
    }
  }

  void fetchOrders() {
    var user = _auth.currentUser;
    if (user != null) {
      _firestore.collection('orders')
          .where('userId', isEqualTo: user.uid)
          .orderBy('orderTime', descending: true)
          .snapshots().listen((snapshot) {
        orders.value = snapshot.docs.map((doc) => RestaurantOrder.fromFirestore(doc)).toList();
      });
    }
  }

  Future<void> updateProfilePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      try {
        isLoading(true);
        var user = _auth.currentUser;
        if (user != null) {
          var storageRef = _storage.ref().child('user_profile/${user.uid}');
          var uploadTask = await storageRef.putFile(imageFile);
          var downloadUrl = await uploadTask.ref.getDownloadURL();
          await _firestore.collection('users').doc(user.uid).update({'profilePicUrl': downloadUrl});
          profileImageUrl.value = downloadUrl;
        }
      } catch (e) {
        Get.snackbar('Errore', 'Impossibile aggiornare l\'immagine del profilo');
      } finally {
        isLoading(false);
      }
    }
  }
}
