import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_laporty/features/registration/cubit/registration_cubit.dart';
import 'package:flutter_test_laporty/features/registration/presentation/registration_form.dart';

void main() {
  testWidgets('Registration form shows errors on empty submission', (
    tester,
  ) async {
    // 1️⃣ شغل الـWidget مع BlocProvider
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => RegistrationCubit(),
          child: const RegistrationForm(),
        ),
      ),
    );

    // 2️⃣ اضغط على زر التسجيل
    await tester.tap(find.byType(ElevatedButton));

    // 3️⃣ حدث الـWidget بعد emit الحالة
    await tester.pump();

    // 4️⃣ أعط Bloc وقت لتحديث الحالة وإظهار رسائل الخطأ
    await tester.pump(const Duration(seconds: 1));

    // 5️⃣ تحقق من ظهور رسائل الخطأ
    expect(find.text('Invalid email'), findsOneWidget);
    expect(find.text('Weak password'), findsOneWidget);
  });
}
