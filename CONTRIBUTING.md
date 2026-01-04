# Contributing to Lensfolio Mobile App

Thank you for your interest in contributing! This guide will help you understand our development workflow and coding conventions.

## 📋 Table of Contents

- [Development Workflow](#development-workflow)
- [Coding Conventions](#coding-conventions)
- [Native Code](#native-code)

---

## 🛠️ Development Workflow

### Common Commands

**Get dependencies:**
```bash
flutter pub get
```

**Clean build:**
```bash
flutter clean
flutter pub get
```

**Run code generation (Freezed, JSON serialization):**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**Watch for changes (development):**
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Context Management

This project maintains context files to track development history:

- Create context files in `context/` directory
- Name them as `FEATURE_NAME_CONTEXT.md` or `BUG_FIX_NAME_CONTEXT.md`
- Document what tasks were completed or bugs were resolved
- Review existing context files before working on related features

**Example:**
```
context/
├── AUTH_FEATURE_CONTEXT.md
├── USER_PROFILE_BUG_FIX_CONTEXT.md
└── HOME_SCREEN_CONTEXT.md
```

---

## 📝 Coding Conventions

### File Naming

- **Screens**: `{screen_name}.dart` (e.g., `login.dart`, `home.dart`)
- **Widgets**: `_{widget_name}.dart` (e.g., `_body.dart`, `_header.dart`)
- **State**: `_state.dart`
- **Models**: `{model_name}.dart` (e.g., `user_data.dart`)
- **Cubits**: `cubit.dart`, `state.dart` (for nested)
- **Repos**: `{repo_name}_repo.dart`

### Code Style

1. **Private Widget Classes Over Functions**
   ```dart
   // ❌ Bad
   Widget _buildHeader() => Container(...);
   
   // ✅ Good
   class _Header extends StatelessWidget {
     @override
     Widget build(BuildContext context) => Container(...);
   }
   ```

2. **Use Getters for Simple Returns**
   ```dart
   // ❌ Bad
   bool isLoggedIn() => user != null;
   
   // ✅ Good
   bool get isLoggedIn => user != null;
   ```

3. **Arrow Syntax for Simple Functions**
   ```dart
   // ✅ Good
   String get fullName => '$firstName $lastName';
   ```

4. **Trailing Commas**
   ```dart
   // ✅ Good - improves formatting
   Widget build(BuildContext context) {
     return Container(
       child: Text('Hello'),
     );
   }
   ```

5. **File Size Limits**
   - UI files should not exceed **200-250 lines**
   - Break large files using `part` / `part of`
   - Keep logic in `_state.dart` or separate files
   - No single function should exceed **30-50 lines**

6. **Documentation Comments**
   - Use `///` for function documentation
   - Focus on **"why"**, not "how"
   ```dart
   /// Refreshes user data after profile update to sync UI
   Future<void> refreshUserData() async {
     // ...
   }
   ```

7. **Logging**
   - Use `.appLog()` extension instead of `print()` or `log()`
   ```dart
   'User logged in successfully'.appLog(tag: 'AUTH');
   ```

8. **Forms with Text Fields**
   - Pass `keyboardHandler: true` in `Screen` widget
   - Use `flutter_form_builder` for forms
   - Store form keys in `static/_form_keys.dart`
   - Store form data in `static/_form_data.dart`

### Key Principles

1. **Layer-First**: Organize by technical layer, not feature
2. **Inline Emissions**: State emissions happen directly in cubit methods
3. **No Events**: Use Cubit pattern with direct method calls
4. **Service Locator**: Access cubits via `Cubit.c(context)` pattern
5. **Singleton Services**: All services and repos use singleton pattern
6. **Freezed Models**: All data models use freezed
7. **Private Widgets**: Use private widget classes, not functions

---

## 🔧 Native Code

Some features are implemented in native code:

- **Kotlin** (Android): Free to edit files directly
- **Swift** (iOS): Don't edit directly (Xcode doesn't support external edits)
  - Create `fileName_XCODE.swift` with changes
  - Copy-paste into Xcode manually

---

## 📚 Additional Resources

- **Flutter Documentation**: https://flutter.dev/docs
- **Bloc/Cubit Guide**: https://bloclibrary.dev
- **Freezed Package**: https://pub.dev/packages/freezed
- **Provider Package**: https://pub.dev/packages/provider

---

**Thank you for contributing! 🎉**

