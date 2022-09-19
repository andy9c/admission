// ignore_for_file: depend_on_referenced_packages

import 'package:admission/configuration/configuration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sizer/sizer.dart';

import '../cubit/student_cubit.dart';

pw.Widget buildCustomHeadline(StudentState state) => pw.Header(
      level: 0,
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Text(
            'ADMISSION FORM $academicYear (${state.admissionSoughtForClass.value})',
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
          ),
        ],
      ),
      padding: const pw.EdgeInsets.all(4),
      decoration: pw.BoxDecoration(
        color: PdfColor.fromHex("A02B29"),
      ),
    );

Future<Uint8List> generatePdf(PdfPageFormat format, StudentState state) async {
  bool isExistingStudent = state.loadStatus == LoadStatus.ExistingStudent;

  final pdf = pw.Document(
    version: PdfVersion.pdf_1_5,
    compress: true,
  );
  const double space = 10.0;

  final ByteData bytes = await rootBundle.load('assets/title.png');
  final Uint8List byteList = bytes.buffer.asUint8List();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: format,
      build: (context) => [
        pw.Row(
          children: [
            pw.Flexible(
              flex: 4,
              child: isExistingStudent
                  ? pw.Image(
                      pw.MemoryImage(
                        byteList,
                      ),
                      fit: pw.BoxFit.scaleDown,
                    )
                  : pw.Text(
                      "REVIEW APPLICATION FORM $academicYear (${state.admissionSoughtForClass.value})",
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontStyle: pw.FontStyle.italic,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
            ),
            pw.Flexible(
              flex: 1,
              child: pw.Padding(
                padding: const pw.EdgeInsets.all(8),
                child: pw.SizedBox(
                  width: 80.w,
                  height: 12.h,
                  child: pw.Stack(
                    children: [
                      pw.Rectangle(
                        fillColor: PdfColor.fromHex("#FFFFFF"),
                        strokeColor: PdfColor.fromHex("#000000"),
                        strokeWidth: 1.0,
                      ),
                      pw.RichText(
                        textAlign: pw.TextAlign.center,
                        softWrap: true,
                        text: pw.TextSpan(
                          style: const pw.TextStyle(
                            fontSize: 10,
                          ),
                          children: [
                            pw.TextSpan(
                              text:
                                  "\n\n\nCandidate's Passport Size Photograph (3.5cm X 4.5cm)",
                              style: pw.TextStyle(
                                fontStyle: pw.FontStyle.italic,
                                fontWeight: pw.FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        pw.SizedBox(height: space),
        buildCustomHeadline(state),
        pw.Header(
          child: pw.RichText(
            textAlign: pw.TextAlign.left,
            softWrap: true,
            text: pw.TextSpan(
              style: const pw.TextStyle(
                fontSize: 12,
              ),
              children: [
                const pw.TextSpan(
                  text: "Candidate's Information ",
                ),
                pw.TextSpan(
                  text:
                      "(Registration ID - ${FirebaseAuth.instance.currentUser!.email})",
                  style: pw.TextStyle(
                    fontStyle: pw.FontStyle.italic,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "First Name\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.candidateFirstName.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Middle Name\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.candidateMiddleName,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Last Name\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.candidateLastName,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Date of Birth\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.dateOfBirth.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Place of Birth\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.placeOfBirth.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Gender\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.gender.value.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Mother Tongue\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.motherTongue.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Blood Group\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.bloodGroup.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Religion\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.religion.value.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Social Category\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.socialCategory.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Aadhar Number\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.aadharNumber.value,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Aadhar Enrollment ID\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.aadharEnrollmentID.value,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Last School Attended\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.lastSchoolAttended.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Last Class Attended\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.lastClassAttended.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Admission Sought For\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.admissionSoughtForClass.value.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Header(
          child: pw.Text("Father's Information"),
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "First Name\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.fatherFirstName.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Middle Name\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.fatherMiddleName,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Last Name\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.fatherLastName,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Profession\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.fatherProfession.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Qualification\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.fatherQualification.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Additional Qualifications\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.fatherAdditionalQualification,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Home/Personal Contact\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.fatherHomeContact.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Work/Office Contact\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.fatherOfficeContact,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Personal/Work Email\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.fatherEmail.value.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Header(
          child: pw.Text("Mother's Information"),
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "First Name\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.motherFirstName.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Middle Name\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.motherMiddleName,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Last Name\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.motherLastName,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Profession\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.motherProfession.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Qualification\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.motherQualification.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Additional Qualifications\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.motherAdditionalQualification,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Home/Personal Contact\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.motherHomeContact.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Work/Office Contact\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.motherOfficeContact,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Personal/Work Email\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.motherEmail.value.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Header(
          child: pw.Text("Relationship to Present Student in School (IF ANY)"),
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Name\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.relationshipStudentName,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Registration No.\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.relationshipStudentRegNo,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Class/Section\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.relationshipStudentClassSection,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Relationship\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.relationshipWithStudent,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Year of Joining\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.relationshipStudentYearOfJoining,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Year of Leaving (if any)\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.relationshipStudentYearOfLeaving,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Header(
          child: pw.Text("Present Address (For Correspondence)"),
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Present Location\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.presentLocation.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Present Town/City\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.presentCity,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Present Post Office\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.presentPostOffice,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Present District\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.presentDistrict,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Present State\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.presentState.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Present PIN Code\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.presentPinCode.value.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Header(
          child: pw.Text("Permanent Address (Domicile)"),
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Permanent Location\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.permanentLocation.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Permanent Town/City\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.permanentCity,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Permanent Post Office\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.permanentPostOffice,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Table(
          border: pw.TableBorder.all(),
          defaultColumnWidth: const pw.FractionColumnWidth(0.33),
          children: [
            pw.TableRow(
              children: [
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Permanent District\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.permanentDistrict,
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Permanent State\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.permanentState.value.toString(),
                      ),
                    ],
                  ),
                ),
                pw.RichText(
                  textAlign: pw.TextAlign.center,
                  softWrap: true,
                  text: pw.TextSpan(
                    style: const pw.TextStyle(fontSize: 12),
                    children: [
                      pw.TextSpan(
                        text: "Permanent PIN Code\n",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.TextSpan(
                        text: state.permanentPinCode.value.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: space),
        pw.Header(
          child: pw.Text("Self Declaration"),
        ),
        pw.Paragraph(
          style: pw.TextStyle(
            fontSize: 12,
            fontStyle: pw.FontStyle.italic,
          ),
          text:
              "1) I understand and agree that the registration of my ward does not guarantee admission to the school.\n\n2) I hereby declare that the information given above is true to the best of my knowledge. I promise to abide by the admission procedure of the school. I understand that my application will be rejected on any false information.\n\n3) I understand and agree that this admission form is permanently locked and no further changes can be made at any point of time, in the admission process.",
        ),
      ],
    ),
  );

  return pdf.save();
}
