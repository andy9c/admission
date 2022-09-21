import 'package:admission/configuration/configuration.dart';
import 'package:admission/home/view/create_pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import '../cubit/student_cubit.dart';
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

    return TextEditingValue(
      text: textValue,
      selection: newValue.selection,
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

    return TextEditingValue(
      text: textValue,
      selection: newValue.selection,
    );
  }
}

class UpperCaseAndDigitsTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String textValue = newValue.text
        .toUpperCase()
        .replaceAll(RegExp(r'[ ]{2,}'), ' ')
        .replaceAll(RegExp(r'[^A-Z0-9 \,\-\:\/\.\(\)\&]'), '');

    return TextEditingValue(
      text: textValue,
      selection: newValue.selection,
    );
  }
}

class EmailTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String textValue = newValue.text
        .toUpperCase()
        .replaceAll(RegExp(r'[ ]{2,}'), ' ')
        .replaceAll(RegExp(r'[^A-Z0-9 \,\-\:\/\.\(\)\&\@\_\+]'), '');

    return TextEditingValue(
      text: textValue,
      selection: newValue.selection,
    );
  }
}

class Expired {
  static bool hasExpired() {
    var thisInstant = DateTime.now().toLocal();

    var expiryTime = DateTime.utc(
      lastDateRegYear,
      lastDateRegMonth,
      lastDateRegDay - 1,
      18,
      30,
    );

    return (thisInstant.compareTo(expiryTime.toLocal()) > 0) ? true : false;
  }

  static bool hasStarted() {
    var thisInstant = DateTime.now().toLocal();

    var startTime = DateTime.utc(
      startDateRegYear,
      startDateRegMonth,
      startDateRegDay - 1,
      18,
      30,
    );

    return (thisInstant.compareTo(startTime.toLocal()) >= 0) ? true : false;
  }

  static bool isAllowed() {
    return hasStarted() && !hasExpired();
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
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
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.25,
                        wordSpacing: 2.0,
                      ),
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

class SameAsPresentCheckBox extends StatelessWidget {
  const SameAsPresentCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentState>(
      listener: (state, context) {},
      buildWhen: (previous, current) =>
          previous.sameAsPresentCheckBox != current.sameAsPresentCheckBox,
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 5.w,
            ),
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
        // String invalidFields = state.invalidFields.toString();

        bool isValid = state.status.isValidated &&
            ((state.hasAadharCard == "YES" && state.aadharNumber.valid) ||
                (state.hasAadharCard == "NO" &&
                    state.aadharEnrollmentID.valid));

        return state.status == FormzStatus.submissionInProgress
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
                          ? isValid
                              ? Container()
                              : invalidFieldsWidget(state.invalidFields)
                          // : Text(
                          //     "Please check the following required fields (with blue highlighted icons) before submitting\n\n$invalidFields",
                          //     textAlign: TextAlign.center,
                          //     textWidthBasis: TextWidthBasis.parent,
                          //     overflow: TextOverflow.visible,
                          //     softWrap: true,
                          //     style: const TextStyle(
                          //       color: Colors.redAccent,
                          //       fontStyle: FontStyle.italic,
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 16,
                          //       letterSpacing: 0.25,
                          //       wordSpacing: 2.0,
                          //     ),
                          //   )
                          : Container(),
                      spacerWidget(),
                      spacerWidget(),
                      (state.setEnabled == false ||
                              state.status == FormzStatus.submissionSuccess)
                          // ? ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       padding: const EdgeInsets.symmetric(
                          //         horizontal: 50,
                          //         vertical: 20,
                          //       ),
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //       backgroundColor: Colors.blueAccent,
                          //     ),
                          //     onPressed: () => Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => CreatePDF(
                          //           state: state,
                          //         ),
                          //       ),
                          //     ),
                          //     child: const Text('Print Admission Form'),
                          //   )
                          ? printButton(context, state)
                          : ElevatedButton(
                              key: const Key(
                                  'studentForm_reviewAdmission_elevatedButton'),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: Colors.blueAccent,
                              ),
                              onPressed: isValid
                                  ? () => showPDF(context, state)
                                  : null,
                              child: const Text('Review Admission Form'),
                            ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

Future<dynamic> showPDF(BuildContext parentContext, StudentState state) {
  return showDialog(
    context: parentContext,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 16,
        title: Text(
            "ADMISSION FORM $academicYear (${state.admissionSoughtForClass.value})"),
        content: SizedBox(
          width: 70.w,
          child: CreatePDF(
            state: state,
          ),
        ),
        actions: [
          state.loadStatus == LoadStatus.NewStudent
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  onPressed: () => confirmDialog(parentContext, "Confirm",
                      "Are you sure to submit & lock ?"),
                  child: const Text('SUBMIT & LOCK'),
                )
              : Container(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: state.loadStatus == LoadStatus.NewStudent
                ? const Text('GO BACK')
                : const Text('DONE'),
          ),
        ],
      );
    },
  );
}

Future<dynamic> showInfoPDF(BuildContext context) async {
  final ByteData bytes = await rootBundle.load('assets/instructions.pdf');
  final Uint8List data = bytes.buffer.asUint8List();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 16,
        title: Text("ADMISSION INSTRUCTIONS $academicYear"),
        content: SizedBox(
          width: 70.w,
          child: PdfPreview(
            initialPageFormat: PdfPageFormat.a4.portrait,
            canDebug: false,
            build: (format) => data,
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('DONE'),
          ),
        ],
      );
    },
  );
}

Widget printButton(BuildContext context, StudentState state) {
  return ElevatedButton(
    key: const Key('studentForm_printForm_elevatedButton'),
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.blueAccent,
    ),
    onPressed: () => showPDF(context, state),
    child: const Text('Print Admission Form'),
  );
}

Widget instructionButton(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 5.w,
      ),
      child: Column(
        children: <Widget>[
          ElevatedButton(
            key: const Key('studentForm_instruction_elevatedButton'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            onPressed: () => showInfoPDF(context),
            child: const Text('Read instructions'),
          ),
        ],
      ),
    ),
  );
}

Future<dynamic> notifyDialog(
    BuildContext context, String title, String message) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 16,
        title: Text(
          title,
          softWrap: true,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SizedBox(
          width: 340,
          child: Text(
            message,
            softWrap: true,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

Future<dynamic> confirmDialog(
    BuildContext parentContext, String title, String message) async {
  return showDialog(
    context: parentContext,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 16,
        title: Text(
          title,
          softWrap: true,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SizedBox(
          width: 340,
          child: Text(
            message,
            softWrap: true,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            onPressed: () {
              Navigator.of(context)
                ..pop()
                ..pop();
              parentContext.read<StudentCubit>().submitAndLockPressed();
            },
            child: const Text('SUBMIT & LOCK'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CANCEL'),
          ),
        ],
      );
    },
  );
}

Widget spacerWidget() {
  return const SizedBox(height: 16);
}

Widget dividerWidget() {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 0,
      horizontal: 5.w,
    ),
    child: const Divider(
      height: 20,
      thickness: 5,
      indent: 20,
      endIndent: 20,
    ),
  );
}

Widget invalidFieldsWidget(List<String> invalidFields) {
  List<Widget> chipList = [];
  for (var title in invalidFields) {
    chipList.add(
      invalidChip(title),
    );
  }
  return Wrap(
    spacing: 10.0,
    runSpacing: 10.0,
    runAlignment: WrapAlignment.spaceBetween,
    alignment: WrapAlignment.spaceBetween,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: chipList,
  );
}

Widget invalidChip(String title) {
  return Chip(
    elevation: 3,
    padding: const EdgeInsets.all(8),
    backgroundColor: Colors.redAccent.shade100,
    shadowColor: Colors.black,
    avatar: const Icon(
      Icons.warning_amber_rounded,
      color: Colors.yellowAccent,
      size: 18.0,
    ),
    label: Text(
      title,
      softWrap: true,
      style: const TextStyle(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        letterSpacing: 0.25,
        wordSpacing: 2.0,
      ),
    ), //Text
  );
}
