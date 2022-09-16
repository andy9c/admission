import 'package:admission/manage/manage.dart';

import '../app.dart';
import '../../home/home.dart';
import '../../login/login.dart';
import 'package:flutter/widgets.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
    case AppStatus.administrator:
      return [ManagePage.page()];
    default:
      return [LoginPage.page()];
  }
}
