import '../home/cubit/student_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database.dart';

class Read {
  static Future<StudentState> execute() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final User? _student = FirebaseAuth.instance.currentUser;

    final CollectionReference _mainCollection =
        _firestore.collection(rootCollection);

    final userID = _student!.email.toString();
    var rootDocumentReferencer = _mainCollection.doc(userID);

    return rootDocumentReferencer
        .get()
        .then((doc) => StudentState.fromSnapshot(doc));
  }
}
