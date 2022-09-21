// ignore_for_file: avoid_print

import 'package:admission/configuration/configuration.dart';

import '../home/cubit/student_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_date/dart_date.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database.dart';

class Create {
  static Future<void> execute(StudentState state) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User? student = FirebaseAuth.instance.currentUser;

    final CollectionReference mainCollection =
        firestore.collection(rootCollection);

    final timeStamp = DateTime.now().format('MMMM dd y, h:mm:ss a');

    var rootDocumentReferencer = mainCollection.doc(student!.email.toString());

    Map<String, dynamic> data = <String, dynamic>{
      "sameAsPresentCheckBox": state.sameAsPresentCheckBox.value,
      "iAgreeCheckBox": state.iAgreeCheckBox.value,
      "candidateFirstName": state.candidateFirstName.value!.trim(),
      "candidateMiddleName": state.candidateMiddleName.trim(),
      "candidateLastName": state.candidateLastName.trim(),
      "dateOfBirth": state.dateOfBirth.value!.trim(),
      "placeOfBirth": state.placeOfBirth.value!.trim(),
      "gender": state.gender.value!.trim(),
      "motherTongue": state.motherTongue.value!.trim(),
      "bloodGroup": state.bloodGroup.value!.trim(),
      "religion": state.religion.value!.trim(),
      "socialCategory": state.socialCategory.value!.trim(),
      "aadharNumber": state.aadharNumber.value != null
          ? state.aadharNumber.value!.trim()
          : '',
      "hasAadharCard": state.hasAadharCard.trim(),
      "aadharEnrollmentID": state.aadharEnrollmentID.value != null
          ? state.aadharEnrollmentID.value!.trim()
          : '',
      "lastSchoolAttended": state.lastSchoolAttended.value!.trim(),
      "lastClassAttended": state.lastClassAttended.value!.trim(),
      "admissionSoughtForClass": state.admissionSoughtForClass.value!.trim(),
      "fatherFirstName": state.fatherFirstName.value!.trim(),
      "fatherMiddleName": state.fatherMiddleName.trim(),
      "fatherLastName": state.fatherLastName.trim(),
      "fatherProfession": state.fatherProfession.value!.trim(),
      "fatherQualification": state.fatherQualification.value!.trim(),
      "fatherAdditionalQualification":
          state.fatherAdditionalQualification.trim(),
      "fatherHomeContact": state.fatherHomeContact.value!.trim(),
      "fatherOfficeContact": state.fatherOfficeContact.trim(),
      "fatherEmail": state.fatherEmail.value.trim(),
      "motherFirstName": state.motherFirstName.value!.trim(),
      "motherMiddleName": state.motherMiddleName.trim(),
      "motherLastName": state.motherLastName.trim(),
      "motherProfession": state.motherProfession.value!.trim(),
      "motherQualification": state.motherQualification.value!.trim(),
      "motherAdditionalQualification":
          state.motherAdditionalQualification.trim(),
      "motherHomeContact": state.motherHomeContact.value!.trim(),
      "motherOfficeContact": state.motherOfficeContact.trim(),
      "motherEmail": state.motherEmail.value.trim(),
      "relationshipStudentName": state.relationshipStudentName.trim(),
      "relationshipStudentRegNo": state.relationshipStudentRegNo.trim(),
      "relationshipStudentClassSection":
          state.relationshipStudentClassSection.trim(),
      "relationshipWithStudent": state.relationshipWithStudent.trim(),
      "relationshipStudentYearOfJoining":
          state.relationshipStudentYearOfJoining.trim(),
      "relationshipStudentYearOfLeaving":
          state.relationshipStudentYearOfLeaving.trim(),
      "presentLocation": state.presentLocation.value!.trim(),
      "presentCity": state.presentCity.trim(),
      "presentPostOffice": state.presentPostOffice.trim(),
      "presentDistrict": state.presentDistrict.trim(),
      "presentState": state.presentState.value!.trim(),
      "presentPinCode": state.presentPinCode.value!.trim(),
      "permanentLocation": state.permanentLocation.value!.trim(),
      "permanentCity": state.permanentCity.trim(),
      "permanentPostOffice": state.permanentPostOffice.trim(),
      "permanentDistrict": state.permanentDistrict.trim(),
      "permanentState": state.permanentState.value!.trim(),
      "permanentPinCode": state.permanentPinCode.value!.trim(),
      "timeStamp": timeStamp.trim(),
    };

    await rootDocumentReferencer
        .set(data)
        .then(
            (_) async => await Email.execute(state).catchError((e) => print(e)))
        .catchError((e) => print(e));
  }
}
