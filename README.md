# Lensfolio Mobile App

A Flutter mobile application built with clean architecture, layer-first structure, and best practices.

## 📋 Table of Contents

- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Architecture](#architecture)
- [State Management](#state-management)
- [Code Generation](#code-generation)
- [Contributing](#contributing)

---

## 🗂️ Project Structure

This project uses a **layer-first architecture** where code is organized by technical layer rather than by feature:

```
lib/
├── blocs/                # All Cubits (state management)
│   ├── user/
│   │   ├── cubit.dart
│   │   └── state.dart
│   └── jobs/
│       ├── cubit.dart
│       └── state.dart
│
├── repos/                # All Repositories (data layer)
│   ├── user/
│   │   ├── user_repo.dart
│   │   ├── user_data_provider.dart
│   │   ├── user_mocks.dart
│   │   └── user_parser.dart
│   └── jobs/
│       └── ...
│
├── models/               # All Data Models
│   ├── user/
│   │   ├── user_data.dart
│   │   ├── user_data.freezed.dart
│   │   └── user_data.g.dart
│   └── job/
│       └── ...
│
├── ui/                   # All UI (screens and widgets)
│   ├── screens/
│   │   ├── splash/
│   │   │   ├── splash.dart
│   │   │   └── _state.dart
│   │   ├── login/
│   │   │   ├── login.dart
│   │   │   ├── _state.dart
│   │   │   └── widgets/
│   │   │       └── ...
│   │   └── home/
│   │       └── ...
│   └── widgets/          # Shared widgets across the app
│       ├── buttons/
│       ├── cards/
│       └── ...
│
├── services/             # App-wide services (Singleton pattern)
│   ├── app_log.dart
│   ├── fault/
│   ├── firebase/
│   ├── flavor/
│   └── route_logger/
│
├── configs/              # Configuration files
│   ├── theme/
│   ├── extension/
│   ├── bloc/
│   ├── space/
│   └── ui/
│
├── providers/            # Global providers
│   └── app.dart
│
├── router/               # Navigation
│   ├── router.dart
│   └── routes.dart
│
├── helpers/              # Helper functions and utilities
│
└── main.dart
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.38.2 or higher)
- Dart SDK (3.10.0 or higher)
- Node.js (for Hygen code generation)
- CocoaPods (for iOS development)

### Installation

1. **Clone the repository:**
```bash
git clone <repository-url>
cd lensfolio_mobile_app
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Install Hygen globally** (for code generation):
```bash
npm install -g hygen
```

4. **Run the app:**

**Option 1: From VS Code/Cursor**
- Open Debug panel (Cmd/Ctrl + Shift + D)
- Select your desired configuration
- Click Run

**Option 2: From Terminal**
```bash
flutter run
```

---

## 🏗️ Architecture

This project follows a **modified MVVM architecture** with layer-first organization.

For detailed architecture documentation, see [Architecture.md](Architecture.md)

**Quick Overview:**
- **Layer-First Structure**: Code organized by technical layer (blocs, repos, models, ui)
- **Single Source of Truth**: Cubit holds all app-level state
- **Two-Layer State**: Cubit (app-level) + Provider (ephemeral UI)
- **Unidirectional Data Flow**: View → ViewModel → Model → ViewModel → View
- **Clean Separation**: UI, Business Logic, Data layers are clearly separated

---

## 🎯 State Management

### Two-Layer State Management

This project uses a hybrid approach:
- **Cubit** for app-level state and business logic
- **Provider** for ephemeral UI state

### Cubit (App Layer - Business Logic)

**Used for**: App-level state and business logic

- Located in `lib/blocs/{cubit_name}/`
- All external dependencies, API calls, and business logic
- Uses Cubit pattern with direct method calls (no events)
- **Inline state emissions** (no separate emitter methods)
- Service locator pattern: `Cubit.c(context)` for easy access

**Structure:**
```
lib/blocs/user/
├── cubit.dart           # User cubit with inline emissions
└── state.dart           # User state (for nested cubits)
```

**Example - Nested Cubit:**
```dart
// lib/blocs/user/cubit.dart
class UserCubit extends Cubit<UserState> {
  static UserCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<UserCubit>(context, listen: listen);

  UserCubit() : super(UserState.def());

  Future<void> login() async {
    emit(
      state.copyWith(
        login: state.login.toLoading(),
      ),
    );
    try {
      final data = await UserRepo.ins.login();
      emit(
        state.copyWith(
          login: state.login.toSuccess(data: data),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          login: state.login.toFailed(fault: e),
        ),
      );
    }
  }

  void reset() => emit(UserState.def());
}
```

**BlocState Shorthands:**
```dart
state.toLoading()              // Loading state
state.toSuccess(data: data)    // Success with data
state.toFailed(fault: e)       // Failed with fault
state.toInit({meta})           // Initialization state
state.toPreparing({meta})      // Preparing state
state.toCancelled()            // Cancelled state
```

**Usage in UI:**
```dart
// Call cubit methods (read)
UserCubit.c(context).login();

// Watch cubit state (reactive)
final state = UserCubit.c(context, true).state;

// BlocBuilder
BlocBuilder<UserCubit, UserState>(
  builder: (context, state) {
    return state.login.when(
      loading: () => CircularProgressIndicator(),
      success: () => Text('Logged in!'),
      failed: () => ErrorView(fault: state.login.fault),
    );
  },
)
```

### Provider (UI Layer - Ephemeral State)

**Used for**: Ephemeral (screen-specific) state

- Located in `lib/ui/screens/{screen_name}/_state.dart`
- Screen-level state management only
- Extends `ChangeNotifier`
- **Do not** use for business logic, API calls, or Firebase
- Use Provider to **invoke Cubits** for data operations

**Example:**
```dart
// lib/ui/screens/login/_state.dart
class _LoginState extends ChangeNotifier {
  bool _isPasswordVisible = false;
  
  bool get isPasswordVisible => _isPasswordVisible;
  
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
  
  // Invoke cubit for business logic
  void login(BuildContext context) {
    UserCubit.c(context).login();
  }
}
```

**Usage in Screen:**
```dart
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _LoginState(),
      child: Consumer<_LoginState>(
        builder: (context, state, _) {
          return TextField(
            obscureText: !state.isPasswordVisible,
            // ...
          );
        },
      ),
    );
  }
}
```

### When to Use What?

| Use Case | Use | Example |
|----------|-----|---------|
| API calls | **Cubit** | Fetch user data |
| Firebase operations | **Cubit** | Upload to Firestore |
| App-wide state | **Cubit** | User authentication |
| Business logic | **Cubit** | Data transformation |
| Screen visibility toggle | **Provider** | Show/hide password |
| Form field state | **Provider** | Text field focus |
| Local UI animation | **Provider** | Expand/collapse panel |

---

## ⚡ Code Generation

This project uses **Hygen** for boilerplate code generation. Templates are located in `_templates/`.

### Detailed Documentation

For comprehensive guides, see:
- [Cubit Nested Template](_templates/cubit/nested/README.md) - Complex cubits with multiple operations
- [Cubit Simple Template](_templates/cubit/simple/README.md) - Simple cubits for basic operations
- [Cubit Update Template](_templates/cubit/update/README.md) - Update existing cubits with new operations
- [Screen Template](_templates/screen/README.md) - Screen generation guide

### Available Templates

#### 1. Cubit Nested (Complex State)

Creates a cubit with nested states for multiple operations.

```bash
hygen cubit nested <cubit_name>
```

**What Gets Generated:**
- Cubit in `lib/blocs/{cubit_name}/`
  - `cubit.dart` - Main cubit with inline emissions
  - `state.dart` - State class for nested operations
- Repository in `lib/repos/{cubit_name}/`
  - `{cubit_name}_repo.dart` - Main repository class
  - `{cubit_name}_data_provider.dart` - API/Firebase calls
  - `{cubit_name}_mocks.dart` - Mock data
  - `{cubit_name}_parser.dart` - Data parsing
- Auto-imports and initializes in `lib/app.dart`


#### 2. Cubit Simple (Simple State)

Creates a lightweight cubit for simple operations.

```bash
hygen cubit simple <cubit_name>
```

**What Gets Generated:**
- Simple cubit in `lib/blocs/{cubit_name}/cubit.dart`
- Repository in `lib/repos/{cubit_name}/`
- Auto-imports and initializes in `lib/app.dart`


#### 3. Cubit Update

Updates an existing cubit with new operations.

```bash
hygen cubit update <existing_cubit_name>
```

**What It Does:**
- Adds new operations to existing cubit
- Updates state class
- Updates repository
- Adds new methods to parser and mocks


#### 4. Screen Generator

Generates new screens with state management.

```bash
hygen screen new <screen_name>
```

**What Gets Generated:**
- Screen file: `lib/ui/screens/{screen_name}/{screen_name}.dart`
- State file: `lib/ui/screens/{screen_name}/_state.dart`
- Optional widgets folder

**Example:**
```bash
hygen screen new profile
```

#### 5. Provider Generator

Generates new providers.

```bash
hygen provider new <provider_name>
```

**What Gets Generated:**
- Provider file in `lib/providers/{provider_name}.dart`

### Code Generation Best Practices

1. **Always use Hygen** for creating cubits, screens, and providers
2. **Follow naming conventions**: lowercase_with_underscores
3. **Use nested cubit** for complex state with multiple operations
4. **Use simple cubit** for basic fetch/reset operations
5. **Check `lib/app.dart`** after generation to ensure proper injection

### Freezed Code Generation

For models, run build_runner:

```bash
# One-time generation
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (during development)
flutter pub run build_runner watch --delete-conflicting-outputs
```

---

## 🤝 Contributing

For development workflow, coding conventions, and contribution guidelines, see [CONTRIBUTING.md](CONTRIBUTING.md)

---
