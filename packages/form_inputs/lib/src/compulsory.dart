import 'package:formz/formz.dart';

/// Validation errors for the [Compulsory] [FormzInput].
enum CompulsoryValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template compulsory}
/// Form input for an compulsory input.
/// {@endtemplate}
class Compulsory extends FormzInput<String?, CompulsoryValidationError> {
  /// {@macro compulsory}
  const Compulsory.pure() : super.pure('');

  /// {@macro compulsory}
  const Compulsory.dirty([String? value = '']) : super.dirty(value);

  //r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  // static final RegExp _compulsoryRegExp = RegExp(
  //   r'^(?!\s*$).+$',
  // );

  @override
  CompulsoryValidationError? validator(String? value) {
    return (value != null && value.trim().length > 0)
        ? null
        : CompulsoryValidationError.invalid;
  }
}
