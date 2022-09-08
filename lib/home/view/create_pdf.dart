// ignore_for_file: public_member_api_docs, depend_on_referenced_packages, prefer_const_declarations

import 'package:admission/home/cubit/student_cubit.dart';
import 'package:admission/home/home.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class CreatePDF extends StatelessWidget {
  const CreatePDF(this.state, {Key? key}) : super(key: key);

  final StudentState state;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
                "ADMISSION FORM $academic_year (${state.admissionSoughtForClass.value})")),
        body: PdfPreview(
          build: (format) => generatePdf(format, state),
        ),
      ),
    );
  }
}
