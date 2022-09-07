// ignore_for_file: non_constant_identifier_names

import 'package:date_format/date_format.dart';

String academic_year = "2023-2024";

int expYear = 2022;
int expMonth = 10;
// if last date of application is 26 then expDay = last day + 1
// therefore expDay = 26 + 1 = 27
int expDay = 11;

String last_date_of_registration =
    formatDate(DateTime(expYear, expMonth, expDay - 1), [d, '-', M, '-', yyyy])
        .toUpperCase();

String last_date_of_submission =
    formatDate(DateTime(expYear, expMonth, expDay + 6), [d, '-', M, '-', yyyy])
        .toUpperCase();

int calendarFirstYear = 2000;
int calendarLastYear = expYear + 1;
