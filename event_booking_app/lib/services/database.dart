import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userinfomap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userinfomap);
  }
  Future addeventdetails(Map<String, dynamic> eventinfo, String id) async {
  return await FirebaseFirestore.instance
      .collection("Event")
      .doc(id)
      .set(eventinfo);
}

Future addUserBooking(Map<String,dynamic> bookinfo,String id) async{
return await FirebaseFirestore.instance
.collection("users")
.doc(id).collection("booking")
.add(bookinfo);
}
Future addadminticket(Map<String,dynamic> bookinfo) async{
return await FirebaseFirestore.instance
.collection("Tickets")
.add(bookinfo);
}
Future<Stream<QuerySnapshot>> getbookings(String id) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("booking")
        .snapshots();
  }
   Future<Stream<QuerySnapshot>> getEventCategories(String category) async {
    return FirebaseFirestore.instance
        .collection("Event")
        .where("Category", isEqualTo: category)
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getTickets(String category) async {
    return FirebaseFirestore.instance
        .collection("Tickets")
        .snapshots();
  }

}


