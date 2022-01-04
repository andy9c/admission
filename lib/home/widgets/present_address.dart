// ignore_for_file: must_be_immutable

import 'package:admission/home/cubit/student_cubit.dart';
import 'package:admission/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class PresentLocation extends StatelessWidget {
  const PresentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.presentLocation != current.presentLocation,
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
              initialValue: state.presentLocation.value,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_presentLocation_textField'),
              onChanged: (presentLocation) => context
                  .read<StudentCubit>()
                  .presentLocationChanged(presentLocation),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.home, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Present Location (House No/Qr.No.)",
                helperText: '',
                errorText:
                    state.presentLocation.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class PresentCity extends StatelessWidget {
  const PresentCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.presentCity != current.presentCity,
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
              initialValue: state.presentCity,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_presentCity_textField'),
              onChanged: (presentCity) =>
                  context.read<StudentCubit>().presentCityChanged(presentCity),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.location_city_rounded),
                ),
                border: OutlineInputBorder(),
                labelText: "Present Town/City",
              ),
            ),
          ),
        );
      },
    );
  }
}

class PresentPostOffice extends StatelessWidget {
  const PresentPostOffice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.presentPostOffice != current.presentPostOffice,
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
              initialValue: state.presentPostOffice,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_presentPostOffice_textField'),
              onChanged: (presentPostOffice) => context
                  .read<StudentCubit>()
                  .presentPostOfficeChanged(presentPostOffice),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.post_add),
                ),
                border: OutlineInputBorder(),
                labelText: "Present Post Office",
              ),
            ),
          ),
        );
      },
    );
  }
}

class PresentDistrict extends StatelessWidget {
  const PresentDistrict({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.permanentDistrict != current.permanentDistrict,
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
              initialValue: state.presentDistrict,
              maxLines: 1,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_presentDistrict_textField'),
              onChanged: (presentDistrict) => context
                  .read<StudentCubit>()
                  .presentDistrictChanged(presentDistrict),
              obscureText: false,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.holiday_village_rounded),
                ),
                border: OutlineInputBorder(),
                labelText: "Present District",
              ),
            ),
          ),
        );
      },
    );
  }
}

class PresentState extends StatelessWidget {
  const PresentState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.presentState != current.presentState,
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
              initialValue: state.presentState.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_presentState_textField'),
              onChanged: (presentState) => context
                  .read<StudentCubit>()
                  .presentStateChanged(presentState),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.villa_rounded, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Present State",
                helperText: '',
                errorText: state.presentState.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

class PresentPinCode extends StatelessWidget {
  const PresentPinCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (previous, current) =>
          previous.presentPinCode != current.presentPinCode,
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
              initialValue: state.presentPinCode.value,
              maxLines: 1,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              key: const Key('studentForm_presentPinCode_textField'),
              onChanged: (presentPinCode) => context
                  .read<StudentCubit>()
                  .presentPinCodeChanged(presentPinCode),
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 0), // add padding to adjust icon
                  child: Icon(Icons.pin_drop_rounded, color: Colors.blue),
                ),
                border: const OutlineInputBorder(),
                labelText: "Present PIN Code",
                helperText: '',
                errorText:
                    state.presentPinCode.invalid ? 'required field' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
