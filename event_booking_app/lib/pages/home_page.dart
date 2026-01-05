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
        padding: EdgeInsets.only(top: 50.0,left: 15.0,right: 15.0),
        width: MediaQuery.of( context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 200, 204, 248),Color.fromARGB(255, 174, 185, 246),Colors.white]
        ,begin: Alignment.topLeft,
        end: Alignment.bottomRight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              Text("Lahore, Punjab Pakistan",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),),
            ],
          ),
          SizedBox(height: 20.0,),
          Text("Hello, Ahmad",
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
              SizedBox(height: 10.0,),
          Text("There are 20 Events\naround your location.",
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff6351ec)
              ),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.only(left: 10.0,top: 5.0),
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0),),
               child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search_outlined),
                  border: InputBorder.none,
                  hintText: "Search for events",
                ),
               ),
              )
        ],),
      ),
    );
  }
}