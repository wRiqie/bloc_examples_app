import 'package:bloc_app/counter/bloc/counter_bloc.dart';
import 'package:bloc_app/counter/bloc/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late final CounterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CounterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bloc Counter',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                bloc.add(DecrementEvent());
              },
              icon: const Icon(
                Icons.remove,
                size: 32,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            BlocBuilder<CounterBloc, int>(
              bloc: bloc,
              builder: (context, state) => Text(
                state.toString(),
                style: GoogleFonts.poppins(fontSize: 36),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                bloc.add(IncrementEvent());
              },
              icon: const Icon(
                Icons.add,
                size: 32,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
