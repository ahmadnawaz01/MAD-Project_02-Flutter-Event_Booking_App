import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:event_booking_app/pages/booking.dart';
import 'package:event_booking_app/pages/home_page.dart';
import 'package:event_booking_app/pages/profile.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;
  late Home home;
  late Booking booking;
  late Profile profile;
  int currtab = 0;
  @override
  void initState() {
    home = Home();
    booking = Booking();
    profile = Profile();
    pages = [home, booking, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        onTap: (int index){
          setState(() {
            currtab = index;
          });
        } ,
        backgroundColor: Color.fromARGB(255, 87, 219, 255),
        color: const Color.fromARGB(255, 23, 20, 97),
        animationDuration: Duration(milliseconds: 500),
        items: [
          Icon(Icons.home_outlined, color: Colors.white,size: 25.0,),
          Icon(Icons.book, color: Colors.white,size: 25.0,),
          Icon(Icons.person, color: Colors.white,size: 25.0,),
        ],
      ),
      body: pages[currtab],
    );
  }
}
