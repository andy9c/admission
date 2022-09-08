// ignore_for_file: must_be_immutable

import 'package:admission/home/cubit/student_cubit.dart';
import 'package:admission/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class RelationshipStudentName extends StatelessWidget {
  const RelationshipStudentName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) => (previous.relationshipStudentName !=
              current.relationshipStudentName ||
          previous.relationshipWithStudent != current.relationshipWithStudent),
      builder: (context, state) {
        bool shouldEnable = state.relationshipWithStudent == "BROTHER" ||
            state.relationshipWithStudent == "SISTER";

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: Visibility(
              visible: shouldEnable,
              child: TextFormField(
                inputFormatters: [
                  UpperCaseTextFormatter(),
                ],
                enabled: state.setEnabled && shouldEnable,
                initialValue:
                    shouldEnable ? state.relationshipStudentName : null,
                controller:
                    shouldEnable ? null : TextEditingController(text: ""),
                maxLines: 1,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                key: const Key('studentForm_relationshipStudentName_textField'),
                onChanged: (relationshipStudentName) => context
                    .read<StudentCubit>()
                    .relationshipStudentNameChanged(relationshipStudentName),
                obscureText: false,
                decoration: const InputDecoration(
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.only(top: 0), // add padding to adjust icon
                    child: Icon(Icons.person),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Student's Name",
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RelationshipStudentRegNo extends StatelessWidget {
  const RelationshipStudentRegNo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) => (previous.relationshipStudentRegNo !=
              current.relationshipStudentRegNo ||
          previous.relationshipWithStudent != current.relationshipWithStudent),
      builder: (context, state) {
        bool shouldEnable = state.relationshipWithStudent == "BROTHER" ||
            state.relationshipWithStudent == "SISTER";

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: Visibility(
              visible: shouldEnable,
              child: TextFormField(
                inputFormatters: [
                  UpperCaseAndDigitsTextFormatter(),
                ],
                enabled: state.setEnabled && shouldEnable,
                initialValue:
                    shouldEnable ? state.relationshipStudentRegNo : null,
                controller:
                    shouldEnable ? null : TextEditingController(text: ""),
                maxLines: 1,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                key:
                    const Key('studentForm_relationshipStudentRegNo_textField'),
                onChanged: (relationshipStudentRegNo) => context
                    .read<StudentCubit>()
                    .relationshipStudentRegNoChanged(relationshipStudentRegNo),
                obscureText: false,
                decoration: const InputDecoration(
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.only(top: 0), // add padding to adjust icon
                    child: Icon(Icons.receipt),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Student's Registration No.",
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RelationshipStudentClassSection extends StatelessWidget {
  const RelationshipStudentClassSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) => (previous
                  .relationshipStudentClassSection !=
              current.relationshipStudentClassSection ||
          previous.relationshipWithStudent != current.relationshipWithStudent),
      builder: (context, state) {
        bool shouldEnable = state.relationshipWithStudent == "BROTHER" ||
            state.relationshipWithStudent == "SISTER";

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: Visibility(
              visible: shouldEnable,
              child: TextFormField(
                inputFormatters: [
                  UpperCaseAndDigitsTextFormatter(),
                ],
                enabled: state.setEnabled && shouldEnable,
                initialValue:
                    shouldEnable ? state.relationshipStudentClassSection : null,
                controller:
                    shouldEnable ? null : TextEditingController(text: ""),
                maxLines: 1,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                key: const Key(
                    'studentForm_relationshipStudentClassSection_textField'),
                onChanged: (relationshipStudentClassSection) => context
                    .read<StudentCubit>()
                    .relationshipStudentClassSectionChanged(
                        relationshipStudentClassSection),
                obscureText: false,
                decoration: const InputDecoration(
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.only(top: 0), // add padding to adjust icon
                    child: Icon(Icons.class_),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Student's Class/Section",
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RelationshipWithStudentSelection extends StatelessWidget {
  const RelationshipWithStudentSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.relationshipWithStudent != current.relationshipWithStudent,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: state.relationshipWithStudent == ""
                  ? null
                  : state.relationshipWithStudent,
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.family_restroom_rounded),
                ),
                border: OutlineInputBorder(),
                labelText: "Relationship to Student",
                helperText: '',
              ),
              onChanged: state.setEnabled
                  ? (String? relationshipWithStudent) {
                      if (relationshipWithStudent == "NONE") {
                        context
                            .read<StudentCubit>()
                            .relationshipStudentNameChanged("");
                        context
                            .read<StudentCubit>()
                            .relationshipStudentRegNoChanged("");
                        context
                            .read<StudentCubit>()
                            .relationshipStudentClassSectionChanged("");
                        context
                            .read<StudentCubit>()
                            .relationshipStudentYearOfJoiningChanged("");
                        context
                            .read<StudentCubit>()
                            .relationshipStudentYearOfLeavingChanged("");
                      }

                      context
                          .read<StudentCubit>()
                          .relationshipWithStudentChanged(
                              relationshipWithStudent!);
                    }
                  : null,
              items: relationshipList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: const Text(
                "Relationship with Student",
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

class RelationshipStudentYearOfJoining extends StatelessWidget {
  const RelationshipStudentYearOfJoining({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) => (previous
                  .relationshipStudentYearOfJoining !=
              current.relationshipStudentYearOfJoining ||
          previous.relationshipWithStudent != current.relationshipWithStudent),
      builder: (context, state) {
        bool shouldEnable = state.relationshipWithStudent == "BROTHER" ||
            state.relationshipWithStudent == "SISTER";

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: Visibility(
              visible: shouldEnable,
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                enabled: state.setEnabled && shouldEnable,
                initialValue: shouldEnable
                    ? state.relationshipStudentYearOfJoining
                    : null,
                controller:
                    shouldEnable ? null : TextEditingController(text: ""),
                maxLines: 1,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                key: const Key(
                    'studentForm_relationshipStudentYearOfJoining_textField'),
                onChanged: (relationshipStudentYearOfJoining) => context
                    .read<StudentCubit>()
                    .relationshipStudentYearOfJoiningChanged(
                        relationshipStudentYearOfJoining),
                obscureText: false,
                decoration: const InputDecoration(
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.only(top: 0), // add padding to adjust icon
                    child: Icon(Icons.date_range_rounded),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Year of Joining",
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RelationshipStudentYearOfLeaving extends StatelessWidget {
  const RelationshipStudentYearOfLeaving({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) => (previous
                  .relationshipStudentYearOfLeaving !=
              current.relationshipStudentYearOfLeaving ||
          previous.relationshipWithStudent != current.relationshipWithStudent),
      builder: (context, state) {
        bool shouldEnable = state.relationshipWithStudent == "BROTHER" ||
            state.relationshipWithStudent == "SISTER";

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: Visibility(
              visible: shouldEnable,
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                enabled: state.setEnabled && shouldEnable,
                initialValue: shouldEnable
                    ? state.relationshipStudentYearOfLeaving
                    : null,
                controller:
                    shouldEnable ? null : TextEditingController(text: ""),
                maxLines: 1,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                key: const Key(
                    'studentForm_relationshipStudentYearOfLeaving_textField'),
                onChanged: (relationshipStudentYearOfLeaving) => context
                    .read<StudentCubit>()
                    .relationshipStudentYearOfLeavingChanged(
                        relationshipStudentYearOfLeaving),
                obscureText: false,
                decoration: const InputDecoration(
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.only(top: 0), // add padding to adjust icon
                    child: Icon(Icons.date_range_rounded),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Year of Leaving (if any)",
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
