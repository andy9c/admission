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
        child: SizedBox(
          width: 70.w,
          child: Text(
            heading,
            style: textTheme.headline6,
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

    Widget loadStudent(bool setEnabled) {
      return Align(
        alignment: const Alignment(0, -1 / 3),
        child: Scrollbar(
          thumbVisibility: true,
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(0.0),
            shrinkWrap: false,
            children: <Widget>[
              const SizedBox(height: 80),
              Avatar(photo: user.photo),
              const SizedBox(height: 4),
              registrationEmailID(),
              setEnabled ? Container() : const SubmitAndLockButton(),
              spacerWidget(),
              spacerWidget(),
              spacerWidget(),
              spacerWidget(), sectionHeading("General Information"),
              dividerWidget(),
              spacerWidget(),
              sectionHeading(
                  "All information typed here is automatically converted to capital letters. Email addresses are valid both in capital and small letters. Example: hello@gmail.com is the same as HELLO@GMAIL.COM\n\nFor successfully completing the application process\n\n1) Fill in the details here and submit the application form. 2)) Take a print out of the admission form.\n3) Submit the printed application form in the school office."),
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
              const AadharCard(),
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
              const sameAsPresentCheckBox(),
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
              sectionHeading(
                  "1) I understand and agree that the registration of my ward does not guarantee admission to the school."),
              spacerWidget(),
              sectionHeading(
                  "2) I hereby declare that the information given above is true to the best of my knowledge. I promise to abide by the admission procedure of the school. I understand that my application will be rejected on any false information."),
              spacerWidget(),
              !setEnabled
                  ? sectionHeading(
                      "3) I understand and agree that this admission from is permanently locked and no further changes can be made at any point of time, in the admission process.")
                  : Container(),
              spacerWidget(),
              const IAgreeCheckBox(),
              spacerWidget(),
              spacerWidget(),
              setEnabled ? sectionHeading("Submit & Lock") : Container(),
              setEnabled ? dividerWidget() : Container(),
              setEnabled ? spacerWidget() : Container(),
              setEnabled
                  ? sectionHeading(
                      "This admission application form once submitted will be permanently locked. No further changes can be made at any point of time, in the admission process.")
                  : Container(),
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
        title: Text('Admission Form $academic_year'),
        backgroundColor: const Color(0xFFA02B29), // appbar color.
        foregroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => _studentCubit,
        child: BlocConsumer<StudentCubit, StudentState>(
          listener: (context, state) {},
          builder: (context, state) {
            return (state.loadStatus == LoadStatus.Loading)
                ? const LoadingState()
                : (state.loadStatus == LoadStatus.ExistingStudent)
                    ? loadStudent(false)
                    : (state.loadStatus == LoadStatus.NewStudent &&
                            Expired.hasExpired() == false)
                        ? loadStudent(true)
                        : (Expired.hasExpired() == true)
                            ? notifyPage("Registration Over")
                            : notifyPage("Something went Wrong !");
          },
        ),
      ),
    );
  }
}
