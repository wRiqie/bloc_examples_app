import 'package:bloc_app/login/business_logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:bloc_app/login/business_logic/cubits/checkbox_cubit.dart';
import 'package:bloc_app/login/business_logic/cubits/password_obscure_cubit.dart';
import 'package:bloc_app/login/core/dependency_injector/dependency_injector.dart';
import 'package:bloc_app/login/data/provider/fake_api.dart';
import 'package:bloc_app/login/data/provider/firebase_api.dart';
import 'package:bloc_app/login/data/repositories/auth_repository.dart';
import 'package:bloc_app/routes/app_routes.dart';
import 'package:bloc_app/todo_list/domain/entities/todo_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'login/data/models/auth_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();

  final di = DependencyInjector();

  di.register<FakeApi>(() => FakeApi());
  di.register<FirebaseApi>(() => FirebaseApi(FirebaseAuth.instance));
  di.register<AuthRepository>(() => AuthRepository(di.get(), di.get()));
  di.register<AuthBloc>(() => AuthBloc(di.get()));
  di.register<CheckboxCubit>(() => CheckboxCubit());
  di.register<PasswordObscureCubit>(() => PasswordObscureCubit());

  Hive.registerAdapter<AuthModel>(AuthModelAdapter());
  Hive.registerAdapter<TodoEntity>(TodoEntityAdapter());

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
