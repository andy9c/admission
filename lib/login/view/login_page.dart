import 'package:admission/configuration/configuration.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("St Paul's School Admission $academicYear"),
        backgroundColor: const Color(0xFFA02B29), // appbar color.
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
