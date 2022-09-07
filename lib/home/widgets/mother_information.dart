// ignore_for_file: must_be_immutable

import 'package:admission/home/cubit/student_cubit.dart';
import 'package:admission/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MotherFirstName extends StatelessWidget {
  const MotherFirstName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherFirstName != current.motherFirstName,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                NameUpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.motherFirstName.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherFirstName_textField'),
              onChanged: (motherFirstName) => context
                  .read<StudentCubit>()
                  .motherFirstNameChanged(motherFirstName),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Mother's First Name",
                helperText: '',
                errorText:
                    state.motherFirstName.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherMiddleName extends StatelessWidget {
  const MotherMiddleName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherMiddleName != current.motherMiddleName,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                NameUpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.motherMiddleName,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherMiddleName_textField'),
              onChanged: (motherMiddleName) => context
                  .read<StudentCubit>()
                  .motherMiddleNameChanged(motherMiddleName),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person),
                ),
                border: OutlineInputBorder(),
                labelText: "Mother's Middle Name",
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherLastName extends StatelessWidget {
  const MotherLastName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherLastName != current.motherLastName,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                NameUpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.motherLastName,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherLastName_textField'),
              onChanged: (motherLastName) => context
                  .read<StudentCubit>()
                  .motherLastNameChanged(motherLastName),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person),
                ),
                border: OutlineInputBorder(),
                labelText: "Mother's Last Name",
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherProfessionSelection extends StatelessWidget {
  const MotherProfessionSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherProfession != current.motherProfession,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.motherProfession.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child:
                      Icon(Icons.engineering_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Mother's Profession",
                helperText: '',
                errorText:
                    state.motherProfession.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? motherProfession) => context
                      .read<StudentCubit>()
                      .motherProfessionChanged(motherProfession!)
                  : null,
              items:
                  professionList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Mother's Profession",
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

class MotherQualificationSelection extends StatelessWidget {
  const MotherQualificationSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherQualification != current.motherQualification,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.motherQualification.value,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.menu_book_rounded, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Mother's Qualification",
                helperText: '',
                errorText:
                    state.motherQualification.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? motherQualification) => context
                      .read<StudentCubit>()
                      .motherQualificationChanged(motherQualification!)
                  : null,
              items: qualificationList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Mother's Qualification",
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

class MotherAdditionalQualification extends StatelessWidget {
  const MotherAdditionalQualification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherAdditionalQualification !=
          current.motherAdditionalQualification,
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
              initialValue: state.motherAdditionalQualification,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key(
                  'studentForm_motherAdditionalQualification_textField'),
              onChanged: (motherAdditionalQualification) => context
                  .read<StudentCubit>()
                  .motherAdditionalQualificationChanged(
                      motherAdditionalQualification),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.menu_book_rounded),
                ),
                border: OutlineInputBorder(),
                labelText: "Additional Qualification",
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherHomeContact extends StatelessWidget {
  const MotherHomeContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherHomeContact != current.motherHomeContact,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\+\,]')),
              ],
              enabled: state.setEnabled,
              initialValue: state.motherHomeContact.value,
              maxLines: 3,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherHomeContact_textField'),
              onChanged: (motherHomeContact) => context
                  .read<StudentCubit>()
                  .motherHomeContactChanged(motherHomeContact),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.call, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Mother's Home/Personal Contact",
                helperText: '',
                errorText:
                    state.motherHomeContact.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherOfficeContact extends StatelessWidget {
  const MotherOfficeContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherOfficeContact != current.motherOfficeContact,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9\+\,]')),
              ],
              enabled: state.setEnabled,
              initialValue: state.motherOfficeContact,
              maxLines: 3,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherOfficeContact_textField'),
              onChanged: (motherOfficeContact) => context
                  .read<StudentCubit>()
                  .motherOfficeContactChanged(motherOfficeContact),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.call),
                ),
                border: OutlineInputBorder(),
                labelText: "Mother's Work/Office Contact",
              ),
            ),
          ),
        );
      },
    );
  }
}

class MotherEmail extends StatelessWidget {
  const MotherEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.motherEmail != current.motherEmail,
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
              initialValue: state.motherEmail.value,
              maxLines: 3,
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_motherEmail_textField'),
              onChanged: (motherEmail) =>
                  context.read<StudentCubit>().motherEmailChanged(motherEmail),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.email_rounded, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Mother's Email",
                helperText: 'Use comma to separate multiple emails',
                errorText: state.motherEmail.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
