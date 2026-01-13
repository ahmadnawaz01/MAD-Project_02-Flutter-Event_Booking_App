import 'package:event_booking_app/pages/qrcode.dart';
import 'package:event_booking_app/services/sharedpreferences.dart';
import 'package:event_booking_app/services/auth.dart';   
import 'package:event_booking_app/pages/signup.dart';          
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? image, name, email, id;

  // load values from SharedPreferences
  getthesharedpref() async {
    id = await SharedpreferenceHelper().getUserId();
    image = await SharedpreferenceHelper().getUserImage();
    name = await SharedpreferenceHelper().getUserName();
    email = await SharedpreferenceHelper().getUserEmail();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getthesharedpref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 10),
         decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 235, 246, 249),
              Color.fromARGB(255, 87, 219, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 23, 20, 97),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.teal,
                backgroundImage:
                    (image != null && image!.isNotEmpty) ? NetworkImage(image!) : null,
                child: (image == null || image!.isEmpty)
                    ? Text(
                        (name != null && name!.isNotEmpty)
                            ? name![0].toUpperCase()
                            : 'S',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            Container(
             padding: const EdgeInsets.only(
                  left: 5.0, top: 5.0, bottom: 10.0),
              margin:
                  EdgeInsets.only(left: 30.0, right: 30.0, bottom: 25.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.black54),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 23, 20, 97)
              ),
              child: Row(
                children: [
                   Icon(Icons.person_outline,color: Colors.white,size: 20.0,),
                   SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        name ?? "",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(
                  left: 5.0, top: 5.0, bottom: 10.0),
              margin:
                  EdgeInsets.only(left: 30.0, right: 30.0, bottom: 25.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.black54),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 23, 20, 97)
              ),
              child: Row(
                children: [
                  Icon(Icons.email_outlined,size: 20.0,color: Colors.white,),
                   SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        email ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                AuthMethods().SignOut().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                });
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 15.0, bottom: 15.0,right: 20.0),
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.black54),
                  color: Color.fromARGB(255, 23, 20, 97),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.logout,color: Colors.white,size: 20.0,),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "LogOut",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 20,color: Colors.white,),
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                AuthMethods().deleteuser().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                });
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 15.0, bottom: 20.0,right: 20),
                margin:
                    EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.black54),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 23, 20, 97)
                ),
                child: Row(
                  children: const [
                    Icon(Icons.delete_outline,color: Colors.white,size: 20,),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Delete Account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 20,color: Colors.white,),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QrScanPage(),
                    ),
                  );
              
              },
              child: Container(
                padding:  EdgeInsets.only(
                    left: 10.0, top: 15.0, bottom: 15.0,right: 20),
                margin:
                    EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.black54),
                  color: Color.fromARGB(255, 23, 20, 97),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.qr_code,color: Colors.white,),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        "QR Code Scanner",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 20,color: Colors.white,),
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