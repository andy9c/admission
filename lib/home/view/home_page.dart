// ignore_for_file: unused_element

import 'package:admission/configuration/configuration.dart';

import '../../app/app.dart';
import '../cubit/student_cubit.dart';
import '../home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StudentCubit _studentCubit;

  @override
  void initState() {
    _studentCubit = StudentCubit()..loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final ScrollController scrollController = ScrollController();

    Widget registrationEmailID() {
      return Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 70.w,
          child: Align(
            alignment: Alignment.center,
            child: Text(user.email ?? '', style: textTheme.headline6),
          ),
        ),
      );
    }

    Widget sectionHeading(String heading) {
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 5.w,
          ),
          child: Text(
            heading,
            style: textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget sectionInfo(String heading) {
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 5.w,
          ),
          child: Text(
            heading,
            softWrap: true,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.25,
              wordSpacing: 2.0,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget notifyPage(String message) {
      return Align(
        alignment: const Alignment(0, -1 / 3),
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            shrinkWrap: false,
            children: <Widget>[
              const SizedBox(height: 80),
              Avatar(photo: user.photo),
              const SizedBox(height: 4),
              registrationEmailID(),
              spacerWidget(),
              spacerWidget(),
              sectionHeading(message),
            ],
          ),
        ),
      );
    }

    Widget printPDF() {
      return Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 80),
            Avatar(photo: user.photo),
            const SizedBox(height: 4),
            registrationEmailID(),
            spacerWidget(),
            //printButton(context),
          ],
        ),
      );
    }

    Widget loadStudent(bool setEnabled) {
      return Align(
        alignment: const Alignment(0, -1 / 3),
        child: Scrollbar(
          thumbVisibility: true,
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(0.0),
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: false,
            children: <Widget>[
              const SizedBox(height: 80),
              Avatar(photo: user.photo),
              const SizedBox(height: 4),
              registrationEmailID(),
              setEnabled ? Container() : const SubmitAndLockButton(),
              spacerWidget(),
              instructionButton(context),
              spacerWidget(),
              spacerWidget(),
              spacerWidget(),
              spacerWidget(), sectionHeading("General Information"),
              dividerWidget(),
              spacerWidget(),
              sectionInfo(
                  "For successfully completing the application process, please read the instructions carefully (click on the orange button).\nHere are some important information.\n\n1) Fill in the details here and submit the online application form on or before $lastDateOfRegistration\n2) Submit the printed form in the school office between 11-OCT-2022 and 22-OCT-2022\n\nAll information typed here is automatically converted to capital letters. Email addresses are valid both in capital and small letters. Example: hello@gmail.com is the same as HELLO@GMAIL.COM. If you don't receive an acknowledgement email after online submission, please check your spam folder."),
              spacerWidget(),
              dividerWidget(),
              spacerWidget(),
              spacerWidget(),
              spacerWidget(),
              spacerWidget(),
              sectionHeading("Candidate's Information"),
              dividerWidget(),
              spacerWidget(),
              //LoadingState(),
              //spacerWidget(),
              const CandidateFirstName(),
              spacerWidget(),
              const CandidateMiddleName(),
              spacerWidget(),
              const CandidateLastName(),
              spacerWidget(),
              const DateOfBirth(),
              spacerWidget(),
              const PlaceOfBirth(),
              spacerWidget(),
              const GenderSelection(),
              spacerWidget(),
              const MotherTongueSelection(),
              spacerWidget(),
              const BloodGroupSelection(),
              spacerWidget(),
              const ReligionSelection(),
              spacerWidget(),
              const SocialCategorySelection(),
              spacerWidget(),
              const HasAadharCardSelection(),
              const AadharCard(),
              const AadharEnrollmentID(),
              spacerWidget(),
              const LastSchoolAttended(),
              spacerWidget(),
              const LastClassAttended(),
              spacerWidget(),
              const AdmissionSoughtSelection(),
              spacerWidget(),
              spacerWidget(),
              sectionHeading("Father's Information"),
              dividerWidget(),
              spacerWidget(),
              const FatherFirstName(),
              spacerWidget(),
              const FatherMiddleName(),
              spacerWidget(),
              const FatherLastName(),
              spacerWidget(),
              const FatherProfessionSelection(),
              spacerWidget(),
              const FatherQualificationSelection(),
              spacerWidget(),
              const FatherAdditionalQualification(),
              spacerWidget(),
              const FatherHomeContact(),
              spacerWidget(),
              const FatherOfficeContact(),
              spacerWidget(),
              const FatherEmail(),
              spacerWidget(),
              spacerWidget(),
              sectionHeading("Mother's Information"),
              dividerWidget(),
              spacerWidget(),
              const MotherFirstName(),
              spacerWidget(),
              const MotherMiddleName(),
              spacerWidget(),
              const MotherLastName(),
              spacerWidget(),
              const MotherProfessionSelection(),
              spacerWidget(),
              const MotherQualificationSelection(),
              spacerWidget(),
              const MotherAdditionalQualification(),
              spacerWidget(),
              const MotherHomeContact(),
              spacerWidget(),
              const MotherOfficeContact(),
              spacerWidget(),
              const MotherEmail(),
              spacerWidget(),
              spacerWidget(),
              sectionHeading(
                  "Relationship to Present Student in School (IF ANY)"),
              dividerWidget(),
              spacerWidget(),
              const RelationshipWithStudentSelection(),
              spacerWidget(),
              const RelationshipStudentName(),
              spacerWidget(),
              const RelationshipStudentRegNo(),
              spacerWidget(),
              const RelationshipStudentClassSection(),
              spacerWidget(),
              const RelationshipStudentYearOfJoining(),
              spacerWidget(),
              const RelationshipStudentYearOfLeaving(),
              spacerWidget(),
              spacerWidget(),
              sectionHeading("Present Address (For Correspondence)"),
              dividerWidget(),
              spacerWidget(),
              const PresentLocation(),
              spacerWidget(),
              const PresentCity(),
              spacerWidget(),
              const PresentPostOffice(),
              spacerWidget(),
              const PresentDistrict(),
              spacerWidget(),
              const PresentState(),
              spacerWidget(),
              const PresentPinCode(),
              spacerWidget(),
              spacerWidget(),
              sectionHeading("Permanent Address (Domicile)"),
              dividerWidget(),
              spacerWidget(),
              const SameAsPresentCheckBox(),
              spacerWidget(),
              const PermanentLocation(),
              spacerWidget(),
              const PermanentCity(),
              spacerWidget(),
              const PermanentPostOffice(),
              spacerWidget(),
              const PermanentDistrict(),
              spacerWidget(),
              const PermanentState(),
              spacerWidget(),
              const PermanentPinCode(),
              spacerWidget(),
              spacerWidget(),
              sectionHeading("Self Declaration"),
              dividerWidget(),
              spacerWidget(),
              sectionInfo(
                  "1) I understand and agree that the registration of my ward does not guarantee admission to the school."),
              spacerWidget(),
              sectionInfo(
                  "2) I hereby declare that the information given above is true to the best of my knowledge. I promise to abide by the admission procedure of the school. I understand that my application will be rejected on any false information."),
              spacerWidget(),
              !setEnabled
                  ? sectionInfo(
                      "3) I understand and agree that this admission form is permanently locked and no further changes can be made at any point of time, in the admission process.")
                  : Container(),
              spacerWidget(),
              const IAgreeCheckBox(),
              spacerWidget(),
              spacerWidget(),
              setEnabled
                  ? sectionHeading("Review Admission Form")
                  : Container(),
              setEnabled ? dividerWidget() : Container(),
              setEnabled ? spacerWidget() : Container(),
              setEnabled
                  ? sectionInfo(
                      "Please carefully review this admission application form before submitting. Once submitted, it will be permanently locked. No further changes can be made at any point of time, in the admission process. Also do check the following incomplete fields.")
                  : Container(),
              setEnabled ? spacerWidget() : Container(),
              setEnabled ? spacerWidget() : Container(),
              const SubmitAndLockButton(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Admission Form $academicYear'),
        backgroundColor: const Color(0xFFA02B29), // appbar color.
        foregroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_info_iconButton'),
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () => showInfoPDF(context),
          ),
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app_rounded),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => _studentCubit,
        child: BlocBuilder<StudentCubit, StudentState>(
          builder: (context, state) {
            final RegExp emailRegExp = RegExp(
              r'^test+[0-9]+@admission.org$',
            );

            return (state.loadStatus == LoadStatus.Loading)
                ? const LoadingState()
                : (state.loadStatus == LoadStatus.ExistingStudent)
                    ? loadStudent(false) //printPDF()
                    : (state.loadStatus == LoadStatus.NewStudent &&
                            Expired.hasStarted() &&
                            !Expired.hasExpired())
                        ? loadStudent(true)
                        : (!Expired.hasStarted() &&
                                !Expired.hasExpired() &&
                                emailRegExp.hasMatch(user.email ?? ''))
                            ? loadStudent(true)
                            : (Expired.hasExpired())
                                ? notifyPage("Registration Over")
                                : notifyPage("Something went Wrong !");
          },
        ),
      ),
    );
  }
}
