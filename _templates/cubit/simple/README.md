# Cubit Simple Template - Layer-First Architecture

## Overview
This template generates a **simple cubit structure** without nested states. Perfect for straightforward data fetching scenarios where you don't need complex state management with multiple sub-states.

**Use this when**: You have a single data model and simple fetch/reset operations.

## Migration from Event/Bloc to Cubit
This template uses the **Cubit pattern** instead of the traditional Bloc with events. This reduces boilerplate by eliminating event classes and using direct method calls instead.

## Usage

Run the following command:
```bash
hygen cubit simple <cubit_name>
```

You'll be prompted with:

### Model Name
```
? Write consumable model name
```

The name of the model this cubit will work with (e.g., `UserData`, `NotificationData`, `ProfileData`)

**Important**: Use **PascalCase** for model names (e.g., `UserData`, not `user_data`)

## Generated Structure

### Example: `settings` cubit
```
lib/
├── blocs/
│   └── settings/
│       └── cubit.dart    # Main cubit with fetch/reset and inline emissions (no events!)
└── repos/
    └── settings/
        ├── settings_repo.dart
        ├── settings_data_provider.dart
        ├── settings_mocks.dart
        └── settings_parser.dart
```

## Generated Code Features

### State Management
Uses `BlocState<Model>` directly (no nested states):
```dart
class SettingsCubit extends Cubit<BlocState<SettingsData>> {
  // ...
}
```

### Built-in Methods
- `fetch()`: Handles data fetching with loading/success/error states (inline emissions)
- `reset()`: Resets cubit to initial state

### No Events!
Call methods directly instead of dispatching events:
```dart
// ✅ Cubit pattern
SettingsCubit.c(context).fetch();
SettingsCubit.c(context).reset();

// ❌ Old Bloc pattern (don't do this)
context.read<SettingsBloc>().add(SettingsFetchEvent());
```

## Cubit Pattern Benefits

### Direct Method Calls with Inline Emissions
```dart
// Fetch data
Future<void> fetch() async {
  emit(state.toLoading());
  try {
    final data = await SettingsRepo.ins.fetch();
    emit(state.toSuccess(data: data));
  } on Fault catch (e) {
    emit(state.toFailed(fault: e));
  }
}

// Reset state
void reset() => emit(const BlocState<SettingsData>());
```

### Service Locator Pattern
Each cubit includes a static `c()` method:
```dart
/// Access the cubit instance
/// 
/// [context] - BuildContext
/// [listen] - If true, widget rebuilds on state changes (default: false)
static SettingsCubit c(BuildContext context, [bool listen = false]) {
  return listen
      ? context.watch<SettingsCubit>()
      : context.read<SettingsCubit>();
}
```

**Usage**:
- **Read** (one-time): `SettingsCubit.c(context).fetch()`
- **Watch** (reactive): `SettingsCubit.c(context, true).state`

### Inline State Emissions with BlocState Shorthands
State emissions happen directly in methods using `BlocState` shorthand methods:
```dart
Future<void> fetch() async {
  emit(state.toLoading());
  try {
    final data = await SettingsRepo.ins.fetch();
    emit(state.toSuccess(data: data));
  } on Fault catch (e) {
    emit(state.toFailed(fault: e));
  }
}
```

## Available Shorthand Methods from BlocState

```dart
// State transitions
.toDefault()              // Reset to default
.toInit({meta})          // Initialization state
.toPreparing({meta})     // Preparing state
.toLoading({meta})       // Loading state
.toSuccess({data, meta}) // Success with data
.toFailed({fault, meta}) // Failed with fault
.toCancelled()           // Cancelled state
```

## Model Requirements

**Before running the template**, create your model using `freezed`:

```dart
// lib/models/settings_data.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_data.freezed.dart';
part 'settings_data.g.dart';

@freezed
class SettingsData with _$SettingsData {
  const factory SettingsData({
    required bool darkMode,
    required bool notifications,
  }) = _SettingsData;

  factory SettingsData.fromJson(Map<String, dynamic> json) => 
    _$SettingsDataFromJson(json);
}
```

## Post-Generation Steps

1. **Auto-injected to app.dart**: The template automatically adds the cubit to `app.dart`

2. **Run build_runner** (if models need generation):
```bash
dart run build_runner build --delete-conflicting-outputs
```

3. **Implement data provider logic**:
```dart
// In {cubit_name}_data_provider.dart
static Future<SettingsData> fetch() async {
  try {
    // Replace with actual API call
    final response = await FirebaseFirestore.instance
      .collection('settings')
      .doc('user_id')
      .get();
    
    return SettingsData.fromJson(response.data()!);
  } catch (e, st) {
    if (e is FirebaseException) {
      throw FirebaseFault.fromFirebase(e, st);
    }
    if (e is DioException) {
      throw HttpFault.fromDioException(e, st);
    }
    throw UnknownFault('Something went wrong!', st);
  }
}
```

## Usage in UI

### Fetching Data
```dart
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Trigger fetch
    SettingsCubit.c(context).fetch();
    
    return BlocBuilder<SettingsCubit, BlocState<SettingsData>>(
      builder: (context, state) {
        return state.when(
          loading: () => CircularProgressIndicator(),
          success: () => SettingsView(data: state.data!),
          failed: () => ErrorView(message: state.fault?.message),
        );
      },
    );
  }
}
```

### Resetting State
```dart
// Reset to initial state
SettingsCubit.c(context).reset();
```

## Example Workflows

### Creating a Simple Cubit
```bash
$ hygen cubit simple theme

? Write consumable model name: ThemeData
```

This creates:
- Cubit in `lib/blocs/theme/`
- Repo in `lib/repos/theme/`
- Imports model from `lib/models/theme_data.dart`
- Auto-injects into `app.dart`

### Creating Another Simple Cubit
```bash
$ hygen cubit simple statistics

? Write consumable model name: RallyStatistics
```

This creates:
- Cubit in `lib/blocs/statistics/`
- Repo in `lib/repos/statistics/`
- Imports model from `lib/models/rally_statistics.dart`
- Auto-injects into `app.dart`

## When to Use Simple vs Nested

### Use **Simple** Cubit When:
✅ Single data model
✅ Simple fetch and reset operations
✅ No complex sub-states needed
✅ Straightforward loading/success/error handling

**Examples**: Settings, Profile, Theme, Statistics, Leaderboard

### Use **Nested** Cubit When:
✅ Multiple related operations on different models
✅ Complex state with multiple sub-states
✅ Need to track multiple operations independently
✅ Rich state management requirements

**Examples**: User (fetch, update, delete), Rally (list, create, update), Notifications (fetch, markRead, delete)

## Comparison Table

| Feature | Simple Cubit | Nested Cubit |
|---------|-------------|-------------|
| State Structure | `BlocState<Model>` | Custom state with nested `BlocState`s |
| Number of Models | 1 | Multiple |
| Methods | Fetch, Reset | Multiple custom methods |
| Complexity | Low | Medium-High |
| Use Case | Simple data fetching | Complex operations |
| State File | ❌ Not needed | ✅ Required |
| Emissions | ✅ Inline | ✅ Inline |

## Key Differences from Old Bloc Pattern

### Before (Bloc with Events)
```dart
// Define events
class SettingsFetchEvent extends SettingsEvent {}
class SettingsResetEvent extends SettingsEvent {}

// Dispatch events
context.read<SettingsBloc>().add(SettingsFetchEvent());
context.read<SettingsBloc>().add(SettingsResetEvent());
```

### After (Cubit with Methods)
```dart
// Call methods directly
SettingsCubit.c(context).fetch();
SettingsCubit.c(context).reset();
```

## Example Generated Cubit

```dart
import 'dart:async';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/settings_data.dart';
import 'package:lensfolio_mobile_app/repos/settings/settings_repo.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<BlocState<SettingsData>> {
  static SettingsCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<SettingsCubit>(context, listen: listen);

  SettingsCubit() : super(const BlocState<SettingsData>());

  Future<void> fetch() async {
    emit(state.toLoading());
    try {
      final data = await SettingsRepo.ins.fetch();
      emit(state.toSuccess(data: data));
    } on Fault catch (e) {
      emit(state.toFailed(fault: e));
    }
  }

  void reset() => emit(const BlocState<SettingsData>());
}
```

## Notes

1. **Models must exist**: Create models with `freezed` in `lib/models/` before generating cubit
2. **Auto-formatted**: Runs `dart format` after generation
3. **Auto-injected**: Automatically added to `app.dart`
4. **Model names**: Use PascalCase (e.g., `UserData`, not `user_data`)
5. **Inline emissions**: No separate emitter file - all emissions happen directly in methods

## Tips

✅ **DO**:
- Use for simple data fetching scenarios
- Create model with `freezed` first
- Use PascalCase for model names
- Use descriptive cubit names (settings, profile, theme)
- Keep cubit logic simple
- Use service locator pattern

❌ **DON'T**:
- Use for complex multi-operation scenarios (use nested instead)
- Create without models
- Use snake_case for model names
- Add complex business logic (belongs in repo)
- Use `context.read` or `context.watch` directly (use service locator)

## Troubleshooting

**Problem**: Model import not found
- **Solution**: Ensure model exists at `lib/models/{model_name}.dart` and uses PascalCase

**Problem**: Build fails
- **Solution**: Run `dart run build_runner build --delete-conflicting-outputs`

**Problem**: Cubit not available in UI
- **Solution**: Check that it was auto-injected in `app.dart`

**Problem**: Path not found
- **Solution**: The template auto-creates directories; this shouldn't happen
