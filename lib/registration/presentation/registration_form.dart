import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_laporty/registration/cubit/registration_cubit.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return BlocProvider(
      create: (_) => RegistrationCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('User Registration')),
        body: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: const OutlineInputBorder(),
                      errorText: state.isValidEmail ? null : 'Invalid email',
                    ),
                    onChanged: (value) =>
                        context.read<RegistrationCubit>().validateEmail(value),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      errorText: state.isStrongPassword
                          ? null
                          : 'Weak password',
                    ),
                    onChanged: (value) => context
                        .read<RegistrationCubit>()
                        .validatePassword(value),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<RegistrationCubit>().submitForm(
                        emailController.text,
                        passController.text,
                      );
                      final submitted = context
                          .read<RegistrationCubit>()
                          .state
                          .isSubmitted;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            submitted
                                ? '✅ Registration Successful'
                                : '⚠️ Please fix errors before submitting',
                          ),
                        ),
                      );
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
