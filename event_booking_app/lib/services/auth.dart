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
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    final GoogleSignInAccount? googleUser =
        await googleSignIn.signIn();

    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential =
        GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final UserCredential result =
        await auth.signInWithCredential(credential);

    final User? user = result.user;
    if (user == null) return;

    final Map<String, dynamic> userInfoMap = {
      "name": user.displayName,
      "email": user.email,
      "image": user.photoURL,
      "id": user.uid,
    };

    await DatabaseMethods().addUserDetail(userInfoMap, user.uid);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 20),
        backgroundColor: const Color.fromARGB(255, 17, 16, 65),
        content: Text(
          "Registered Successfully!/n",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
await Future.delayed(const Duration(milliseconds: 800));
    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const BottomNav()),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:  const Color.fromARGB(255, 244, 37, 37),
        content: Text("Google Sign-In failed: $e"),
      ),
    );
  }
}

}
