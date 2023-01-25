import 'package:bloc_app/login/business_logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:bloc_app/login/business_logic/blocs/auth_bloc/auth_event.dart';
import 'package:bloc_app/login/business_logic/blocs/auth_bloc/auth_state.dart';
import 'package:bloc_app/login/data/models/api_response_model.dart';
import 'package:bloc_app/login/data/models/auth_model.dart';
import 'package:bloc_app/login/data/repositories/auth_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  group('[AuthBloc]', () {
    late FakeApiMock fakeApiMock;
    late FirebaseApiMock firebaseApiMock;
    late AuthBloc authBloc;

    setUp(() {
      fakeApiMock = FakeApiMock();
      firebaseApiMock = FirebaseApiMock();
      final repository = AuthRepository(fakeApiMock, firebaseApiMock);
      authBloc = AuthBloc(repository);
    });

    tearDown(() {
      authBloc.close();
    });

    test('O estado inicial deve ser idle', () async {
      expect(authBloc.state, isA<AuthIdle>());
    });

    blocTest(
      'Deve retornar AuthLoading - AuthSuccess, quando isSuccess for true',
      build: () => authBloc,
      act: (AuthBloc bloc) {
        final auth = AuthModel(
          email: '',
          password: '',
        );
        when(() => fakeApiMock.signin(auth)).thenAnswer(
          (_) => Future.value(
            ApiResponseModel(isSuccess: true),
          ),
        );
        bloc.add(AuthSignin(auth));
      },
      expect: () => [
        isA<AuthLoading>(),
        isA<AuthSuccess>(),
      ],
    );

    blocTest(
      'Deve retornar AuthLoading - AuthError, quando isSuccess for false',
      build: () => authBloc,
      act: (AuthBloc bloc) {
        final auth = AuthModel(
          email: '',
          password: '',
        );
        when(() => fakeApiMock.signin(auth)).thenAnswer(
          (_) => Future.value(
            ApiResponseModel(isSuccess: false),
          ),
        );
        bloc.add(AuthSignin(auth));
      },
      expect: () => [
        isA<AuthLoading>(),
        isA<AuthError>(),
      ],
    );

    blocTest(
      'Deve retornar AuthLoading - AuthError, quando ocorrer uma exception',
      build: () => authBloc,
      act: (AuthBloc bloc) {
        final auth = AuthModel(
          email: '',
          password: '',
        );
        when(() => fakeApiMock.signin(auth)).thenThrow(
          (_) => Exception(),
        );
        bloc.add(AuthSignin(auth));
      },
      expect: () => [
        isA<AuthLoading>(),
        isA<AuthError>(),
      ],
    );
  });
}
