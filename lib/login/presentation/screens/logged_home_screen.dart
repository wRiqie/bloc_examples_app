import 'package:bloc_app/login/business_logic/services/hive_service.dart';
import 'package:bloc_app/login/business_logic/services/session_service.dart';
import 'package:bloc_app/login/core/constants.dart';
import 'package:bloc_app/login/data/models/auth_model.dart';
import 'package:bloc_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class LoggedHomeScreen extends StatefulWidget {
  const LoggedHomeScreen({super.key});

  @override
  State<LoggedHomeScreen> createState() => _LoggedHomeScreenState();
}

class _LoggedHomeScreenState extends State<LoggedHomeScreen> {
  late SessionService service;

  @override
  void initState() {
    super.initState();
    final authStorage = HiveService<AuthModel>(Constants.session);
    service = SessionService(authStorage);
  }

  @override
  void dispose() {
    service.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    AuthModel? auth = args?['auth'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(auth?.email ?? ''),
          IconButton(
            onPressed: () {
              service.clearSession().then((value) {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              });
            },
            icon: const Icon(Icons.logout),
            color: Theme.of(context).colorScheme.primary,
          )
        ],
      )),
    );
  }
}
