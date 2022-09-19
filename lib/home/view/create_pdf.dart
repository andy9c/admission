// ignore_for_file: public_member_api_docs, depend_on_referenced_packages, prefer_const_declarations

import 'package:admission/configuration/configuration.dart';
import 'package:admission/home/cubit/student_cubit.dart';
import 'package:admission/home/widgets/build_pdf.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class CreatePDF extends StatelessWidget {
  const CreatePDF({Key? key, required this.state}) : super(key: key);
  final StudentState state;

  @override
  Widget build(BuildContext context) {
    bool isExistingStudent = state.loadStatus == LoadStatus.ExistingStudent;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              "ADMISSION FORM $academicYear (${state.admissionSoughtForClass.value})"),
        ),
        body: PdfPreview(
          initialPageFormat: PdfPageFormat.a4.portrait,
          canDebug: false,
          allowPrinting: isExistingStudent,
          allowSharing: isExistingStudent,
          build: (format) => generatePdf(PdfPageFormat.a4.portrait, state),
        ),
      ),
    );
  }
}
