// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/bloc_observer.dart';
import 'app/view/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  if (kIsWeb) {
    // running on the web!
    await FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6LfUzJgcAAAAABYmoyiNUOqaOcvMj8CXDyHTDr4p',
    );
  } else {
    // NOT running on the web! You can check for additional platforms here.
  }

  Bloc.observer = AppBlocObserver();
  runApp(App(authenticationRepository: authenticationRepository));
}
