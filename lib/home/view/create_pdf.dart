// ignore_for_file: public_member_api_docs, depend_on_referenced_packages, prefer_const_declarations

import 'package:admission/configuration/configuration.dart';
import 'package:admission/database/readPDF.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class CreatePDF extends StatelessWidget {
  const CreatePDF({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ADMISSION FORM $academicYear")),
        body: PdfPreview(
          initialPageFormat: PdfPageFormat.a4.portrait,
          canDebug: false,
          build: (format) => ReadPDF.execute(),
        ),
      ),
    );
  }
}
