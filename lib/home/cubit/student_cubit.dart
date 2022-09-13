import 'package:admission/configuration/configuration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database/database.dart';
import '../home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(const StudentState());

  Future<void> loadData() async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));

    await FirebaseFirestore.instance
        .collection(rootCollection)
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .get()
        .then(
      (doc) async {
        if (doc.exists == true) {
          StudentState student = await Read.execute();
          emit(
            state.copyWith(
              loadStatus: LoadStatus.ExistingStudent,
              setEnabled: false,
              sameAsPresentCheckBox: student.sameAsPresentCheckBox,
              iAgreeCheckBox: student.iAgreeCheckBox,
              candidateFirstName: student.candidateFirstName,
              candidateMiddleName: student.candidateMiddleName,
              candidateLastName: student.candidateLastName,
              dateOfBirth: student.dateOfBirth,
              placeOfBirth: student.placeOfBirth,
              gender: student.gender,
              motherTongue: student.motherTongue,
              bloodGroup: student.bloodGroup,
              religion: student.religion,
              socialCategory: student.socialCategory,
              aadharNumber: student.aadharNumber,
              lastSchoolAttended: student.lastSchoolAttended,
              lastClassAttended: student.lastClassAttended,
              admissionSoughtForClass: student.admissionSoughtForClass,
              fatherFirstName: student.fatherFirstName,
              fatherMiddleName: student.fatherMiddleName,
              fatherLastName: student.fatherLastName,
              fatherProfession: student.fatherProfession,
              fatherQualification: student.fatherQualification,
              fatherAdditionalQualification:
                  student.fatherAdditionalQualification,
              fatherHomeContact: student.fatherHomeContact,
              fatherOfficeContact: student.fatherOfficeContact,
              fatherEmail: student.fatherEmail,
              motherFirstName: student.motherFirstName,
              motherMiddleName: student.motherMiddleName,
              motherLastName: student.motherLastName,
              motherProfession: student.motherProfession,
              motherQualification: student.motherQualification,
              motherAdditionalQualification:
                  student.motherAdditionalQualification,
              motherHomeContact: student.motherHomeContact,
              motherOfficeContact: student.motherOfficeContact,
              motherEmail: student.motherEmail,
              relationshipStudentName: student.relationshipStudentName,
              relationshipStudentRegNo: student.relationshipStudentRegNo,
              relationshipStudentClassSection:
                  student.relationshipStudentClassSection,
              relationshipWithStudent: student.relationshipWithStudent,
              relationshipStudentYearOfJoining:
                  student.relationshipStudentYearOfJoining,
              relationshipStudentYearOfLeaving:
                  student.relationshipStudentYearOfLeaving,
              presentLocation: student.presentLocation,
              presentCity: student.presentCity,
              presentPostOffice: student.presentPostOffice,
              presentDistrict: student.presentDistrict,
              presentState: student.presentState,
              presentPinCode: student.presentPinCode,
              permanentLocation: student.permanentLocation,
              permanentCity: student.permanentCity,
              permanentPostOffice: student.permanentPostOffice,
              permanentDistrict: student.permanentDistrict,
              permanentState: student.permanentState,
              permanentPinCode: student.permanentPinCode,
            ),
          );
        } else {
          emit(
            state.copyWith(
              loadStatus: LoadStatus.NewStudent,
              setEnabled: true,
            ),
          );
        }
      },
    );
  }

  Future<void> submitAndLockPressed() async {
    if (!state.status.isValidated) return;
    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
        loadStatus: LoadStatus.Loading,
      ),
    );

    try {
      await Create.execute(state);
      emit(
        state.copyWith(
            loadStatus: LoadStatus.ExistingStudent,
            setEnabled: false,
            status: FormzStatus.submissionSuccess),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void checkInvalidFields() {
    List<bool> fieldValidity = [
      state.candidateFirstName.valid,
      state.dateOfBirth.valid,
      state.placeOfBirth.valid,
      state.gender.valid,
      state.motherTongue.valid,
      state.bloodGroup.valid,
      state.religion.valid,
      state.socialCategory.valid,
      state.aadharNumber.valid,
      state.lastSchoolAttended.valid,
      state.lastClassAttended.valid,
      state.admissionSoughtForClass.valid,
      state.fatherFirstName.valid,
      state.fatherProfession.valid,
      state.fatherQualification.valid,
      state.fatherHomeContact.valid,
      state.fatherEmail.valid,
      state.motherFirstName.valid,
      state.motherProfession.valid,
      state.motherQualification.valid,
      state.motherHomeContact.valid,
      state.motherEmail.valid,
      state.presentLocation.valid,
      state.presentState.valid,
      state.presentPinCode.valid,
      state.permanentLocation.valid,
      state.permanentState.valid,
      state.permanentPinCode.valid,
      state.iAgreeCheckBox.valid,
    ];

    List<String> fieldDescription = [
      "Candidate's First Name",
      "Date of Birth",
      "Place of Birth",
      "Gender",
      "Mother Tongue",
      "Blood Group",
      "Religion",
      "Social Category",
      "Aadhar Card Number",
      "Last School Attended",
      "Last Class Attended",
      "Admission Sought for Class",
      "Father's First Name",
      "Father's Profession",
      "Father's Qualification",
      "Father's Home/Personal Contact",
      "Father's Email ID",
      "Mother's First Name",
      "Mother's Profession",
      "Mother's Qualification",
      "Mother's Home/Personal Contact",
      "Mother's Email ID",
      "Present Location",
      "Present State",
      "Present PIN Code",
      "Permanent Location",
      "Permanent State",
      "Permanent PIN Code",
      "I AGREE Checkbox",
    ];

    Map<int, bool> fieldValidityMap = fieldValidity.asMap();
    List<String> invalidFields = [];

    fieldValidityMap.forEach((key, value) {
      if (value == false) invalidFields.add(fieldDescription[key]);
    });

    emit(state.copyWith(
      invalidFields: invalidFields,
    ));
  }

  void sameAsPresentCheckBoxChanged(bool value) {
    final sameAsPresentCheckBox = CheckBox.dirty(value);
    emit(state.copyWith(
      sameAsPresentCheckBox: sameAsPresentCheckBox,
    ));
  }

  void iAgreeCheckBoxChanged(bool value) {
    final iAgreeCheckBox = CheckBox.dirty(value);
    emit(state.copyWith(
      loadStatus: LoadStatus.NewStudent,
      iAgreeCheckBox: iAgreeCheckBox,
    ));

    checkInvalidFields();
  }

  void candidateFirstNameChanged(String value) {
    final candidateFirstName = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      candidateFirstName: candidateFirstName,
    ));

    checkInvalidFields();
  }

  void candidateMiddleNameChanged(String value) {
    emit(state.copyWith(
      candidateMiddleName: value.toUpperCase(),
    ));
  }

  void candidateLastNameChanged(String value) {
    emit(state.copyWith(
      candidateLastName: value.toUpperCase(),
    ));
  }

  void dateOfBirthChanged(String value) {
    final dateOfBirth = Compulsory.dirty(value);
    emit(state.copyWith(
      dateOfBirth: dateOfBirth,
    ));

    checkInvalidFields();
  }

  void placeOfBirthChanged(String value) {
    final placeOfBirth = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      placeOfBirth: placeOfBirth,
    ));

    checkInvalidFields();
  }

  void genderChanged(String value) {
    final gender = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      gender: gender,
    ));

    checkInvalidFields();
  }

  void motherTongueChanged(String value) {
    final motherTongue = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      motherTongue: motherTongue,
    ));

    checkInvalidFields();
  }

  void bloodGroupChanged(String value) {
    final bloodGroup = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      bloodGroup: bloodGroup,
    ));

    checkInvalidFields();
  }

  void religionChanged(String value) {
    final religion = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      religion: religion,
    ));

    checkInvalidFields();
  }

  void socialCategoryChanged(String value) {
    final socialCategory = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      socialCategory: socialCategory,
    ));

    checkInvalidFields();
  }

  void aadharCardChanged(String value) {
    final aadharNumber = Aadhar.dirty(value.toUpperCase());
    emit(state.copyWith(
      aadharNumber: aadharNumber,
    ));

    checkInvalidFields();
  }

  void lastSchoolAttendedChanged(String value) {
    final lastSchoolAttended = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      lastSchoolAttended: lastSchoolAttended,
    ));

    checkInvalidFields();
  }

  void lastClassAttendedChanged(String value) {
    final lastClassAttended = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      lastClassAttended: lastClassAttended,
    ));

    checkInvalidFields();
  }

  void admissionSoughtForClassChanged(String value) {
    final admissionSoughtForClass = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      admissionSoughtForClass: admissionSoughtForClass,
    ));

    checkInvalidFields();
  }

  void fatherFirstNameChanged(String value) {
    final fatherFirstName = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      fatherFirstName: fatherFirstName,
    ));
  }

  void fatherMiddleNameChanged(String value) {
    emit(state.copyWith(
      fatherMiddleName: value.toUpperCase(),
    ));
  }

  void fatherLastNameChanged(String value) {
    emit(state.copyWith(
      fatherLastName: value.toUpperCase(),
    ));
  }

  void fatherProfessionChanged(String value) {
    final fatherProfession = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      fatherProfession: fatherProfession,
    ));

    checkInvalidFields();
  }

  void fatherQualificationChanged(String value) {
    final fatherQualification = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      fatherQualification: fatherQualification,
    ));

    checkInvalidFields();
  }

  void fatherAdditionalQualificationChanged(String value) {
    emit(state.copyWith(
      fatherAdditionalQualification: value.toUpperCase(),
    ));
  }

  void fatherHomeContactChanged(String value) {
    final fatherHomeContact = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      fatherHomeContact: fatherHomeContact,
    ));

    checkInvalidFields();
  }

  void fatherOfficeContactChanged(String value) {
    emit(state.copyWith(
      fatherOfficeContact: value.toUpperCase(),
    ));
  }

  void fatherEmailChanged(String value) {
    final fatherEmail = EmailMultiple.dirty(value.toUpperCase());
    emit(state.copyWith(
      fatherEmail: fatherEmail,
    ));

    checkInvalidFields();
  }

  void motherFirstNameChanged(String value) {
    final motherFirstName = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      motherFirstName: motherFirstName,
    ));
  }

  void motherMiddleNameChanged(String value) {
    emit(state.copyWith(
      motherMiddleName: value.toUpperCase(),
    ));
  }

  void motherLastNameChanged(String value) {
    emit(state.copyWith(
      motherLastName: value.toUpperCase(),
    ));
  }

  void motherProfessionChanged(String value) {
    final motherProfession = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      motherProfession: motherProfession,
    ));

    checkInvalidFields();
  }

  void motherQualificationChanged(String value) {
    final motherQualification = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      motherQualification: motherQualification,
    ));

    checkInvalidFields();
  }

  void motherAdditionalQualificationChanged(String value) {
    emit(state.copyWith(
      motherAdditionalQualification: value.toUpperCase(),
    ));
  }

  void motherHomeContactChanged(String value) {
    final motherHomeContact = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      motherHomeContact: motherHomeContact,
    ));

    checkInvalidFields();
  }

  void motherOfficeContactChanged(String value) {
    emit(state.copyWith(
      motherOfficeContact: value.toUpperCase(),
    ));
  }

  void motherEmailChanged(String value) {
    final motherEmail = EmailMultiple.dirty(value.toUpperCase());
    emit(state.copyWith(
      motherEmail: motherEmail,
    ));

    checkInvalidFields();
  }

  void relationshipStudentNameChanged(String value) {
    emit(state.copyWith(
      relationshipStudentName: value.toUpperCase(),
    ));
  }

  void relationshipStudentRegNoChanged(String value) {
    emit(state.copyWith(
      relationshipStudentRegNo: value.toUpperCase(),
    ));
  }

  void relationshipStudentClassSectionChanged(String value) {
    emit(state.copyWith(
      relationshipStudentClassSection: value.toUpperCase(),
    ));
  }

  void relationshipWithStudentChanged(String value) {
    emit(state.copyWith(
      relationshipWithStudent: value.toUpperCase(),
    ));
  }

  void relationshipStudentYearOfJoiningChanged(String value) {
    emit(state.copyWith(
      relationshipStudentYearOfJoining: value.toUpperCase(),
    ));
  }

  void relationshipStudentYearOfLeavingChanged(String value) {
    emit(state.copyWith(
      relationshipStudentYearOfLeaving: value.toUpperCase(),
    ));
  }

  void presentLocationChanged(String value) {
    final presentLocation = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      presentLocation: presentLocation,
    ));

    checkInvalidFields();
  }

  void presentCityChanged(String value) {
    emit(state.copyWith(
      presentCity: value.toUpperCase(),
    ));
  }

  void presentPostOfficeChanged(String value) {
    emit(state.copyWith(
      presentPostOffice: value.toUpperCase(),
    ));
  }

  void presentDistrictChanged(String value) {
    emit(state.copyWith(
      presentDistrict: value.toUpperCase(),
    ));
  }

  void presentStateChanged(String value) {
    final presentState = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      presentState: presentState,
    ));

    checkInvalidFields();
  }

  void presentPinCodeChanged(String value) {
    final presentPinCode = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      presentPinCode: presentPinCode,
    ));

    checkInvalidFields();
  }

  void permanentLocationChanged(String value) {
    final permanentLocation = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      permanentLocation: permanentLocation,
    ));

    checkInvalidFields();
  }

  void permanentCityChanged(String value) {
    emit(state.copyWith(
      permanentCity: value.toUpperCase(),
    ));
  }

  void permanentPostOfficeChanged(String value) {
    emit(state.copyWith(
      permanentPostOffice: value.toUpperCase(),
    ));
  }

  void permanentDistrictChanged(String value) {
    emit(state.copyWith(
      permanentDistrict: value.toUpperCase(),
    ));
  }

  void permanentStateChanged(String value) {
    final permanentState = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      permanentState: permanentState,
    ));

    checkInvalidFields();
  }

  void permanentPinCodeChanged(String value) {
    final permanentPinCode = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      permanentPinCode: permanentPinCode,
    ));

    checkInvalidFields();
  }
}
