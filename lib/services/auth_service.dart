import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:threads_clone/models/user_model.dart';
import 'package:threads_clone/services/storage_service.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List profilePic,
  }) async {
    String res = "An error occured";

    try {
      if (userName.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          bio.isNotEmpty &&
          profilePic.isNotEmpty) {
        //create a new user with email and password
        final UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        //upload the profile image to the firebase storage
        String photoURL = await StorageMethods()
            .uploadImage("ProfileImages", false, profilePic);

        //user model
        UserModal user = UserModal(
          uid: _auth.currentUser!.uid,
          email: email,
          userName: userName,
          bio: bio,
          profilePic: photoURL,
          followers: [],
          following: [],
        );

        //if the user is created store the user data in the firestore
        if (userCredential.user != null) {
          //store the user data in the firestore
          await _firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .set(
                user.toJSON(),
              );

          res = "success";
        }
      }
    }
    //catch the errors extra error handling
    on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        res = "Invalid email";
      } else if (error.code == "weak-password") {
        res = "Weak password";
      } else if (error.code == "email-already-in-use") {
        res = "Email already in use";
      }
    } catch (error) {
      res = error.toString();
    }

    return res;
  }
}
