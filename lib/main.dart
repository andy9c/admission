// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/bloc_observer.dart';
import 'app/view/app.dart';
import 'configuration/configuration.dart';
import 'firebase_options.dart';

final remoteConfig = FirebaseRemoteConfig.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await remoteConfig.setConfigSettings(
  //   RemoteConfigSettings(
  //     fetchTimeout: const Duration(minutes: 1),
  //     minimumFetchInterval: const Duration(hours: 1),
  //   ),
  // );

  // await remoteConfig.setDefaults({
  //   "academicYear": academicYear,
  //   "expYear": expYear,
  //   "expMonth": expMonth,
  //   "expDay": expDay,
  //   "configSchoolName": configSchoolName,
  //   "configNoticeLine2": configNoticeLine2,
  //   "rootCollection": rootCollection,
  //   "emailCollection": emailCollection,
  //   "emailTemplate": emailTemplate,
  //   "schoolEmail": schoolEmail,
  // });

  // await remoteConfig.fetchAndActivate();

  // academicYear = remoteConfig.getString("academicYear");
  // expYear = remoteConfig.getInt("expYear");
  // expMonth = remoteConfig.getInt("expMonth");
  // expDay = remoteConfig.getInt("expDay");
  // configSchoolName = remoteConfig.getString("configSchoolName");
  // configNoticeLine2 = remoteConfig.getString("configNoticeLine2");
  // rootCollection = remoteConfig.getString("rootCollection");
  // emailCollection = remoteConfig.getString("emailCollection");
  // emailTemplate = remoteConfig.getString("emailTemplate");
  // schoolEmail = remoteConfig.getString("schoolEmail");

  configurationUpdate();

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  if (kIsWeb) {
    // running on the web!
    await FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6LfUzJgcAAAAABYmoyiNUOqaOcvMj8CXDyHTDr4p',
    );
  } else {
    await FirebaseAppCheck.instance.activate();
  }

  Bloc.observer = AppBlocObserver();
  runApp(App(authenticationRepository: authenticationRepository));
}
