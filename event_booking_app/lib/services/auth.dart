import 'package:event_booking_app/pages/bottom_nav.dart';
import 'package:event_booking_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return auth.currentUser;
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      
return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final UserCredential result =
        await auth.signInWithCredential(credential);

    final User? user = result.user;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Color.fromARGB(255, 17, 16, 65),
        content: 
        Text(
          "Erro!",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
    );
      return;
      }

    final Map<String, dynamic> userInfoMap = {
      "name": user.displayName,
      "email": user.email,
      "image": user.photoURL,
      "id": user.uid,
    };

    await DatabaseMethods().addUserDetail(userInfoMap, user.uid);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Color.fromARGB(255, 17, 16, 65),
        content: 
        Text(
          "Registered Successfully!",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomNav()),
    );
  }
}
