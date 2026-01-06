import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 230, 240, 255),
              Color.fromARGB(255, 245, 248, 255),
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
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: Color.fromARGB(255, 25, 105, 255)),
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
                SizedBox(height: 20.0),
                Text(
                  "Hello, Ahmad",
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "There are 20 Events\naround your location.",
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 25, 105, 255),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 5.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search_outlined,
                        color: Color.fromARGB(255, 25, 105, 255),
                      ),
                      border: InputBorder.none,
                      hintText: "Search for events",
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 75.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      categoryTile("images/music.png", "Music"),
                      SizedBox(width: 10.0),
                      categoryTile("images/tshirt.png", "Clothing"),
                      SizedBox(width: 10.0),
                      categoryTile("images/party.png", "Festival"),
                      SizedBox(width: 10.0),
                      categoryTile("images/dish.png", "Food"),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        color: Color.fromARGB(255, 25, 105, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                eventCard(),
                SizedBox(height: 20.0),
                eventCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// CATEGORY TILE (only colors styled)
  Widget categoryTile(String image, String title) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(5.0),
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 30.0, width: 30.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// EVENT CARD (only colors styled)
  Widget eventCard() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "images/party.jpg",
                  fit: BoxFit.cover,
                  height: 180.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Container(
                width: 50.0,
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Jan\n24",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 25, 105, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Carnival Festival",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Rs.2500",
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 25, 105, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.location_on,
                size: 18.0,
                color: Colors.black),
            Text(
              "Lahore, Pakistan",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ],
    );
  }
}
