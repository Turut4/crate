# Crate 📦

A fast and efficient inventory management mobile application built with Flutter and [Isar Database](https://isar.dev/). 

## Features
- **Local Storage:** Lightning-fast local data persistence using Isar.
- **Product Management:** Add, edit, and view products in your inventory.
- **Stock Tracking:** Easily update product quantities and manage stock levels.

## Tech Stack
- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** Dart
- **Database:** Isar Database
- **State Management:** Provider

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Compatible IDE (VS Code, Android Studio, IntelliJ, etc.)

### Installation

1. Clone the repository
```bash
git clone https://github.com/Turut4/crate.git
```

2. Navigate to the project directory
```bash
cd crate
```

3. Install dependencies
```bash
flutter pub get
```

4. Run code generation for Isar models
```bash
dart run build_runner build --delete-conflicting-outputs
```

5. Run the app
```bash
flutter run
```
