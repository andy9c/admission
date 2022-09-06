// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/view/app.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/widgets.dart';

import 'app/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: '6LfUzJgcAAAAABYmoyiNUOqaOcvMj8CXDyHTDr4p',
  );

  Bloc.observer = AppBlocObserver();
  runApp(App(authenticationRepository: authenticationRepository));
}
