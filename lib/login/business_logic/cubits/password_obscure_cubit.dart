import 'package:bloc/bloc.dart';

class PasswordObscureCubit extends Cubit<bool> {
  PasswordObscureCubit() : super(true);

  void toggle() => emit(!state);
}