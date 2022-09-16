import 'package:admission/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  static Page page() => const MaterialPage<void>(child: ManagePage());

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management Portal'),
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
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Container(),
      ),
    );
  }
}
