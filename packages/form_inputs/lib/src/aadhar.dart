import 'package:checkdigit/checkdigit.dart' as check;
import 'package:formz/formz.dart';

/// Validation errors for the [Compulsory] [FormzInput].
enum AadharValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template compulsory}
/// Form input for an compulsory input.
/// {@endtemplate}
class Aadhar extends FormzInput<String?, AadharValidationError> {
  /// {@macro compulsory}
  const Aadhar.pure() : super.pure(null);

  /// {@macro compulsory}
  const Aadhar.dirty([String? value = null]) : super.dirty(value);

  //r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  // static final RegExp _compulsoryRegExp = RegExp(
  //   r'^(?!\s*$).+$',
  // );

  // static final _aadharRegExp = RegExp(r'^[0-9]*$');

  @override
  AadharValidationError? validator(String? value) {
    if (value == null || value.isEmpty) value = "";

    value = value.replaceAll(new RegExp(r'[^0-9]'), '');
    bool isValid = check.verhoeff.validate(value);

    return (value.trim().length == 12 && isValid)
        ? null
        : value.trim().length == 0
            ? null
            : AadharValidationError.invalid;
  }
}
