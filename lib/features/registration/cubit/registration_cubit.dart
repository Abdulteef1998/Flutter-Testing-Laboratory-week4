import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/validators.dart';

class RegistrationState {
  final bool isValidEmail;
  final bool isStrongPassword;
  final bool isSubmitted;

  RegistrationState({
    this.isValidEmail = true,
    this.isStrongPassword = true,
    this.isSubmitted = false,
  });

  RegistrationState copyWith({
    bool? isValidEmail,
    bool? isStrongPassword,
    bool? isSubmitted,
  }) {
    return RegistrationState(
      isValidEmail: isValidEmail ?? this.isValidEmail,
      isStrongPassword: isStrongPassword ?? this.isStrongPassword,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationState());

  void validateEmail(String email) {
    emit(state.copyWith(isValidEmail: Validators.isValidEmail(email)));
  }

  void validatePassword(String password) {
    emit(
      state.copyWith(isStrongPassword: Validators.isStrongPassword(password)),
    );
  }

  void submitForm(String email, String password) {
    final isEmailValid = Validators.isValidEmail(email);
    final isPasswordStrong = Validators.isStrongPassword(password);
    emit(
      state.copyWith(
        isValidEmail: isEmailValid,
        isStrongPassword: isPasswordStrong,
        isSubmitted: isEmailValid && isPasswordStrong,
      ),
    );
  }
}
