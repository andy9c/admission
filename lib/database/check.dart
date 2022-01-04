import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database.dart';

class Check {
  static Future<bool> userExists() async {
    // print("****** " + FirebaseFirestore.instance.toString() + " ******");
    // print("****** " +
    //     FirebaseAuth.instance.currentUser!.email.toString() +
    //     " ******");
    return await FirebaseFirestore.instance
        .collection(rootCollection)
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .get()
        .then((doc) => doc.exists);
  }
}
