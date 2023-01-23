mixin ValidationsMixin {
  String? isNotEmpty(String? value, {String? message}) {
    if (value!.isEmpty) return message ?? 'Este campo é obrigatório';
    return null;
  }

  String? isValidEmail(String? email, {String? message}) {
    final bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email!);

    if(!emailValid) return message ?? 'Email inválido';
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (var func in validators) {
      final validation = func();
      if(validation != null) return validation;
    }
    return null;
  }
}
