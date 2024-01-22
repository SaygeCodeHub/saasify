bool isEmailValid(String email) {
  return email.contains('@') && email.contains('.');
}

bool isPasswordValid(String password) {
  return password.length >= 6;
}

bool isPhoneNumberValid(String phoneNumber) {
  return phoneNumber.length == 10;
}
