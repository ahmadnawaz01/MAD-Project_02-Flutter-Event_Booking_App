import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app/services/database.dart';
import 'package:flutter/material.dart';

class TicketEvent extends StatefulWidget {
  const TicketEvent({super.key});

  @override
  State<TicketEvent> createState() => _TicketEventState();
}

class _TicketEventState extends State<TicketEvent> {
  Stream<QuerySnapshot>? ticketsStream;

  @override
  void initState() {
    super.initState();
    _loadTickets();
  }

  Future<void> _loadTickets() async {
    ticketsStream = await DatabaseMethods().getTickets("All");
    setState(() {});
  }

  Widget allTickets() {
    if (ticketsStream == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return StreamBuilder<QuerySnapshot>(
      stream: ticketsStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error loading tickets"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No tickets found"));
        }

        final docs = snapshot.data!.docs;

        return ListView.builder(
          key: const PageStorageKey("tickets_list"),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final ds = docs[index];

            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 23, 20, 97),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),

                
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 23, 20, 97),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 20.0),
                            Text(
                              ds["Location"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.white70),
                      ],
                    ),
                  ),

                  
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10.0,
                      bottom: 10.0,
                      right: 10.0,
                    ),
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      bottom: 10.0,
                      top: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            ds["Image"],
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ds["Event"],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  ds["Date"],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.blue,
                                  size: 25.0,
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  ds["Name"],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.group,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  ds["Number"],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                const Icon(
                                  Icons.monetization_on,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  ds["Total"],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
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
        padding:
            const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0,bottom: 5.0),
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
            Container(
                  padding: EdgeInsets.only(top: 10.0),
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
                        "Events Tickets",
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 30, 27, 130),
                        ),
                      ),
                    ],
                  ),
                ),
            const SizedBox(height: 10.0),
            allTickets(),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}