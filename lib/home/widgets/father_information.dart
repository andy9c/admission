// ignore_for_file: must_be_immutable

import 'package:admission/home/cubit/student_cubit.dart';
import 'package:admission/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class FatherFirstName extends StatelessWidget {
  const FatherFirstName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.fatherFirstName != current.fatherFirstName,
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
              initialValue: state.fatherFirstName.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_fatherFirstName_textField'),
              onChanged: (fatherFirstName) => context
                  .read<StudentCubit>()
                  .fatherFirstNameChanged(fatherFirstName),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person, color: Colors.lightBlue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Father's First Name",
                helperText: '',
                errorText:
                    state.fatherFirstName.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class FatherMiddleName extends StatelessWidget {
  const FatherMiddleName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.fatherMiddleName != current.fatherMiddleName,
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
              initialValue: state.fatherMiddleName,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_fatherMiddleName_textField'),
              onChanged: (fatherMiddleName) => context
                  .read<StudentCubit>()
                  .fatherMiddleNameChanged(fatherMiddleName),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person),
                ),
                border: OutlineInputBorder(),
                labelText: "Father's Middle Name",
              ),
            ),
          ),
        );
      },
    );
  }
}

class FatherLastName extends StatelessWidget {
  const FatherLastName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.fatherLastName != current.fatherLastName,
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
              initialValue: state.fatherLastName,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_fatherLastName_textField'),
              onChanged: (fatherLastName) => context
                  .read<StudentCubit>()
                  .fatherLastNameChanged(fatherLastName),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.person),
                ),
                border: OutlineInputBorder(),
                labelText: "Father's Last Name",
              ),
            ),
          ),
        );
      },
    );
  }
}

class FatherProfessionSelection extends StatelessWidget {
  const FatherProfessionSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.fatherProfession != current.fatherProfession,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.fatherProfession.value,
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
                labelText: "Father's Profession",
                helperText: '',
                errorText:
                    state.fatherProfession.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? fatherProfession) => context
                      .read<StudentCubit>()
                      .fatherProfessionChanged(fatherProfession!)
                  : null,
              items:
                  professionList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Father's Profession",
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

class FatherQualificationSelection extends StatelessWidget {
  const FatherQualificationSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.fatherQualification != current.fatherQualification,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.fatherQualification.value,
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
                labelText: "Father's Qualification",
                helperText: '',
                errorText:
                    state.fatherQualification.invalid ? 'required field' : null,
              ),
              onChanged: state.setEnabled
                  ? (String? fatherQualification) => context
                      .read<StudentCubit>()
                      .fatherQualificationChanged(fatherQualification!)
                  : null,
              items: qualificationList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Father's Qualification",
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

class FatherAdditionalQualification extends StatelessWidget {
  const FatherAdditionalQualification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.fatherAdditionalQualification !=
          current.fatherAdditionalQualification,
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
              initialValue: state.fatherAdditionalQualification,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key(
                  'studentForm_fatherAdditionalQualification_textField'),
              onChanged: (fatherAdditionalQualification) => context
                  .read<StudentCubit>()
                  .fatherAdditionalQualificationChanged(
                      fatherAdditionalQualification),
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

class FatherHomeContact extends StatelessWidget {
  const FatherHomeContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.fatherHomeContact != current.fatherHomeContact,
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
              initialValue: state.fatherHomeContact.value,
              maxLines: 3,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_fatherHomeContact_textField'),
              onChanged: (fatherHomeContact) => context
                  .read<StudentCubit>()
                  .fatherHomeContactChanged(fatherHomeContact),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.call, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Father's Home/Personal Contact",
                helperText: '',
                errorText:
                    state.fatherHomeContact.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class FatherOfficeContact extends StatelessWidget {
  const FatherOfficeContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.fatherOfficeContact != current.fatherOfficeContact,
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
              initialValue: state.fatherOfficeContact,
              maxLines: 3,
              //keyboardType: TextInputType.phone,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              //controller: contactController,
              key: const Key('studentForm_fatherOfficeContact_textField'),
              onChanged: (fatherOfficeContactName) => context
                  .read<StudentCubit>()
                  .fatherOfficeContactChanged(fatherOfficeContactName),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.call),
                ),
                border: OutlineInputBorder(),
                labelText: "Father's Work/Office Contact",
              ),
            ),
          ),
        );
      },
    );
  }
}

class FatherEmail extends StatelessWidget {
  const FatherEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.fatherEmail != current.fatherEmail,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                EmailTextFormatter(),
              ],
              enabled: state.setEnabled,
              initialValue: state.fatherEmail.value,
              maxLines: 3,
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_fatherEmail_textField'),
              onChanged: (fatherEmail) =>
                  context.read<StudentCubit>().fatherEmailChanged(fatherEmail),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.email_rounded, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Father's Email",
                helperText: 'Use comma to separate multiple emails',
                errorText: state.fatherEmail.invalid
                    ? state.fatherEmail.value.isEmpty
                        ? 'required field'
                        : 'invalid email address found'
                    : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
