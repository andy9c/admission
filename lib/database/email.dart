// ignore_for_file: avoid_print
// trigger email config : secret : smtps://notification@stpaulsrourkela.org:3T6hb5L4hRWFf5z@smtp.gmail.com:465

import 'package:admission/home/home.dart';

import '../home/cubit/student_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final User? _student = FirebaseAuth.instance.currentUser;
final String userID = _student!.email.toString();

final CollectionReference _emailCollection =
    _firestore.collection(emailCollection);

class Email {
  static Future<void> execute(StudentState state) async {
    var rootDocumentReferencer = _emailCollection.doc(userID);

    List<String> fatherEmail =
        state.fatherEmail.value.split(",").map((e) => e.trim()).toList();
    List<String> motherEmail =
        state.motherEmail.value.split(",").map((e) => e.trim()).toList();

    String pdfLink = await Upload.execute(state);

    Map<String, dynamic> data = <String, dynamic>{
      "userID": userID,
      "academicYear": academic_year,
      "pdfLink": pdfLink,
      // "candidateFirstName": state.candidateFirstName.value,
      // "candidateMiddleName": state.candidateMiddleName,
      // "candidateLastName": state.candidateLastName,
      // "dateOfBirth": state.dateOfBirth.value,
      // "placeOfBirth": state.placeOfBirth.value,
      // "gender": state.gender.value,
      // "motherTongue": state.motherTongue.value,
      // "bloodGroup": state.bloodGroup.value,
      // "religion": state.religion.value,
      // "socialCategory": state.socialCategory.value,
      // "aadharNumber": state.aadharNumber.value,
      // "lastSchoolAttended": state.lastSchoolAttended.value,
      // "lastClassAttended": state.lastClassAttended.value,
      "admissionSoughtForClass": state.admissionSoughtForClass.value,
      // "fatherFirstName": state.fatherFirstName.value,
      // "fatherMiddleName": state.fatherMiddleName,
      // "fatherLastName": state.fatherLastName,
      // "fatherProfession": state.fatherProfession.value,
      // "fatherQualification": state.fatherQualification.value,
      // "fatherAdditionalQualification": state.fatherAdditionalQualification,
      // "fatherHomeContact": state.fatherHomeContact.value,
      // "fatherOfficeContact": state.fatherOfficeContact,
      // "fatherEmail": state.fatherEmail.value,
      // "motherFirstName": state.motherFirstName.value,
      // "motherMiddleName": state.motherMiddleName,
      // "motherLastName": state.motherLastName,
      // "motherProfession": state.motherProfession.value,
      // "motherQualification": state.motherQualification.value,
      // "motherAdditionalQualification": state.motherAdditionalQualification,
      // "motherHomeContact": state.motherHomeContact.value,
      // "motherOfficeContact": state.motherOfficeContact,
      // "motherEmail": state.motherEmail.value,
      // "relationshipStudentName": state.relationshipStudentName,
      // "relationshipStudentRegNo": state.relationshipStudentRegNo,
      // "relationshipStudentClassSection": state.relationshipStudentClassSection,
      // "relationshipWithStudent": state.relationshipWithStudent,
      // "relationshipStudentYearOfJoining":
      //     state.relationshipStudentYearOfJoining,
      // "relationshipStudentYearOfLeaving":
      //     state.relationshipStudentYearOfLeaving,
      // "presentLocation": state.presentLocation.value,
      // "presentCity": state.presentCity,
      // "presentPostOffice": state.presentPostOffice,
      // "presentDistrict": state.presentDistrict,
      // "presentState": state.presentState.value,
      // "presentPinCode": state.presentPinCode.value,
      // "permanentLocation": state.permanentLocation.value,
      // "permanentCity": state.permanentCity,
      // "permanentPostOffice": state.permanentPostOffice,
      // "permanentDistrict": state.permanentDistrict,
      // "permanentState": state.permanentState.value,
      // "permanentPinCode": state.permanentPinCode.value,
    };

    Map<String, dynamic> template = <String, dynamic>{
      "name": emailTemplate,
      "data": data,
    };

    Map<String, dynamic> sendMail = <String, dynamic>{
      "to": fatherEmail + motherEmail,
      "cc": schoolEmail,
      "template": template,
    };

    await rootDocumentReferencer.set(sendMail).catchError((e) => print(e));
  }
}
