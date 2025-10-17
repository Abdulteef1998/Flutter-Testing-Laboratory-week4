class Validators {
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isStrongPassword(String password) {
    // لازم يحتوي على: حرف كبير + حرف صغير + رقم + رمز + 8 أحرف على الأقل
    final passRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$',
    );
    return passRegex.hasMatch(password);
  }
}
