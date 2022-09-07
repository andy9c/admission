import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum EmailMultipleValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class EmailMultiple extends FormzInput<String, EmailMultipleValidationError> {
  /// {@macro email}
  const EmailMultiple.pure() : super.pure('');

  /// {@macro email}
  const EmailMultiple.dirty([String value = '']) : super.dirty(value);

  //r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  //https://social.msdn.microsoft.com/Forums/en-US/8297af41-effc-49fb-8fa7-d36a0d49d401/regex-to-validate-multiple-email?forum=aspwebforms
  static final RegExp _emailRegExp = RegExp(
    r"^(\w([-_+.']?\w+)+@(\w(-*\w+)+\.)+[a-zA-Z]{2,4}[,])*\w([-_+.']?\w+)+@(\w(-*\w+)+\.)+[a-zA-Z]{2,4}$",
  );

  @override
  EmailMultipleValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailMultipleValidationError.invalid;
  }
}
