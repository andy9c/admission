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
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await Create.execute(state);
      emit(state.copyWith(
          loadStatus: LoadStatus.ExistingStudent,
          setEnabled: false,
          status: FormzStatus.submissionSuccess));
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
      status: Formz.validate([
        iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void candidateFirstNameChanged(String value) {
    final candidateFirstName = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      candidateFirstName: candidateFirstName,
      status: Formz.validate([
        state.iAgreeCheckBox,
        candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
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
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void placeOfBirthChanged(String value) {
    final placeOfBirth = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      placeOfBirth: placeOfBirth,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void genderChanged(String value) {
    final gender = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      gender: gender,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void motherTongueChanged(String value) {
    final motherTongue = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      motherTongue: motherTongue,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void bloodGroupChanged(String value) {
    final bloodGroup = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      bloodGroup: bloodGroup,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void religionChanged(String value) {
    final religion = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      religion: religion,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void socialCategoryChanged(String value) {
    final socialCategory = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      socialCategory: socialCategory,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void aadharCardChanged(String value) {
    final aadharNumber = Aadhar.dirty(value.toUpperCase());
    emit(state.copyWith(
      aadharNumber: aadharNumber,
    ));
  }

  void lastSchoolAttendedChanged(String value) {
    final lastSchoolAttended = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      lastSchoolAttended: lastSchoolAttended,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void lastClassAttendedChanged(String value) {
    final lastClassAttended = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      lastClassAttended: lastClassAttended,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void admissionSoughtForClassChanged(String value) {
    final admissionSoughtForClass = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      admissionSoughtForClass: admissionSoughtForClass,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void fatherFirstNameChanged(String value) {
    final fatherFirstName = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      fatherFirstName: fatherFirstName,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
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
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void fatherQualificationChanged(String value) {
    final fatherQualification = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      fatherQualification: fatherQualification,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
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
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void fatherOfficeContactChanged(String value) {
    emit(state.copyWith(
      fatherOfficeContact: value.toUpperCase(),
    ));
  }

  void fatherEmailChanged(String value) {
    final fatherEmail = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      fatherEmail: fatherEmail,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void motherFirstNameChanged(String value) {
    final motherFirstName = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      motherFirstName: motherFirstName,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
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
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void motherQualificationChanged(String value) {
    final motherQualification = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      motherQualification: motherQualification,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
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
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void motherOfficeContactChanged(String value) {
    emit(state.copyWith(
      motherOfficeContact: value.toUpperCase(),
    ));
  }

  void motherEmailChanged(String value) {
    final motherEmail = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      motherEmail: motherEmail,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
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
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
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
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void presentPinCodeChanged(String value) {
    final presentPinCode = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      presentPinCode: presentPinCode,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        presentPinCode,
        state.permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void permanentLocationChanged(String value) {
    final permanentLocation = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      permanentLocation: permanentLocation,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        permanentLocation,
        state.permanentState,
        state.permanentPinCode,
      ]),
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
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        permanentState,
        state.permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }

  void permanentPinCodeChanged(String value) {
    final permanentPinCode = Compulsory.dirty(value.toUpperCase());
    emit(state.copyWith(
      permanentPinCode: permanentPinCode,
      status: Formz.validate([
        state.iAgreeCheckBox,
        state.candidateFirstName,
        state.dateOfBirth,
        state.placeOfBirth,
        state.gender,
        state.motherTongue,
        state.bloodGroup,
        state.religion,
        state.socialCategory,
        state.lastSchoolAttended,
        state.lastClassAttended,
        state.admissionSoughtForClass,
        state.fatherFirstName,
        state.fatherProfession,
        state.fatherQualification,
        state.fatherHomeContact,
        state.fatherEmail,
        state.motherFirstName,
        state.motherProfession,
        state.motherQualification,
        state.motherHomeContact,
        state.motherEmail,
        state.presentLocation,
        state.presentState,
        state.presentPinCode,
        state.permanentLocation,
        state.permanentState,
        permanentPinCode,
      ]),
    ));

    checkInvalidFields();
  }
}
