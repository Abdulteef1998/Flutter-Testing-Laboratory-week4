Flutter-Testing-Laboratory-Week4

A Flutter project built to demonstrate proper Git workflow, Clean Architecture, and comprehensive testing (unit + widget) across multiple broken widgets that were fixed and enhanced.

🎯 Mission Statement

You have joined a new Flutter team and inherited a codebase containing three broken widgets. Your task was to fix the issues, add missing tests, and apply a clean Git workflow to improve maintainability and reliability.

📦 What You’ll Work With

The repository contains three main feature modules:

🧩 Widget 1: User Registration Form

Issues found:

Weak email validation (accepts invalid values like "a@" or "@b")

Missing password strength validation

Form allowed invalid or empty submissions

No widget tests
Fixes implemented:

Added proper regex email validation

Implemented strong password rules (length, numbers, special characters)

Added form-level validation before submission

Added unit tests for validation logic

Added widget tests for form behavior and validation messages

🛒 Widget 2: Shopping Cart

Issues found:

Adding duplicate items created new entries instead of updating quantity

Discount calculation was incorrect

Total amount logic was wrong

No tests existed
Fixes implemented:

Fixed duplicate handling logic to update quantity

Corrected discount and total calculations

Added unit tests for add/remove/cart operations

Added edge-case widget tests (empty cart, 100% discount, quantity limits)

🌤 Widget 3: Weather Display

Issues found:

Missing +32 in Fahrenheit conversion formula

Crashed on null or incomplete API data

Broken loading/error state logic

No tests for error handling
Fixes implemented:

Fixed temperature conversion (C↔F)

Added null-safety and error handling

Fixed loading state management

Added unit and widget tests for conversions and error states

🧱 Architecture

This project follows Clean Architecture for scalability and maintainability.

lib/
├── core/
│   └── utils/                # Shared helpers and validators
├── features/
│   ├── registration/
│   ├── cart/
│   ├── weather/
│   └── ...
└── main.dart


Each feature contains:

data → Models, repositories

domain → Entities, usecases

presentation → UI, Cubits, Widgets

State management is handled via Cubit (flutter_bloc) for clear separation between UI and logic.

🧪 Testing

Included test types:

Unit tests for business logic and validation

Widget tests for UI interactions and visual feedback

Run all tests:

flutter test


Tests are stored under test/ and must end with _test.dart.

🌿 Git Workflow

Fork the repo and clone locally

Create a new develop branch from main

For each widget:

Create a feature branch:
feature/registration-fix
feature/cart-fix
feature/weather-fix

Fix bugs and add tests

Create a Pull Request (PR) into develop with:

Bug description

Solution explanation

Test coverage summary

Before/after screenshots

Merge PRs into develop

When all widgets are fixed and tested, merge develop → main

⚙️ Setup & Run
git clone https://github.com/Abdulteef1998/Flutter-Testing-Laboratory-week4.git
cd Flutter-Testing-Laboratory-week4
flutter pub get
flutter run


To run tests:

flutter test

🧰 Requirements

Flutter SDK (stable channel)

Dart 3.x or later

VS Code or Android Studio recommended

👨‍💻 Author

Abdulteef Rashid
GitHub: [github.com/Abdulteef1998](https://github.com/Abdulteef1998/Flutter-Testing-Laboratory-week4)
