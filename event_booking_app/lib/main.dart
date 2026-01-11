
import 'package:event_booking_app/admin/ticket_event.dart';
import 'package:event_booking_app/admin/upload_event.dart';
import 'package:event_booking_app/pages/bottom_nav.dart';
import 'package:event_booking_app/pages/signup.dart';
import 'package:event_booking_app/services/keys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=publishkey;
  await Stripe.instance.applySettings();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TicketEvent()
    );
  }
}
