import '../home/cubit/student_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_date/dart_date.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database.dart';

class Create {
  static Future<void> execute(StudentState state) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final User? _student = FirebaseAuth.instance.currentUser;

    final CollectionReference _mainCollection =
        _firestore.collection(rootCollection);

    final timeStamp = DateTime.now().format('MMMM dd y, h:mm:ss a');

    var rootDocumentReferencer =
        _mainCollection.doc(_student!.email.toString());

    Map<String, dynamic> data = <String, dynamic>{
      "sameAsPresentCheckBox": state.sameAsPresentCheckBox.value,
      "iAgreeCheckBox": state.iAgreeCheckBox.value,
      "candidateFirstName": state.candidateFirstName.value,
      "candidateMiddleName": state.candidateMiddleName,
      "candidateLastName": state.candidateLastName,
      "dateOfBirth": state.dateOfBirth.value,
      "placeOfBirth": state.placeOfBirth.value,
      "gender": state.gender.value,
      "motherTongue": state.motherTongue.value,
      "bloodGroup": state.bloodGroup.value,
      "religion": state.religion.value,
      "socialCategory": state.socialCategory.value,
      "aadharNumber": state.aadharNumber,
      "lastSchoolAttended": state.lastSchoolAttended.value,
      "lastClassAttended": state.lastClassAttended.value,
      "admissionSoughtForClass": state.admissionSoughtForClass.value,
      "fatherFirstName": state.fatherFirstName.value,
      "fatherMiddleName": state.fatherMiddleName,
      "fatherLastName": state.fatherLastName,
      "fatherProfession": state.fatherProfession.value,
      "fatherQualification": state.fatherQualification.value,
      "fatherAdditionalQualification": state.fatherAdditionalQualification,
      "fatherHomeContact": state.fatherHomeContact.value,
      "fatherOfficeContact": state.fatherOfficeContact,
      "fatherEmail": state.fatherEmail.value,
      "motherFirstName": state.motherFirstName.value,
      "motherMiddleName": state.motherMiddleName,
      "motherLastName": state.motherLastName,
      "motherProfession": state.motherProfession.value,
      "motherQualification": state.motherQualification.value,
      "motherAdditionalQualification": state.motherAdditionalQualification,
      "motherHomeContact": state.motherHomeContact.value,
      "motherOfficeContact": state.motherOfficeContact,
      "motherEmail": state.motherEmail.value,
      "relationshipStudentName": state.relationshipStudentName,
      "relationshipStudentRegNo": state.relationshipStudentRegNo,
      "relationshipStudentClassSection": state.relationshipStudentClassSection,
      "relationshipWithStudent": state.relationshipWithStudent,
      "relationshipStudentYearOfJoining":
          state.relationshipStudentYearOfJoining,
      "relationshipStudentYearOfLeaving":
          state.relationshipStudentYearOfLeaving,
      "presentLocation": state.presentLocation.value,
      "presentCity": state.presentCity,
      "presentPostOffice": state.presentPostOffice,
      "presentDistrict": state.presentDistrict,
      "presentState": state.presentState.value,
      "presentPinCode": state.presentPinCode.value,
      "permanentLocation": state.permanentLocation.value,
      "permanentCity": state.permanentCity,
      "permanentPostOffice": state.permanentPostOffice,
      "permanentDistrict": state.permanentDistrict,
      "permanentState": state.permanentState.value,
      "permanentPinCode": state.permanentPinCode.value,
      "timeStamp": timeStamp,
    };

    await rootDocumentReferencer
        .set(data)
        .then(
            (_) async => await Email.execute(state).catchError((e) => print(e)))
        .catchError((e) => print(e));
  }
}
