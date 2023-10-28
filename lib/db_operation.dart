import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;


class FirebaseOperations {
  static addTransction(String title,String body,String date) {
    final blg = <String, String>{
      "title":title,
      "body":body,
      "date":date
    };
    db.collection("blogs").add(blg);
  }

  static Stream<QuerySnapshot> fetchTransactions() // static method that we can use it without creating object it's the class method not object method so without creating objcet we can use it
  {
    CollectionReference blg = db.collection("blogs");
    return blg.snapshots();
  }
  static deleteTranscation(String id) {
    DocumentReference docRef = db.collection("transactions").doc(id);
    docRef.delete();
  }
}
