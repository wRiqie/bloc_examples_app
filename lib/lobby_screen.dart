import 'package:bloc_app/counter/counter_screen.dart';
import 'package:bloc_app/login/business_logic/services/hive_service.dart';
import 'package:bloc_app/login/business_logic/services/session_service.dart';
import 'package:bloc_app/login/core/constants.dart';
import 'package:bloc_app/login/data/models/auth_model.dart';
import 'package:bloc_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Bem vindo à Testes BLoC',
                style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 740 ? 4 : 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    _buildCard(context,
                        color: Colors.blue,
                        title: 'Contador',
                        icon: Icons.add, onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CounterScreen(),
                        ),
                      );
                    }),
                    _buildCard(
                      context,
                      color: Colors.deepPurple,
                      title: 'Login',
                      icon: Icons.person,
                      onTap: () {
                        final service =
                            HiveService<AuthModel>(Constants.session);
                        final sessionService = SessionService(service);
                        sessionService.getActualSession().then((value) {
                          if (value != null) {
                            Navigator.pushNamed(context, AppRoutes.logged, arguments: {'auth': value});
                          } else {
                            Navigator.pushNamed(context, AppRoutes.login);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              // Wrap(
              //   alignment: WrapAlignment.spaceBetween,
              //   spacing: 10,
              //   runSpacing: 10,
              //   children: [
              //     _buildCard(context,
              //         color: Colors.blue,
              //         title: 'Contador',
              //         icon: Icons.add, onTap: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => const CounterScreen(),
              //         ),
              //       );
              //     }),
              //     _buildCard(context,
              //         color: Colors.deepPurple,
              //         title: 'Login',
              //         icon: Icons.person, onTap: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => const LoginScreen(),
              //         ),
              //       );
              //     }),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCard(
  BuildContext context, {
  required Color color,
  required IconData icon,
  required String title,
  void Function()? onTap,
}) {
  return Material(
    color: color,
    child: InkWell(
      onTap: onTap,
      child: SizedBox(
        // height: 150,
        // width: MediaQuery.of(context).size.width * .45,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 52,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          ],
        ),
      ),
    ),
  );
}
