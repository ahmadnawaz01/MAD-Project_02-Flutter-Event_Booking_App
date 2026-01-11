import 'package:event_booking_app/services/keys.dart';
import 'package:event_booking_app/services/sharedpreferences.dart';
import 'package:event_booking_app/services/database.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class DetailedPage extends StatefulWidget {
  final String image;
  final String name;
  final String detail;
  final String price;
  final String date;
  final String location;

  const DetailedPage({
    super.key,
    required this.image,
    required this.name,
    required this.detail,
    required this.price,
    required this.date,
    required this.location,
  });

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  Map<String, dynamic>? paymentIntent;
  int numberoftickets = 1;
  int total = 0;
  double priceInDollar = 0;

  final String secretKey = secretkey;
  String? name, image, id;

  @override
  void initState() {
    super.initState();
    onTheLoad();
    total = int.parse(widget.price);
  }

  onTheLoad() async {
    name = await SharedpreferenceHelper().getUserName();
    image = await SharedpreferenceHelper().getUserImage();
    id = await SharedpreferenceHelper().getUserId();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 244, 244, 244),
                  Color.fromARGB(255, 180, 234, 250),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      widget.image,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.2,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              margin: const EdgeInsets.only(
                                top: 40.0,
                                left: 15.0,
                              ),
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 23, 20, 97),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(left: 10.0),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(168, 23, 20, 97),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10.0),
                                Text(
                                  widget.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                      size: 18.0,
                                    ),
                                    const SizedBox(width: 5.0),
                                    Text(
                                      widget.date,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(width: 30.0),
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 19.0,
                                    ),
                                    const SizedBox(width: 5.0),
                                    Text(
                                      widget.location,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "About Event",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    widget.detail,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0),
                  child: Row(
                    children: [
                      const Text(
                        "Number of Tickets",
                        style: TextStyle(
                          fontSize: 21.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 40.0),
                      Container(
                        width: 50.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 23, 20, 97),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  total += int.parse(widget.price);
                                  numberoftickets++;
                                });
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(
                                  fontSize: 27.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              numberoftickets.toString(),
                              style: const TextStyle(
                                fontSize: 25.0,
                                color: Color.fromARGB(255, 23, 20, 97),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (numberoftickets > 1) {
                                  setState(() {
                                    numberoftickets--;
                                    total -= int.parse(widget.price);
                                  });
                                }
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(
                                  fontSize: 27.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "Amount : Rs $total",
                        style: const TextStyle(
                          fontSize: 22.0,
                          color: Color.fromARGB(255, 23, 20, 97),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () async {
                          priceInDollar = total / 280;
                            await makePayment(priceInDollar.toString());
                    
                        },
                        child: Container(
                          width: 130.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 23, 20, 97),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Center(
                            child: Text(
                              "Book Now",
                              style: TextStyle(
                                fontSize: 21.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> makePayment(String amountInUsd) async {
    try {
      paymentIntent = await createPaymentIntent(amountInUsd, 'USD');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent?['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Ahmad',
        ),
      );

      await displayPaymentSheet();
    } catch (e, s) {
      print('exception: $e');
      print('stacktrace: $s');
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet()
          .then((value) {
            Map<String, dynamic> bookingdetails = {
              "Number": numberoftickets.toString(),
              "Total": total.toString(),
              "Event": widget.name,
              "Location": widget.location,
              "Date": widget.date,
              "Name": name,
              "Image": image,
            };
            DatabaseMethods()
                .addUserBooking(bookingdetails, id!)
                .then((value) => {});
            DatabaseMethods()
                .addadminticket(bookingdetails)
                .then((value) => {});
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(width: 8),
                        Text('Payment Successful'),
                      ],
                    ),
                  ],
                ),
              ),
            );
            paymentIntent = null;
          })
          .onError((error, stackTrace) {
            print("Error is ==> $error $stackTrace");
            throw Exception(error);
          });
    } on StripeException catch (e) {
      print("Stripe error is ==> ${e.error.localizedMessage}");
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(content: Text('Payment canceled')),
      );
    } catch (e) {
      print("Error is ==> $e");
    }
  }

  Future<Map<String, dynamic>?> createPaymentIntent(
    String amountInUsd,
    String currency,
  ) async {
    try {
      final doubleValue = double.parse(amountInUsd);
      final intInCents = (doubleValue * 100).round();

      Map<String, dynamic> body = {
        'amount': intInCents.toString(),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      print('Stripe response: ${response.body}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
      return null;
    }
  }
}
