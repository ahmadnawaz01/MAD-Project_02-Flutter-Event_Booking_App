import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app/admin/adminhomepage.dart';
import 'package:flutter/material.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController usercontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  bool loading=false;

  @override
  void dispose() {
   usercontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }


  Future<void> loginAdmin() async {
    final username = usercontroller.text.trim();
    final password = passcontroller.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 20),
        backgroundColor: const Color.fromARGB(255, 17, 16, 65),
        content: Text(
          "Enter Username and Password",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
      return;
    }

    setState(() => loading = true);

    try {
      final QuerySnapshot query = await FirebaseFirestore.instance
          .collection('Admin')
          .where('Username', isEqualTo: username)
          .where('Password', isEqualTo: password)
          .get();

      if (query.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 20),
        backgroundColor: const Color.fromARGB(255, 17, 16, 65),
        content: Text(
          "LoggedIn Successfully!",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Adminhomepage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 20),
        backgroundColor:Color.fromARGB(255, 17, 16, 65),
        content: Text(
          "Invalid Username and Password!!!",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
    finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.4,
                child: Center(
                  child: Image.asset(
                    'images/onboarding.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SizedBox(height: 16),
              const Text(
                'Admin Panel',
                style: TextStyle(
                  color: Color.fromARGB(255, 23, 20, 97),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 5),

              
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 23, 20, 97),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: usercontroller,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: InputBorder.none,
                    hintText: 'Enter Username',
                    hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
              ),

              SizedBox(height: 5),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 23, 20, 97),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: passcontroller,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: InputBorder.none,
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.white)
                  ),
                ),
              ),

              SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    loading?null:loginAdmin();

                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 23, 20, 97), // purple
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'LogIn',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}