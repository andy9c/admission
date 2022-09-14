// ignore_for_file: file_names

import 'package:admission/configuration/configuration.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

class ReadPDF {
  static Future<Uint8List> application() async {
    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();

    // Create a reference to "uid.pdf"
    final pdfRef = storageRef.child(FirebaseAuth.instance.currentUser!.email ==
            null
        ? "$rootStorageCollection/null.pdf"
        : "$rootStorageCollection/${FirebaseAuth.instance.currentUser!.email}.pdf");

    Uint8List data = await pdfRef.getData() ?? Uint8List.fromList([1]);

    return data;
  }

  static Future<Uint8List> instruction() async {
    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();

    // Create a reference to "uid.pdf"
    final pdfRef = storageRef.child(
        FirebaseAuth.instance.currentUser!.email == null
            ? "$rootStorageCollection/null.pdf"
            : "$rootStorageCollection/instructions.pdf");

    Uint8List data = await pdfRef.getData() ?? Uint8List.fromList([1]);

    return data;
  }
}
