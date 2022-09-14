// ignore_for_file: depend_on_referenced_packages

import 'package:admission/configuration/configuration.dart';
import 'package:admission/home/widgets/widgets.dart';

import '../home/cubit/student_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';

class Upload {
  static Future<String> execute(StudentState state) async {
    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();

    // Create a reference to "uid.pdf"
    final pdfRef = storageRef.child(FirebaseAuth.instance.currentUser!.email ==
            null
        ? "$rootStorageCollection/null.pdf"
        : "$rootStorageCollection/${FirebaseAuth.instance.currentUser!.email}.pdf");

    Uint8List data = await generatePdf(PdfPageFormat.a4.portrait, state);

    await pdfRef.putData(data);
    return await pdfRef.getDownloadURL();
  }
}
