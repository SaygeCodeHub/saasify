bool isEmailValid(String email) {
  return email.contains('@') && email.contains('.');
}

bool isPasswordValid(String password) {
  return true;
}

bool isPhoneNumberValid(String phoneNumber) {
  return phoneNumber.length == 10;
}
