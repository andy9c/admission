part of 'student_cubit.dart';

enum LoadStatus {
  Loading,
  NewStudent,
  ExistingStudent,
}

@immutable
class StudentState extends Equatable {
  const StudentState({
    this.loadStatus = LoadStatus.NewStudent,
    this.setEnabled = true,
    this.status = FormzStatus.pure,
    this.invalidFields = fieldDescription,
    this.sameAsPresentCheckBox = const CheckBox.pure(),
    this.iAgreeCheckBox = const CheckBox.pure(),
    this.candidateFirstName = const Compulsory.pure(),
    this.candidateMiddleName = "",
    this.candidateLastName = "",
    this.dateOfBirth = const Compulsory.pure(),
    this.placeOfBirth = const Compulsory.pure(),
    this.gender = const Compulsory.pure(),
    this.motherTongue = const Compulsory.pure(),
    this.bloodGroup = const Compulsory.pure(),
    this.religion = const Compulsory.pure(),
    this.socialCategory = const Compulsory.pure(),
    this.aadharNumber = "",
    this.lastSchoolAttended = const Compulsory.pure(),
    this.lastClassAttended = const Compulsory.pure(),
    this.admissionSoughtForClass = const Compulsory.pure(),
    this.fatherFirstName = const Compulsory.pure(),
    this.fatherMiddleName = "",
    this.fatherLastName = "",
    this.fatherProfession = const Compulsory.pure(),
    this.fatherQualification = const Compulsory.pure(),
    this.fatherAdditionalQualification = "",
    this.fatherHomeContact = const Compulsory.pure(),
    this.fatherOfficeContact = "",
    this.fatherEmail = const Compulsory.pure(),
    this.motherFirstName = const Compulsory.pure(),
    this.motherMiddleName = "",
    this.motherLastName = "",
    this.motherProfession = const Compulsory.pure(),
    this.motherQualification = const Compulsory.pure(),
    this.motherAdditionalQualification = "",
    this.motherHomeContact = const Compulsory.pure(),
    this.motherOfficeContact = "",
    this.motherEmail = const Compulsory.pure(),
    this.relationshipStudentName = "",
    this.relationshipStudentRegNo = "",
    this.relationshipStudentClassSection = "",
    this.relationshipWithStudent = "NONE",
    this.relationshipStudentYearOfJoining = "",
    this.relationshipStudentYearOfLeaving = "",
    this.presentLocation = const Compulsory.pure(),
    this.presentCity = "",
    this.presentPostOffice = "",
    this.presentDistrict = "",
    this.presentState = const Compulsory.pure(),
    this.presentPinCode = const Compulsory.pure(),
    this.permanentLocation = const Compulsory.pure(),
    this.permanentCity = "",
    this.permanentPostOffice = "",
    this.permanentDistrict = "",
    this.permanentState = const Compulsory.pure(),
    this.permanentPinCode = const Compulsory.pure(),
  });

  final LoadStatus loadStatus;
  final bool setEnabled;
  final FormzStatus status;
  final List<String> invalidFields;

  final CheckBox sameAsPresentCheckBox;
  final CheckBox iAgreeCheckBox;

  final Compulsory candidateFirstName;
  final String candidateMiddleName;
  final String candidateLastName;

  final Compulsory dateOfBirth;
  final Compulsory placeOfBirth;
  final Compulsory gender;
  final Compulsory motherTongue;

  final Compulsory bloodGroup;
  final Compulsory religion;
  final Compulsory socialCategory;

  final String aadharNumber;
  final Compulsory lastSchoolAttended;
  final Compulsory lastClassAttended;
  final Compulsory admissionSoughtForClass;

  final Compulsory fatherFirstName;
  final String fatherMiddleName;
  final String fatherLastName;

  final Compulsory fatherProfession;
  final Compulsory fatherQualification;
  final String fatherAdditionalQualification;

  final Compulsory fatherHomeContact;
  final String fatherOfficeContact;
  final Compulsory fatherEmail;

  final Compulsory motherFirstName;
  final String motherMiddleName;
  final String motherLastName;

  final Compulsory motherProfession;
  final Compulsory motherQualification;
  final String motherAdditionalQualification;

  final Compulsory motherHomeContact;
  final String motherOfficeContact;
  final Compulsory motherEmail;

  final String relationshipStudentName;
  final String relationshipStudentRegNo;
  final String relationshipStudentClassSection;
  final String relationshipWithStudent;
  final String relationshipStudentYearOfJoining;
  final String relationshipStudentYearOfLeaving;

  final Compulsory presentLocation;
  final String presentCity;
  final String presentPostOffice;
  final String presentDistrict;
  final Compulsory presentState;
  final Compulsory presentPinCode;

  final Compulsory permanentLocation;
  final String permanentCity;
  final String permanentPostOffice;
  final String permanentDistrict;
  final Compulsory permanentState;
  final Compulsory permanentPinCode;

  @override
  List<Object> get props {
    return [
      loadStatus,
      setEnabled,
      status,
      invalidFields,
      sameAsPresentCheckBox,
      iAgreeCheckBox,
      candidateFirstName,
      candidateMiddleName,
      candidateLastName,
      dateOfBirth,
      placeOfBirth,
      gender,
      motherTongue,
      bloodGroup,
      religion,
      socialCategory,
      aadharNumber,
      lastSchoolAttended,
      lastClassAttended,
      admissionSoughtForClass,
      fatherFirstName,
      fatherMiddleName,
      fatherLastName,
      fatherProfession,
      fatherQualification,
      fatherAdditionalQualification,
      fatherHomeContact,
      fatherOfficeContact,
      fatherEmail,
      motherFirstName,
      motherMiddleName,
      motherLastName,
      motherProfession,
      motherQualification,
      motherAdditionalQualification,
      motherHomeContact,
      motherOfficeContact,
      motherEmail,
      relationshipStudentName,
      relationshipStudentRegNo,
      relationshipStudentClassSection,
      relationshipWithStudent,
      relationshipStudentYearOfJoining,
      relationshipStudentYearOfLeaving,
      presentLocation,
      presentCity,
      presentPostOffice,
      presentDistrict,
      presentState,
      presentPinCode,
      permanentLocation,
      permanentCity,
      permanentPostOffice,
      permanentDistrict,
      permanentState,
      permanentPinCode,
    ];
  }

  StudentState copyWith({
    LoadStatus? loadStatus,
    bool? setEnabled,
    FormzStatus? status,
    List<String>? invalidFields,
    CheckBox? sameAsPresentCheckBox,
    CheckBox? iAgreeCheckBox,
    Compulsory? candidateFirstName,
    String? candidateMiddleName,
    String? candidateLastName,
    Compulsory? dateOfBirth,
    Compulsory? placeOfBirth,
    Compulsory? gender,
    Compulsory? motherTongue,
    Compulsory? bloodGroup,
    Compulsory? religion,
    Compulsory? socialCategory,
    String? aadharNumber,
    Compulsory? lastSchoolAttended,
    Compulsory? lastClassAttended,
    Compulsory? admissionSoughtForClass,
    Compulsory? fatherFirstName,
    String? fatherMiddleName,
    String? fatherLastName,
    Compulsory? fatherProfession,
    Compulsory? fatherQualification,
    String? fatherAdditionalQualification,
    Compulsory? fatherHomeContact,
    String? fatherOfficeContact,
    Compulsory? fatherEmail,
    Compulsory? motherFirstName,
    String? motherMiddleName,
    String? motherLastName,
    Compulsory? motherProfession,
    Compulsory? motherQualification,
    String? motherAdditionalQualification,
    Compulsory? motherHomeContact,
    String? motherOfficeContact,
    Compulsory? motherEmail,
    String? relationshipStudentName,
    String? relationshipStudentRegNo,
    String? relationshipStudentClassSection,
    String? relationshipWithStudent,
    String? relationshipStudentYearOfJoining,
    String? relationshipStudentYearOfLeaving,
    Compulsory? presentLocation,
    String? presentCity,
    String? presentPostOffice,
    String? presentDistrict,
    Compulsory? presentState,
    Compulsory? presentPinCode,
    Compulsory? permanentLocation,
    String? permanentCity,
    String? permanentPostOffice,
    String? permanentDistrict,
    Compulsory? permanentState,
    Compulsory? permanentPinCode,
  }) {
    return StudentState(
      loadStatus: loadStatus ?? this.loadStatus,
      setEnabled: setEnabled ?? this.setEnabled,
      status: status ?? this.status,
      invalidFields: invalidFields ?? this.invalidFields,
      sameAsPresentCheckBox:
          sameAsPresentCheckBox ?? this.sameAsPresentCheckBox,
      iAgreeCheckBox: iAgreeCheckBox ?? this.iAgreeCheckBox,
      candidateFirstName: candidateFirstName ?? this.candidateFirstName,
      candidateMiddleName: candidateMiddleName ?? this.candidateMiddleName,
      candidateLastName: candidateLastName ?? this.candidateLastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      gender: gender ?? this.gender,
      motherTongue: motherTongue ?? this.motherTongue,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      religion: religion ?? this.religion,
      socialCategory: socialCategory ?? this.socialCategory,
      aadharNumber: aadharNumber ?? this.aadharNumber,
      lastSchoolAttended: lastSchoolAttended ?? this.lastSchoolAttended,
      lastClassAttended: lastClassAttended ?? this.lastClassAttended,
      admissionSoughtForClass:
          admissionSoughtForClass ?? this.admissionSoughtForClass,
      fatherFirstName: fatherFirstName ?? this.fatherFirstName,
      fatherMiddleName: fatherMiddleName ?? this.fatherMiddleName,
      fatherLastName: fatherLastName ?? this.fatherLastName,
      fatherProfession: fatherProfession ?? this.fatherProfession,
      fatherQualification: fatherQualification ?? this.fatherQualification,
      fatherAdditionalQualification:
          fatherAdditionalQualification ?? this.fatherAdditionalQualification,
      fatherHomeContact: fatherHomeContact ?? this.fatherHomeContact,
      fatherOfficeContact: fatherOfficeContact ?? this.fatherOfficeContact,
      fatherEmail: fatherEmail ?? this.fatherEmail,
      motherFirstName: motherFirstName ?? this.motherFirstName,
      motherMiddleName: motherMiddleName ?? this.motherMiddleName,
      motherLastName: motherLastName ?? this.motherLastName,
      motherProfession: motherProfession ?? this.motherProfession,
      motherQualification: motherQualification ?? this.motherQualification,
      motherAdditionalQualification:
          motherAdditionalQualification ?? this.motherAdditionalQualification,
      motherHomeContact: motherHomeContact ?? this.motherHomeContact,
      motherOfficeContact: motherOfficeContact ?? this.motherOfficeContact,
      motherEmail: motherEmail ?? this.motherEmail,
      relationshipStudentName:
          relationshipStudentName ?? this.relationshipStudentName,
      relationshipStudentRegNo:
          relationshipStudentRegNo ?? this.relationshipStudentRegNo,
      relationshipStudentClassSection: relationshipStudentClassSection ??
          this.relationshipStudentClassSection,
      relationshipWithStudent:
          relationshipWithStudent ?? this.relationshipWithStudent,
      relationshipStudentYearOfJoining: relationshipStudentYearOfJoining ??
          this.relationshipStudentYearOfJoining,
      relationshipStudentYearOfLeaving: relationshipStudentYearOfLeaving ??
          this.relationshipStudentYearOfLeaving,
      presentLocation: presentLocation ?? this.presentLocation,
      presentCity: presentCity ?? this.presentCity,
      presentPostOffice: presentPostOffice ?? this.presentPostOffice,
      presentDistrict: presentDistrict ?? this.presentDistrict,
      presentState: presentState ?? this.presentState,
      presentPinCode: presentPinCode ?? this.presentPinCode,
      permanentLocation: permanentLocation ?? this.permanentLocation,
      permanentCity: permanentCity ?? this.permanentCity,
      permanentPostOffice: permanentPostOffice ?? this.permanentPostOffice,
      permanentDistrict: permanentDistrict ?? this.permanentDistrict,
      permanentState: permanentState ?? this.permanentState,
      permanentPinCode: permanentPinCode ?? this.permanentPinCode,
    );
  }

  static StudentState fromSnapshot(DocumentSnapshot snap) {
    return StudentState(
      sameAsPresentCheckBox: CheckBox.dirty(snap['sameAsPresentCheckBox']),
      iAgreeCheckBox: CheckBox.dirty(snap['iAgreeCheckBox']),
      candidateFirstName: Compulsory.dirty(snap['candidateFirstName']),
      candidateMiddleName: snap['candidateMiddleName'],
      candidateLastName: snap['candidateLastName'],
      dateOfBirth: Compulsory.dirty(snap['dateOfBirth']),
      placeOfBirth: Compulsory.dirty(snap['placeOfBirth']),
      gender: Compulsory.dirty(snap['gender']),
      motherTongue: Compulsory.dirty(snap['motherTongue']),
      bloodGroup: Compulsory.dirty(snap['bloodGroup']),
      religion: Compulsory.dirty(snap['religion']),
      socialCategory: Compulsory.dirty(snap['socialCategory']),
      aadharNumber: snap['aadharNumber'],
      lastSchoolAttended: Compulsory.dirty(snap['lastSchoolAttended']),
      lastClassAttended: Compulsory.dirty(snap['lastClassAttended']),
      admissionSoughtForClass:
          Compulsory.dirty(snap['admissionSoughtForClass']),
      fatherFirstName: Compulsory.dirty(snap['fatherFirstName']),
      fatherMiddleName: snap['fatherMiddleName'],
      fatherLastName: snap['fatherLastName'],
      fatherProfession: Compulsory.dirty(snap['fatherProfession']),
      fatherQualification: Compulsory.dirty(snap['fatherQualification']),
      fatherAdditionalQualification: snap['fatherAdditionalQualification'],
      fatherHomeContact: Compulsory.dirty(snap['fatherHomeContact']),
      fatherOfficeContact: snap['fatherOfficeContact'],
      fatherEmail: Compulsory.dirty(snap['fatherEmail']),
      motherFirstName: Compulsory.dirty(snap['motherFirstName']),
      motherMiddleName: snap['motherMiddleName'],
      motherLastName: snap['motherLastName'],
      motherProfession: Compulsory.dirty(snap['motherProfession']),
      motherQualification: Compulsory.dirty(snap['motherQualification']),
      motherAdditionalQualification: snap['motherAdditionalQualification'],
      motherHomeContact: Compulsory.dirty(snap['motherHomeContact']),
      motherOfficeContact: snap['motherOfficeContact'],
      motherEmail: Compulsory.dirty(snap['motherEmail']),
      relationshipStudentName: snap['relationshipStudentName'],
      relationshipStudentRegNo: snap['relationshipStudentRegNo'],
      relationshipStudentClassSection: snap['relationshipStudentClassSection'],
      relationshipWithStudent: snap['relationshipWithStudent'],
      relationshipStudentYearOfJoining:
          snap['relationshipStudentYearOfJoining'],
      relationshipStudentYearOfLeaving:
          snap['relationshipStudentYearOfLeaving'],
      presentLocation: Compulsory.dirty(snap['presentLocation']),
      presentCity: snap['presentCity'],
      presentPostOffice: snap['presentPostOffice'],
      presentDistrict: snap['presentDistrict'],
      presentState: Compulsory.dirty(snap['presentState']),
      presentPinCode: Compulsory.dirty(snap['presentPinCode']),
      permanentLocation: Compulsory.dirty(snap['permanentLocation']),
      permanentCity: snap['permanentCity'],
      permanentPostOffice: snap['permanentPostOffice'],
      permanentDistrict: snap['permanentDistrict'],
      permanentState: Compulsory.dirty(snap['permanentState']),
      permanentPinCode: Compulsory.dirty(snap['permanentPinCode']),
    );
  }
}
