import 'package:admission/configuration/configuration.dart';

import '../home/cubit/student_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Read {
  static Future<StudentState> execute() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User? student = FirebaseAuth.instance.currentUser;

    final CollectionReference mainCollection =
        firestore.collection(rootCollection);

    final userID = student!.email.toString();
    var rootDocumentReferencer = mainCollection.doc(userID);

    return rootDocumentReferencer
        .get()
        .then((doc) => StudentState.fromSnapshot(doc));
  }
}
