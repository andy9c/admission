// ignore_for_file: must_be_immutable

import 'package:admission/home/cubit/student_cubit.dart';
import 'package:admission/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';


class CandidateFirstName extends StatelessWidget {
  const CandidateFirstName({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.candidateFirstName != current.candidateFirstName,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.candidateFirstName.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_candidateFirstName_textField'),
              onChanged: (candidateFirstName) => context
                  .read<StudentCubit>()
                  .candidateFirstNameChanged(candidateFirstName),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Candidate's First Name",
                helperText: '',
                errorText:
                    state.candidateFirstName.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CandidateMiddleName extends StatelessWidget {
  const CandidateMiddleName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.candidateMiddleName != current.candidateMiddleName,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.candidateMiddleName,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_candidateMiddleName_textField'),
              onChanged: (candidateMiddleName) => context
                  .read<StudentCubit>()
                  .candidateMiddleNameChanged(candidateMiddleName),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person),
                ),
                border: OutlineInputBorder(),
                labelText: "Candidate's Middle Name",
                helperText: '',
              ),
            ),
          ),
        );
      },
    );
  }
}

class CandidateLastName extends StatelessWidget {
  const CandidateLastName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.candidateLastName != current.candidateLastName,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.candidateLastName,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_candidateLastName_textField'),
              onChanged: (candidateLastName) => context
                  .read<StudentCubit>()
                  .candidateLastNameChanged(candidateLastName),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person),
                ),
                border: OutlineInputBorder(),
                labelText: "Candidate's Last Name",
                helperText: '',
              ),
            ),
          ),
        );
      },
    );
  }
}

class DateOfBirth extends StatelessWidget {
  DateOfBirth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.dateOfBirth != current.dateOfBirth,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled,
              controller: TextEditingController(text: state.dateOfBirth.value),
              maxLines: 1,
              showCursor: false,
              readOnly: true,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_dateOfBirth_textField'),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.calendar_today_rounded,
                      color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Candidate's Date of Birth",
                helperText: '',
                //errorText: state.dateOfBirth.invalid ? 'required field' : null,
              ),
              onTap: () async {
                final datePick = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2022),
                );
                if (datePick != null) {
                  var birthDate = datePick;

                  // put it here
                  String birthDateInString =
                      "${birthDate.day}/${birthDate.month}/${birthDate.year}"; // 14/08/2019

                  //_dateOfBirthController.text = birthDateInString;

                  context
                      .read<StudentCubit>()
                      .dateOfBirthChanged(birthDateInString);
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class PlaceOfBirth extends StatelessWidget {
  const PlaceOfBirth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.placeOfBirth != current.placeOfBirth,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.placeOfBirth.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_placeOfBirth_textField'),
              onChanged: (placeOfBirth) => context
                  .read<StudentCubit>()
                  .placeOfBirthChanged(placeOfBirth),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.place_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Candidate's Place of Birth",
                helperText: '',
                errorText: state.placeOfBirth.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class GenderSelection extends StatelessWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.gender.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.wc_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Gender",
                helperText: '',
                errorText: state.gender.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? gender) {
                      context.read<StudentCubit>().genderChanged(gender!);
                    }
                  : null,
              items: genderList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select Gender",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherTongueSelection extends StatelessWidget {
  const MotherTongueSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherTongue != current.motherTongue,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.motherTongue.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.connect_without_contact_rounded,
                      color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Mother Tongue",
                helperText: '',
                errorText: state.motherTongue.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? motherTongue) => context
                      .read<StudentCubit>()
                      .motherTongueChanged(motherTongue!)
                  : null,
              items: motherTongueList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select Mother Tongue",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BloodGroupSelection extends StatelessWidget {
  const BloodGroupSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.bloodGroup != current.bloodGroup,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.bloodGroup.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.bloodtype_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Blood Group",
                helperText: '',
                errorText: state.bloodGroup.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? bloodGroup) => context
                      .read<StudentCubit>()
                      .bloodGroupChanged(bloodGroup!)
                  : null,
              items:
                  bloodGroupList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select Blood Group",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ReligionSelection extends StatelessWidget {
  const ReligionSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) => previous.religion != current.religion,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.religion.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.self_improvement_rounded,
                      color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Religion",
                helperText: '',
                errorText: state.religion.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? religion) =>
                      context.read<StudentCubit>().religionChanged(religion!)
                  : null,
              items: religionList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select Religion",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SocialCategorySelection extends StatelessWidget {
  const SocialCategorySelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.socialCategory != current.socialCategory,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.socialCategory.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.group_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Social Category",
                helperText: '',
                errorText:
                    state.socialCategory.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? socialCategory) => context
                      .read<StudentCubit>()
                      .socialCategoryChanged(socialCategory!)
                  : null,
              items: socialCategoryList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Please select Social Category",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AadharCard extends StatelessWidget {
  const AadharCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.aadharNumber != current.aadharNumber,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.aadharNumber,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_aadharCard_textField'),
              onChanged: (aadharCard) =>
                  context.read<StudentCubit>().aadharCardChanged(aadharCard),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.card_membership_rounded),
                ),
                border: OutlineInputBorder(),
                labelText: "Candidate's Aadhar Card Number",
              ),
            ),
          ),
        );
      },
    );
  }
}

class LastSchoolAttended extends StatelessWidget {
  const LastSchoolAttended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.lastSchoolAttended != current.lastSchoolAttended,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.lastSchoolAttended.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_lastSchoolAttended_textField'),
              onChanged: (lastSchoolAttended) => context
                  .read<StudentCubit>()
                  .lastSchoolAttendedChanged(lastSchoolAttended),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child:
                      Icon(Icons.meeting_room_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Last School Attended",
                helperText: '',
                errorText:
                    state.lastSchoolAttended.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class LastClassAttended extends StatelessWidget {
  const LastClassAttended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.lastClassAttended != current.lastClassAttended,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.lastClassAttended.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_lastClassAttended_textField'),
              onChanged: (lastClassAttended) => context
                  .read<StudentCubit>()
                  .lastClassAttendedChanged(lastClassAttended),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child:
                      Icon(Icons.meeting_room_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Last Class Attended",
                helperText: '',
                errorText:
                    state.lastClassAttended.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class AdmissionSoughtSelection extends StatelessWidget {
  const AdmissionSoughtSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.admissionSoughtForClass != current.admissionSoughtForClass,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.admissionSoughtForClass.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.school_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Admission Sought For",
                helperText: '',
                errorText: state.admissionSoughtForClass.invalid
                    ? 'required field'
                    : null,
              ),
              onChanged: state.setEnabled
                  ? (String? admissionSought) => context
                      .read<StudentCubit>()
                      .admissionSoughtForClassChanged(admissionSought!)
                  : null,
              items: classList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Admission sought for class",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}
