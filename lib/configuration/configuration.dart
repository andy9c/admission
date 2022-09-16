// ignore_for_file: non_constant_identifier_names

import 'package:date_format/date_format.dart';

String academicYear = "2023-2024";

int expYear = 2022;
int expMonth = 10;
// if last date of application is 26 then expDay = last day + 1
// therefore expDay = 26 + 1 = 27
int expDay = 21;

String lastDateOfRegistration = "";
String startDateOfSubmission = "";
String lastDateOfSubmission = "";

int calendarFirstYear = 2000;
int calendarLastYear = 0;

String configSchoolName = "St Paul's School, Rourkela";
String configNoticeLine1 = "";
String configNoticeLine2 =
    "Recommended Browsers : Chrome, Edge, Firefox & Safari";
String configNoticeLine3 =
    "Trouble logging in ?\nPlease contact +91 8895219339";
String configAppBarName = "";

String assetSchoolLogo = "assets/st_pauls_logo.png";

String rootCollection = 'admission_ay_2023_2024';
String rootStorageCollection = "";
String emailCollection = "mail";
// const String emailTemplate = "admission";
String emailTemplate = "admission_pdf";
String schoolEmail = "admission@stpaulsrourkela.org";
// const String schoolEmail = "andy9c@gmail.com";

void configurationUpdate() {
  lastDateOfRegistration = formatDate(
          DateTime(expYear, expMonth, expDay - 1), [d, '-', M, '-', yyyy])
      .toUpperCase();

  lastDateOfSubmission =
      formatDate(DateTime(expYear, expMonth, expDay), [d, '-', M, '-', yyyy])
          .toUpperCase();

  calendarLastYear = expYear + 1;

  configNoticeLine1 = "Last Date Of Registration : $lastDateOfRegistration";
  configAppBarName = "St Paul's School Admission $academicYear";

  rootStorageCollection = rootCollection;
}
