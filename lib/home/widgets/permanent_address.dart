// ignore_for_file: must_be_immutable

import 'package:admission/home/cubit/student_cubit.dart';
import 'package:admission/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class PermanentLocation extends StatelessWidget {
  const PermanentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          (previous.permanentLocation != current.permanentLocation) ||
          (previous.sameAsPresentCheckBox != current.sameAsPresentCheckBox) ||
          (previous.presentLocation != current.presentLocation),
      builder: (context, state) {
        if (state.sameAsPresentCheckBox.value) {
          context.read<StudentCubit>().permanentLocationChanged(
              state.presentLocation.value == null
                  ? ""
                  : state.presentLocation.value.toString());
        }

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled && !state.sameAsPresentCheckBox.value,
              initialValue: state.setEnabled
                  ? state.sameAsPresentCheckBox.value
                      ? null
                      : state.permanentLocation.value
                  : state.permanentLocation.value,
              controller: state.setEnabled && state.sameAsPresentCheckBox.value
                  ? TextEditingController(text: state.presentLocation.value)
                  : null,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_permanentLocation_textField'),
              onChanged: (permanentLocation) {
                context
                    .read<StudentCubit>()
                    .permanentLocationChanged(permanentLocation);
              },
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.home, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Permanent Location (House No/Qr.No.)",
                helperText: '',
                errorText:
                    state.permanentLocation.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class PermanentCity extends StatelessWidget {
  const PermanentCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          (previous.permanentCity != current.permanentCity) ||
          (previous.sameAsPresentCheckBox != current.sameAsPresentCheckBox) ||
          (previous.presentCity != current.presentCity),
      builder: (context, state) {
        if (state.sameAsPresentCheckBox.value) {
          context.read<StudentCubit>().permanentCityChanged(state.presentCity);
        }

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled && !state.sameAsPresentCheckBox.value,
              initialValue: state.setEnabled
                  ? state.sameAsPresentCheckBox.value
                      ? null
                      : state.permanentCity
                  : state.permanentCity,
              controller: state.setEnabled && state.sameAsPresentCheckBox.value
                  ? TextEditingController(text: state.presentCity)
                  : null,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_permanentCity_textField'),
              onChanged: (permanentCity) => context
                  .read<StudentCubit>()
                  .permanentCityChanged(permanentCity),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.location_city_rounded),
                ),
                border: OutlineInputBorder(),
                labelText: "Permanent Town/City",
              ),
            ),
          ),
        );
      },
    );
  }
}

class PermanentPostOffice extends StatelessWidget {
  const PermanentPostOffice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          (previous.permanentPostOffice != current.permanentPostOffice) ||
          (previous.sameAsPresentCheckBox != current.sameAsPresentCheckBox) ||
          (previous.presentPostOffice != current.presentPostOffice),
      builder: (context, state) {
        if (state.sameAsPresentCheckBox.value) {
          context
              .read<StudentCubit>()
              .permanentPostOfficeChanged(state.presentPostOffice);
        }

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled && !state.sameAsPresentCheckBox.value,
              initialValue: state.setEnabled
                  ? state.sameAsPresentCheckBox.value
                      ? null
                      : state.permanentPostOffice
                  : state.permanentPostOffice,
              controller: state.setEnabled && state.sameAsPresentCheckBox.value
                  ? TextEditingController(text: state.presentPostOffice)
                  : null,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_permanentPostOffice_textField'),
              onChanged: (permanentPostOffice) => context
                  .read<StudentCubit>()
                  .permanentPostOfficeChanged(permanentPostOffice),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.post_add),
                ),
                border: OutlineInputBorder(),
                labelText: "Permanent Post Office",
              ),
            ),
          ),
        );
      },
    );
  }
}

class PermanentDistrict extends StatelessWidget {
  const PermanentDistrict({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          (previous.permanentDistrict != current.permanentDistrict) ||
          (previous.sameAsPresentCheckBox != current.sameAsPresentCheckBox) ||
          (previous.presentDistrict != current.presentDistrict),
      builder: (context, state) {
        if (state.sameAsPresentCheckBox.value) {
          context
              .read<StudentCubit>()
              .permanentDistrictChanged(state.presentDistrict);
        }

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled && !state.sameAsPresentCheckBox.value,
              initialValue: state.setEnabled
                  ? state.sameAsPresentCheckBox.value
                      ? null
                      : state.permanentDistrict
                  : state.permanentDistrict,
              controller: state.setEnabled && state.sameAsPresentCheckBox.value
                  ? TextEditingController(text: state.presentDistrict)
                  : null,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_permanentDistrict_textField'),
              onChanged: (permanentDistrict) => context
                  .read<StudentCubit>()
                  .permanentDistrictChanged(permanentDistrict),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.holiday_village_rounded),
                ),
                border: OutlineInputBorder(),
                labelText: "Permanent District",
              ),
            ),
          ),
        );
      },
    );
  }
}

class PermanentState extends StatelessWidget {
  const PermanentState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          (previous.permanentState != current.permanentState) ||
          (previous.sameAsPresentCheckBox != current.sameAsPresentCheckBox) ||
          (previous.presentState != current.presentState),
      builder: (context, state) {
        if (state.sameAsPresentCheckBox.value) {
          context.read<StudentCubit>().permanentStateChanged(
              state.presentState.value == null
                  ? ""
                  : state.presentState.value.toString());
        }

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled && !state.sameAsPresentCheckBox.value,
              initialValue: state.setEnabled
                  ? state.sameAsPresentCheckBox.value
                      ? null
                      : state.permanentState.value
                  : state.permanentState.value,
              controller: state.setEnabled && state.sameAsPresentCheckBox.value
                  ? TextEditingController(text: state.presentState.value)
                  : null,
              maxLines: 1,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_permanentState_textField'),
              onChanged: (permanentState) => context
                  .read<StudentCubit>()
                  .permanentStateChanged(permanentState),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.villa_rounded, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Permanent State",
                helperText: '',
                errorText:
                    state.permanentState.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class PermanentPinCode extends StatelessWidget {
  const PermanentPinCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          (previous.permanentPinCode != current.permanentPinCode) ||
          (previous.sameAsPresentCheckBox != current.sameAsPresentCheckBox) ||
          (previous.presentPinCode != current.presentPinCode),
      builder: (context, state) {
        if (state.sameAsPresentCheckBox.value) {
          context.read<StudentCubit>().permanentPinCodeChanged(
              state.presentPinCode.value == null
                  ? ""
                  : state.presentPinCode.value.toString());
        }

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 70.w,
            child: TextFormField(
              inputFormatters: [
                UpperCaseTextFormatter(),
              ],
              enabled: state.setEnabled && !state.sameAsPresentCheckBox.value,
              initialValue: state.setEnabled
                  ? state.sameAsPresentCheckBox.value
                      ? null
                      : state.permanentPinCode.value
                  : state.permanentPinCode.value,
              controller: state.setEnabled && state.sameAsPresentCheckBox.value
                  ? TextEditingController(text: state.presentPinCode.value)
                  : null,
              maxLines: 1,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
              key: const Key('studentForm_permanentPinCode_textField'),
              onChanged: (permanentPinCode) => context
                  .read<StudentCubit>()
                  .permanentPinCodeChanged(permanentPinCode),
              obscureText: false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 20),
                prefixIcon: const Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.pin_drop_rounded, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Permanent PIN Code",
                helperText: '',
                errorText:
                    state.permanentPinCode.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
