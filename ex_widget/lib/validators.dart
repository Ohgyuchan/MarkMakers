/*
  https://github.com/fkkmemi/ff2/blob/master/lib/methods/validators.dart
*/
String emailValidator(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return '이메일을 입력해주세요.';
  } else {
    return null;
  }
}

String passwordValidator(String value) {
  if (value.length < 8) {
    return '비밀번호는 8자리 이상이어야 합니다.';
  } else {
    return null;
  }
}