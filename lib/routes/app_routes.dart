import 'package:bloc_app/counter/counter_screen.dart';
import 'package:bloc_app/login/presentation/screens/logged_home_screen.dart';
import 'package:bloc_app/login/presentation/screens/login_screen.dart';

import '../lobby_screen.dart';

class AppRoutes {
  static const lobby = 'lobby';
  static const counter = 'counter';
  static const login = 'login';
  static const logged = 'logged';

  static final routes = {
    lobby: (context) => const LobbyScreen(),
    counter: (context) => const CounterScreen(),
    login: (context) => const LoginScreen(),
    logged: (context) => const LoggedHomeScreen(),
  };
}
