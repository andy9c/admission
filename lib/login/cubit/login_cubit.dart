import 'package:admission/configuration/configuration.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:duration/duration.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  void timerChanged() {
    var thisInstant = DateTime.now().toLocal();

    var openTime = DateTime.utc(
      startDateRegYear,
      startDateRegMonth,
      startDateRegDay - 1,
      18,
      30,
    );

    var closeTime = DateTime.utc(
      lastDateRegYear,
      lastDateRegMonth,
      lastDateRegDay - 1,
      18,
      30,
    );

    var openDiff = openTime.difference(thisInstant);
    var closeDiff = closeTime.difference(thisInstant);

    emit(state.copyWith(
      openTimer:
          "Portal opens in ${printDuration(openDiff, abbreviated: true)}",
      closeTimer:
          "Portal closes in ${printDuration(closeDiff, abbreviated: true)}",
    ));
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
