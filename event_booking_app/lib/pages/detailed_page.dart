import 'package:flutter/material.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [Container(
          decoration: BoxDecoration(
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
                    "images/party.jpg",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.2,
                    fit: BoxFit.cover,
                  ),
                  Container(
                     width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height /2.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            margin: EdgeInsets.only(top: 40.0, left: 15.0),
                            padding: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 23, 20, 97),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),
                        Container(width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(168, 23, 20, 97),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0,),
                            Text("Carnival Festival 2026",style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10.0,),
                            Row(children: [
                              Icon(Icons.calendar_month, color: Colors.white, size: 1.0,),
                              SizedBox(width: 5.0,),
                              Text("24 JAN 2026", style: TextStyle(color: Colors.white, fontSize: 16.0,),),
                              SizedBox(width: 30.0,),
                              Icon(Icons.location_on, color: Colors.white, size: 19.0,),
                              SizedBox(width: 5.0,),
                              Text("Lahore, Pakistan", style: TextStyle(color: Colors.white, fontSize: 16.0,),),
                            ],),
                            SizedBox(height: 10.0,),
                          ],
                        ),
                          
                    
                    
                    
                    
                        ),
                    
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "About Event",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Join us for an unforgettable experience at the Carnival Festival 2026! Enjoy thrilling rides, live entertainment, delicious food, and vibrant parades.",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(padding:EdgeInsets.only(left: 20.0,right: 30.0),
              child: Row(children: [
                 Text(
                  "Number of Tickets",
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 40.0,),
                Container(
                  width: 50.0,
                  decoration: BoxDecoration(border: Border.all(color:const Color.fromARGB(255, 23, 20, 97)), borderRadius: BorderRadius.circular(10.0),),
                  child: Column(children: [
                    Text("+",style: TextStyle(fontSize: 25.0,color: Colors.black)
                    )
                    ,Text("3",style: TextStyle(fontSize: 25.0,color:const Color.fromARGB(255, 23, 20, 97),fontWeight: FontWeight.bold)
                      )
                      ,Text("-",style: TextStyle(fontSize: 25.0,color: Colors.black)
                    ),
                  ],),
                )
              ],),
              ),
              SizedBox(height: 20.0,),
              Padding(padding:  EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Text(
                  "Amount : Rs 2500",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: const Color.fromARGB(255, 23, 20, 97),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(width: 20.0,),
                Container(
                  width: 130.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 23, 20, 97),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      "Book Now",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            
                )
                ],
              ),
              ),
              SizedBox(height: 40.0,),
            ],
          ),
        ),], 
      ),
    );
  }
}
