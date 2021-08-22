bool _requiredField(String? field) => field == null || field.isEmpty;

String? validateEmail(String? email) {
  if (_requiredField(email)) {
    return "Email address is required";
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(email!)) {
    return "Email address is invalid";
  }

  return null;
}

String? validatePassword(String? password) {
  if (_requiredField(password)) {
    return "Password is required";
  }

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(password!)) {
    return '''
        Password must at least 8 characters,
        include an Uppercase letter and symbol.
      ''';
  }

  return null;
}

String? validateUsername(String? username) {
  if (_requiredField(username)) {
    return "Username is required.";
  }
  return null;
}

String? validateName(String? name) {
  if (_requiredField(name)) {
    return "Name is required.";
  }
  return null;
}
