import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app/pages/detailed_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
} 

class _HomeState extends State<Home> {
  Stream<QuerySnapshot>? eventstream;

  @override
  void initState() {
    super.initState();
    eventstream = FirebaseFirestore.instance.collection("Event").snapshots();
  }

  Widget allEvents() {
    return StreamBuilder<QuerySnapshot>(
      stream: eventstream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No events found"));
        }

        final docs = snapshot.data!.docs;

        return ListView.builder(
          key: const PageStorageKey("events_list"),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final ds = docs[index];
            String inputDate = ds["Date"];
            DateTime parseddate = DateTime.parse(inputDate);
            String formatdate = DateFormat('MMM,dd').format(parseddate);

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailedPage(
                      image: ds["Image"],
                      name: ds["Name"],
                      detail: ds["Detail"],
                      price: ds["Price"],
                      date: ds["Date"],
                      location: ds["Location"],
                    ),
                  ),
                );
              },
              child: Column(
                key: ValueKey(ds.id),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            ds["Image"],
                            fit: BoxFit.cover,
                            height: 180.0,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        Container(
                          width: 50.0,
                          margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 23, 20, 97),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(7),
                              child: Text(
                                formatdate,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14.0,
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
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ds["Name"],
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rs. ${ds["Price"]}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 18.0,
                        color: Colors.black,
                      ),
                      Text(
                        ds["Location"],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
        width: MediaQuery.of(context).size.width,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.location_on_outlined, color: Colors.black),
                    Text(
                      "Lahore, Punjab Pakistan",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                const Text(
                  "Hello, Ahmad",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  "There are 20 Events\naround your location.",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 71, 201),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 5.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 23, 20, 97),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                      hintText: "Search for events",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 75.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      categoryTile("images/music.png", "Music"),
                      const SizedBox(width: 10.0),
                      categoryTile("images/tshirt.png", "Clothing"),
                      const SizedBox(width: 10.0),
                      categoryTile("images/party.png", "Festival"),
                      const SizedBox(width: 10.0),
                      categoryTile("images/dish.png", "Food"),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Upcoming Events",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                allEvents(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget categoryTile(String image, String title) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 23, 20, 97),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(5.0),
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 30.0, width: 30.0, color: Colors.white),
            Text(
              title,
              style: const TextStyle(
                fontSize: 17.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
