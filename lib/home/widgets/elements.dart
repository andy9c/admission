// ignore_for_file: camel_case_types, avoid_types_as_parameter_names

import '../cubit/student_cubit.dart';
import '../home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sizer/sizer.dart';

class NameUpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String textValue = newValue.text
        .toUpperCase()
        .replaceAll(RegExp(r'[ ]{2,}'), ' ')
        .replaceAll(RegExp(r'[^A-Z ]'), '');

    TextSelection caratPointer =
        TextSelection.collapsed(offset: textValue.length);

    return TextEditingValue(
      text: textValue,
      selection: caratPointer,
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String textValue = newValue.text
        .toUpperCase()
        .replaceAll(RegExp(r'[ ]{2,}'), ' ')
        .replaceAll(RegExp(r'[^A-Z \,\-\:\/\.\(\)\&]'), '');

    TextSelection caratPointer =
        TextSelection.collapsed(offset: textValue.length);

    return TextEditingValue(
      text: textValue,
      selection: caratPointer,
    );
  }
}

class Expired {
  static bool hasExpired() {
    var thisInstant = DateTime.now().toLocal();

    var expiryTime = DateTime.utc(
      expYear,
      expMonth,
      expDay - 1,
      18,
      30,
    );

    return (thisInstant.compareTo(expiryTime.toLocal()) >= 0) ? true : false;
  }
}

class IAgreeCheckBox extends StatelessWidget {
  const IAgreeCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentState>(
      listener: (state, context) {},
      buildWhen: (previous, current) =>
          previous.iAgreeCheckBox != current.iAgreeCheckBox,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 70.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 10,
                    ), //SizedBox
                    const Text(
                      'I AGREE',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ), //Text
                    const SizedBox(width: 10), //SizedBox
                    /** Checkbox Widget **/
                    Checkbox(
                      key: const Key('studentForm_iAgree_checkBox'),
                      value: state.iAgreeCheckBox.value,
                      onChanged: state.setEnabled
                          ? (iAgreeCheckBox) => context
                              .read<StudentCubit>()
                              .iAgreeCheckBoxChanged(iAgreeCheckBox!)
                          : null,
                    ), //Checkbox
                  ], //<Widget>[]
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class sameAsPresentCheckBox extends StatelessWidget {
  const sameAsPresentCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentState>(
      listener: (state, context) {},
      buildWhen: (previous, current) =>
          previous.sameAsPresentCheckBox != current.sameAsPresentCheckBox,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 70.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      width: 10,
                    ), //SizedBox
                    const Text(
                      'Same as Present Address',
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ), //Text
                    const SizedBox(width: 5), //SizedBox
                    /** Checkbox Widget **/
                    Checkbox(
                      key: const Key('studentForm_sameAsPresent_checkBox'),
                      value: state.sameAsPresentCheckBox.value,
                      onChanged: state.setEnabled
                          ? (sameAsPresentCheckBox) {
                              context
                                  .read<StudentCubit>()
                                  .sameAsPresentCheckBoxChanged(
                                      sameAsPresentCheckBox!);
                            }
                          : null,
                    ), //Checkbox
                  ], //<Widget>[]
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class LoadingState extends StatelessWidget {
  const LoadingState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 70.w,
        child: const SizedBox(
          width: 54,
          height: 54,
          child: Center(
            key: Key('studentForm_loading_circularProgress'),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class SubmitAndLockButton extends StatelessWidget {
  const SubmitAndLockButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentState>(
      listener: (context, state) {
        switch (state.status) {
          case FormzStatus.submissionFailure:
            {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                      content: Text('Submission Failed ! Please Try Again.'),
                      duration: Duration(seconds: 7)),
                );
            }
            break;
          case FormzStatus.submissionSuccess:
            {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text("Your Submission is Successful !"),
                    duration: Duration(seconds: 7),
                  ),
                );
              //context.read<AppBloc>().add(AppLogoutRequested());
            }
            break;
          default:
            {}
            break;
        }
      },
      buildWhen: (previous, current) =>
          (previous.status != current.status) ||
          (previous.invalidFields != current.invalidFields),
      builder: (context, state) {
        String invalidFields = state.invalidFields.toString();

        return state.status.isSubmissionInProgress
            ? const SizedBox(
                width: 54,
                height: 54,
                child: Center(
                  key: Key('saveForm_loading_circularProgress'),
                  child: CircularProgressIndicator(),
                ),
              )
            : Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 70.w,
                  child: Column(
                    children: <Widget>[
                      state.setEnabled
                          ? state.status.isValidated
                              ? Container()
                              : Text(
                                  "Please check the following required fields (with blue highlighted icons) before submitting\n\n$invalidFields",
                                  textAlign: TextAlign.center,
                                  textWidthBasis: TextWidthBasis.parent,
                                  overflow: TextOverflow.visible,
                                  style: const TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900),
                                )
                          : Container(),
                      spacerWidget(),
                      (state.setEnabled == false ||
                              state.status == FormzStatus.submissionSuccess)
                          ? ElevatedButton(
                              key: const Key(
                                  'studentForm_printForm_elevatedButton'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreatePDF(state)),
                                );
                              },
                              child: const Text('Print Admission Form'),
                            )
                          : ElevatedButton(
                              key: const Key(
                                  'studentForm_submitAndLock_elevatedButton'),
                              onPressed: state.status.isValidated
                                  ? () => context
                                      .read<StudentCubit>()
                                      .submitAndLockPressed()
                                  : null,
                              child: const Text('Submit & Lock'),
                            ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

Widget spacerWidget() {
  return const SizedBox(height: 16);
}

Widget dividerWidget() {
  return Align(
    alignment: Alignment.center,
    child: SizedBox(
      width: 70.w,
      child: const Align(
        alignment: Alignment.center,
        child: Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 20,
        ),
      ),
    ),
  );
}
