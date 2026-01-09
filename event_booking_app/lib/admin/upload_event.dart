import 'dart:io';

import 'package:event_booking_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class UploadEvent extends StatefulWidget {
  const UploadEvent({super.key});

  @override
  State<UploadEvent> createState() => _UploadEventState();
}

class _UploadEventState extends State<UploadEvent> {
  TextEditingController namecon = TextEditingController();
  TextEditingController pricecon = TextEditingController();
  TextEditingController detailscon = TextEditingController();
  final List<String> eventcategories = [
    "Music",
    "Food",
    "Clothing",
    "Festival",
  ];
  String? value;
  final ImagePicker picker = ImagePicker();
  File? selimage;

  Future getimage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    selimage = File(image!.path);
    setState(() {});
  }

  DateTime Selectdate = DateTime.now();
  TimeOfDay Selectedtime = TimeOfDay(hour: 10, minute: 00);

  Future<void> pickdate() async {
    final DateTime? pickdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickdate != null && pickdate != Selectdate) {
      setState(() {
        Selectdate = pickdate;
      });
    }
  }

  String formattimeofday(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    return DateFormat('hh:mm a').format(dateTime);
  }

  Future<void> picktime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != Selectedtime) {
      setState(() {
        Selectedtime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 87, 219, 255),
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
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                      Text(
                        "Upload Event",
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 30, 27, 130),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.0),
                Center(
                  child: selimage != null
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.file(
                              selimage!,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Center(
                          child: GestureDetector(
                            onTap: () {
                              getimage();
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 23, 20, 97),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 50,
                                color: Color.fromARGB(255, 23, 20, 97),
                              ),
                            ),
                          ),
                        ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Event Name",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 23, 20, 97),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    controller: namecon,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter event name",

                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Ticket Price",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 23, 20, 97),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    controller: pricecon,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Price",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Event Category",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 23, 20, 97),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Color.fromARGB(255, 23, 20, 97),
                      iconSize: 36,
                      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                      hint: Text(
                        "Select Category",
                        style: TextStyle(color: Colors.white70),
                      ),
                      value: value,
                      onChanged: (String? newValue) {
                        setState(() {
                          value = newValue!;
                        });
                      },
                      items: eventcategories.map<DropdownMenuItem<String>>((
                        String category,
                      ) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(
                            category,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Event Name",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 9),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 23, 20, 97),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pickdate();
                        },
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        DateFormat('yyyy-MM-dd').format(Selectdate),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 30.0),
                      GestureDetector(
                        onTap: () {
                          picktime();
                        },
                        child: Icon(
                          Icons.alarm,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        formattimeofday(Selectedtime),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),

                Text(
                  "Event Details",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 23, 20, 97),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    controller: detailscon,
                    maxLines: 6,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "What will be on that Event....",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      // String addId = randomAlphaNumeric(10);
                      // Reference firebase_storage=FirebaseStorage.instance.ref().child("BlogImage").child(addId);
                      // final UploadTask task=firebase_storage.putFile(selimage!);
                      // var downloadUrl=await (await task).ref.getDownloadURL();
                      String ids = randomAlphaNumeric(10);

                      Map<String, dynamic> Uploadevent = {
                        "Image": "images/party.jpg",
                        "Name": namecon.text,
                        "Price": pricecon.text,
                        "Category": value,
                        "Detail": detailscon.text,
                        "Date":DateFormat('yyyy-MM-dd').format(Selectdate),
                        "Time":formattimeofday(Selectedtime)
                      };
                      try {
                        await DatabaseMethods()
                            .addeventdetails(Uploadevent, ids)
                            .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(

                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    17,
                                    16,
                                    65,
                                  ),
                                  content: 
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    
                                    child: Text(
                                      "Event Uploaded Successfully!!!",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                             setState(() {
                          namecon.text = "";
                          pricecon.text = "";
                          detailscon.text = "";
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: const Color.fromARGB(
                              255,
                              244,
                              37,
                              37,
                            ),
                            content: Text("Upload failed: $e"),
                          ),
                        );
                       
                      }
                    },
                    child: Container(
                      width: 170.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 23, 20, 97),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          "Upload",
                          style: TextStyle(
                            fontSize: 21.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
