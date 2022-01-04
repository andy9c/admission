import 'package:formz/formz.dart';

/// Validation errors for the [Compulsory] [FormzInput].
enum CheckBoxValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template compulsory}
/// Form input for an compulsory input.
/// {@endtemplate}
class CheckBox extends FormzInput<bool, CheckBoxValidationError> {
  /// {@macro compulsory}
  const CheckBox.pure() : super.pure(false);

  /// {@macro compulsory}
  const CheckBox.dirty([bool value = false]) : super.dirty(value);

  //r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  // static final RegExp _compulsoryRegExp = RegExp(
  //   r'^(?!\s*$).+$',
  // );

  @override
  CheckBoxValidationError? validator(bool? value) {
    return (value != null && value == true)
        ? null
        : CheckBoxValidationError.invalid;
  }
}
