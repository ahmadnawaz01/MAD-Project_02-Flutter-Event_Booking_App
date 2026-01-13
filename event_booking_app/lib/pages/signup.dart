import 'package:event_booking_app/admin/adminlogin.dart';
import 'package:event_booking_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/onboarding.jpg"),
            const SizedBox(height: 20),
            const Text(
              "Unlock the Future of",
              style: TextStyle(
                color: Colors.black,
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Event Booking App",
              style: TextStyle(
                color: Color.fromARGB(255, 51, 45, 238),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Discover, book, and experience unforgettable moments effortlessly!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black45, fontSize: 17),
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                AuthMethods().signInWithGoogle(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 33, 81, 255),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/google.png", height: 30, width: 30),
                    const SizedBox(width: 10),
                    const Text(
                      "Sign With Google",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AdminLoginPage()),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Admin Panel",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
