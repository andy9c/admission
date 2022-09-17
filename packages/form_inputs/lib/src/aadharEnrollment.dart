import 'package:formz/formz.dart';

/// Validation errors for the [Compulsory] [FormzInput].
enum AadharEnrollmentValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template compulsory}
/// Form input for an compulsory input.
/// {@endtemplate}
class AadharEnrollment
    extends FormzInput<String?, AadharEnrollmentValidationError> {
  /// {@macro compulsory}
  const AadharEnrollment.pure() : super.pure(null);

  /// {@macro compulsory}
  const AadharEnrollment.dirty([String? value = null]) : super.dirty(value);

  //r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  // static final RegExp _compulsoryRegExp = RegExp(
  //   r'^(?!\s*$).+$',
  // );

  // static final _aadharRegExp = RegExp(r'^[0-9]*$');

  @override
  AadharEnrollmentValidationError? validator(String? value) {
    if (value == null || value.isEmpty) value = "";

    value = value.replaceAll(new RegExp(r'[^0-9]'), '');

    return (value.trim().length == 14)
        ? null
        : AadharEnrollmentValidationError.invalid;
  }
}
