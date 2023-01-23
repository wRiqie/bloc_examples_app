import 'package:bloc_app/login/business_logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:bloc_app/login/business_logic/blocs/auth_bloc/auth_event.dart';
import 'package:bloc_app/login/business_logic/blocs/auth_bloc/auth_state.dart';
import 'package:bloc_app/login/business_logic/cubits/checkbox_cubit.dart';
import 'package:bloc_app/login/business_logic/cubits/password_obscure_cubit.dart';
import 'package:bloc_app/login/business_logic/services/hive_service.dart';
import 'package:bloc_app/login/business_logic/services/session_service.dart';
import 'package:bloc_app/login/core/dependency_injector/dependency_injector.dart';
import 'package:bloc_app/login/core/mixins/validations_mixin.dart';
import 'package:bloc_app/login/data/models/auth_model.dart';
import 'package:bloc_app/login/presentation/widgets/social_login_button.dart';
import 'package:bloc_app/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationsMixin {
  final bloc = DependencyInjector().get<AuthBloc>();
  final checkboxCubit = DependencyInjector().get<CheckboxCubit>();
  final passwordObscureCubit = DependencyInjector().get<PasswordObscureCubit>();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  late SessionService sessionService;

  @override
  void initState() {
    super.initState();
    final authStorage = HiveService<AuthModel>('session');
    sessionService = SessionService(authStorage);
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print('disposing');
    }
    bloc.close();
    checkboxCubit.close();
    passwordObscureCubit.close();
    emailController.dispose();
    passwordController.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    sessionService.close();
    super.dispose();
  }

  void signin() {
    if (emailNode.hasFocus) emailNode.unfocus();
    if (passwordNode.hasFocus) passwordNode.unfocus();
    if (!formKey.currentState!.validate()) return;
    final auth = AuthModel(
      email: emailController.text,
      password: passwordController.text,
    );
    bloc.add(AuthSignin(auth));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        if (state is AuthSuccess) {
          if (state.response.object != null) {
            Future<dynamic> action = checkboxCubit.state
                ? sessionService.saveSession(state.response.object!)
                : Future.value();

            action.then((value) {
              Navigator.pushReplacementNamed(context, AppRoutes.logged,
                  arguments: {
                    'auth': state.response.object,
                  });
            });
          }
        }
      },
      child: Stack(
        children: [
          Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                focusNode: emailNode,
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.email,
                                  ),
                                  hintText: 'Email',
                                ),
                                validator: (value) {
                                  return combine([
                                    () => isNotEmpty(value),
                                    () => isValidEmail(value)
                                  ]);
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              BlocBuilder<PasswordObscureCubit, bool>(
                                bloc: passwordObscureCubit,
                                builder: (context, state) {
                                  return TextFormField(
                                    focusNode: passwordNode,
                                    controller: passwordController,
                                    onFieldSubmitted: (_) {
                                      signin();
                                    },
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: state
                                            ? const Icon(Icons.visibility)
                                            : const Icon(
                                                Icons.visibility_off,
                                              ),
                                        onPressed: passwordObscureCubit.toggle,
                                      ),
                                      hintText: 'Senha',
                                    ),
                                    obscureText: state,
                                    validator: isNotEmpty,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocBuilder<CheckboxCubit, bool>(
                              bloc: checkboxCubit,
                              builder: (context, state) => Checkbox(
                                value: checkboxCubit.state,
                                onChanged: (_) {
                                  checkboxCubit.toggle();
                                },
                              ),
                            ),
                            Text(
                              'Lembre-se de mim',
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            onPressed: signin,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.grey.shade700,
                              ),
                            ),
                            child: const Text(
                              'Entrar',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 1,
                              width: 80,
                              color: Colors.grey.shade700,
                            ),
                            Text(
                              'Ou continue com',
                              style: GoogleFonts.poppins(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Container(
                              height: 1,
                              width: 80,
                              color: Colors.grey.shade700,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SocialLoginButton(
                              icon: 'assets/img/google.png',
                              onTap: () {
                                bloc.add(
                                  AuthSignin(
                                    AuthModel(
                                      email: 'gUser@gmail.com',
                                      password: const Uuid().v4(),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SocialLoginButton(
                              icon: 'assets/img/facebook.png',
                              onTap: () {
                                bloc.add(
                                  AuthSignin(
                                    AuthModel(
                                      email: 'fUser@gmail.com',
                                      password: const Uuid().v4(),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SocialLoginButton(
                              icon: 'assets/img/github.png',
                              onTap: () {
                                bloc.add(
                                  AuthSignin(
                                    AuthModel(
                                      email: 'gitUser@gmail.com',
                                      password: const Uuid().v4(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            bloc: bloc,
            builder: (context, state) {
              return Visibility(
                visible: state is AuthLoading,
                child: Container(
                  color: Colors.black45,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
