bool isEmailValid(String email) {
  return email.contains('@') && email.contains('.');
}

bool isPhoneNumberValid(String phoneNumber) {
  return phoneNumber.length == 10;
}
