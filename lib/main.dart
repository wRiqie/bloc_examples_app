import 'package:bloc_app/login/business_logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:bloc_app/login/business_logic/cubits/checkbox_cubit.dart';
import 'package:bloc_app/login/business_logic/cubits/password_obscure_cubit.dart';
import 'package:bloc_app/login/business_logic/services/hive_service.dart';
import 'package:bloc_app/login/business_logic/services/session_service.dart';
import 'package:bloc_app/login/core/dependency_injector/dependency_injector.dart';
import 'package:bloc_app/login/data/provider/fake_api.dart';
import 'package:bloc_app/login/data/repositories/auth_repository.dart';
import 'package:bloc_app/login/presentation/screens/logged_home_screen.dart';
import 'package:bloc_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'login/data/models/auth_model.dart';

void main() async {
  await Hive.initFlutter();

  final di = DependencyInjector();

  di.register<FakeApi>(() => FakeApi());
  di.register<AuthRepository>(() => AuthRepository(di.get()));
  di.register<AuthBloc>(() => AuthBloc(di.get()));
  di.register<CheckboxCubit>(() => CheckboxCubit());
  di.register<PasswordObscureCubit>(() => PasswordObscureCubit());

  Hive.registerAdapter<AuthModel>(AuthModelAdapter());

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.lobby,
    );
  }
}