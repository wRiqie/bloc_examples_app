import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/login/business_logic/blocs/auth_bloc/auth_event.dart';
import 'package:bloc_app/login/business_logic/blocs/auth_bloc/auth_state.dart';
import 'package:bloc_app/login/data/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  // final _inputController = StreamController<AuthEvent>();
  // final _outputController = StreamController<AuthState>();

  // Sink<AuthEvent> get inputAuth => _inputController.sink;
  // Stream<AuthState> get stream => _outputController.stream;

  AuthBloc(this._repository) : super(AuthIdle()) {
    // _outputController.add(AuthIdle());
    // _inputController.stream.listen(_mapEventToState);
    on<AuthSignin>((event, emit) async {
      emit(AuthLoading());
      final state = await _signin(event);
      emit(state);
    });
  }

  // void _mapEventToState(AuthEvent event) async {
  //   _outputController.add(AuthLoading());
  //   if (event is AuthSigninEvent) _outputController.add(await _signin(event));
  // }

  Future<AuthState> _signin(AuthSignin event) async {
    try {
      final response = await _repository.signin(auth: event.auth);
      if (response.isSuccess) {
        return AuthSuccess(response);
      } else {
        return AuthError(response.message);
      }
    } catch (e) {
      return AuthError(e.toString());
    }
  }

  // void close() async {
  //   await _inputController.close();
  //   await _outputController.close();
  // }
}
