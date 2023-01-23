import 'package:bloc_app/counter/bloc/counter_bloc.dart';
import 'package:bloc_app/counter/bloc/counter_event.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CounterBloc counterBloc;
  setUp(() {
    counterBloc = CounterBloc();
  });

  tearDown(() {
    counterBloc.close();
  });

  group('[CounterBloc]', () {
    test('O valor inicial deve ser 0', () {
      expect(counterBloc.state, 0);
    });

    blocTest(
      'Ao emitir o evento Increment, o valor deverá se 1',
      build: () => counterBloc,
      act: (CounterBloc bloc) => bloc.add(IncrementEvent()),
      expect: () => [1],
    );

    blocTest(
      'Ao emitir o evento Decrement, o valor deverá se -1',
      build: () => counterBloc,
      act: (CounterBloc bloc) => bloc.add(DecrementEvent()),
      expect: () => [-1],
    );
  });
}
