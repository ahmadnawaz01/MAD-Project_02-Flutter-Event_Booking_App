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
      body: Container(
        child: Column(
          children: [
            Image.asset("images/onboarding.jpg"),
            SizedBox(height: 20.0),
            Text(
              "Unlock the Future of",
              style: TextStyle(
                color: Colors.black,
                fontSize: 29.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Event Booking App",
              style: TextStyle(
                color: Color(0xff6351ec),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Discover, book, and experience unforgettable moments effortlessly!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45, fontSize: 17.0),
            ),
            SizedBox(height: 50.0,),
            Container(
              margin: EdgeInsets.only(left: 30.0,right: 30.0),
              height: 60,
              decoration: BoxDecoration(color: Color(0xff6351ec),borderRadius: BorderRadius.circular(40.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/google.png",
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                SizedBox(width: 10.0,),
                  Text(
                    "Sign With Google",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 17.0,
                    fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
