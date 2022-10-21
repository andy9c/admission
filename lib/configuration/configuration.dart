// ignore_for_file: non_constant_identifier_names

import 'package:date_format/date_format.dart';

String academicYear = "2023-2024";

int startDateRegYear = 2022;
int startDateRegMonth = 9;
int startDateRegDay = 30;

int lastDateRegYear = 2022;
int lastDateRegMonth = 10;
int lastDateRegDay = 20;

int startDateSubYear = 2022;
int startDateSubMonth = 10;
int startDateSubDay = 11;

int lastDateSubYear = 2022;
int lastDateSubMonth = 10;
int lastDateSubDay = 22;

String startDateOfRegistration = "";
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
  startDateOfRegistration = formatDate(
      DateTime(startDateRegYear, startDateRegMonth, startDateRegDay),
      [d, '-', M, '-', yyyy]).toUpperCase();

  lastDateOfRegistration = formatDate(
      DateTime(lastDateRegYear, lastDateRegMonth, lastDateRegDay),
      [d, '-', M, '-', yyyy]).toUpperCase();

  startDateOfSubmission = formatDate(
      DateTime(startDateSubYear, startDateSubMonth, startDateSubDay),
      [d, '-', M, '-', yyyy]).toUpperCase();

  lastDateOfSubmission = formatDate(
      DateTime(lastDateSubYear, lastDateSubMonth, lastDateSubDay),
      [d, '-', M, '-', yyyy]).toUpperCase();

  calendarLastYear = lastDateRegYear + 1;

  configNoticeLine1 = "Last Date Of Registration : $lastDateOfRegistration";
  configAppBarName = "St Paul's School Admission $academicYear";

  rootStorageCollection = rootCollection;
}
