# Cubit Nested Template - Layer-First Architecture

## Overview
This template generates a nested cubit structure following **layer-first architecture** principles.

All cubits are created in `lib/blocs/` directory, repos in `lib/repos/`, and models in `lib/models/`.

## Migration from Event/Bloc to Cubit
This template uses the **Cubit pattern** instead of the traditional Bloc with events. This reduces boilerplate by eliminating event classes and using direct method calls instead.

## Usage

Run the following command:
```bash
hygen cubit nested [name]
```

You'll be prompted with:

### Nested Modules
```
? Write args in module:model in comma separated values
```

Format: `module:Model`

Example: `fetch:UserData,update:UserData,delete:UserData`

## Generated Structure

### Example: `user` cubit
```
lib/
├── blocs/
│   └── user/
│       ├── cubit.dart      # Main cubit with methods and state emissions (no events!)
│       └── state.dart      # Nested state structure
└── repos/
    └── user/
        ├── user_repo.dart
        ├── user_data_provider.dart
        ├── user_mocks.dart
        └── user_parser.dart
```

## Cubit Pattern Benefits

### No Events Needed
Instead of creating and dispatching events:
```dart
// ❌ Old Bloc pattern
context.read<UserBloc>().add(UserFetchEvent());
context.read<UserBloc>().add(UserUpdateEvent(data));
```

Call methods directly:
```dart
// ✅ New Cubit pattern
UserCubit.c(context).fetch();
UserCubit.c(context).update(data);
```

### Inline State Emissions with BlocState Shorthands
State emissions are handled directly in cubit methods using `BlocState` shorthand methods from `pine_configs`:
```dart
void _fetchLoading({dynamic meta}) {
  emit(
    state.copyWith(
      fetch: state.fetch.toLoading(meta: meta),
    ),
  );
}

void _fetchSuccess(UserData data, {dynamic meta}) {
  emit(
    state.copyWith(
      fetch: state.fetch.toSuccess(data: data, meta: meta),
    ),
  );
}
```

### Simpler Usage with Service Locator
Each cubit has a custom service locator:
```dart
// Read (one-time access)
UserCubit.c(context).fetch();

// Watch (rebuilds on changes)
final state = UserCubit.c(context, true).state;
```

## Service Locator Pattern

Every cubit includes a static `c()` method for accessing instances:

```dart
/// Access the cubit instance
/// 
/// [context] - BuildContext
/// [listen] - If true, widget rebuilds on state changes (default: false)
static UserCubit c(BuildContext context, [bool listen = false]) {
  return listen
      ? context.watch<UserCubit>()
      : context.read<UserCubit>();
}
```

**Usage**:
- **Read** (one-time): `UserCubit.c(context).methodName()`
- **Watch** (reactive): `UserCubit.c(context, true).state`

## Model Import Paths

Models are imported from:
```dart
import 'package:lensfolio_mobile_app/models/{model_name}.dart';
```

## Notes

1. **Models must exist** before running the app:
   - Create models using `freezed` in `lib/models/`
   - The template will generate imports pointing to these models

2. The template automatically:
   - Creates all cubit files (cubit, state)
   - Creates all repo files (repo, data_provider, mocks, parser)
   - Formats the generated code with `dart format`
   - Creates any missing directories in the path
   - Injects cubit into `lib/app.dart` automatically

3. **No manual import needed**: The template auto-injects the cubit into `app.dart`

## Key Differences from Old Bloc Pattern

### Before (Bloc with Events)
```dart
// Define event
class UserFetchEvent extends UserEvent {}

// Dispatch event
context.read<UserBloc>().add(UserFetchEvent());

// Handle event in bloc
on<UserFetchEvent>(_onFetch);

Future<void> _onFetch(UserFetchEvent event, Emitter<UserState> emit) async {
  emit(state.copyWith(fetch: state.fetch.copyWith(action: BlocAction.loading)));
  // ...
}
```

### After (Cubit with Methods)
```dart
// Call method directly
UserCubit.c(context).fetch();

// Handle in cubit
Future<void> fetch() async {
  _fetchLoading();  // Uses toLoading() shorthand
  // ...
}
```

## State Emission Pattern

State emissions are handled inline within cubit methods:

```dart
// Loading state
void _fetchLoading({dynamic meta}) {
  emit(
    state.copyWith(
      fetch: state.fetch.toLoading(meta: meta),
    ),
  );
}

// Success state
void _fetchSuccess(UserData data, {dynamic meta}) {
  emit(
    state.copyWith(
      fetch: state.fetch.toSuccess(data: data, meta: meta),
    ),
  );
}

// Failed state
void _fetchFailed(Fault e, {dynamic meta}) {
  emit(
    state.copyWith(
      fetch: state.fetch.toFailed(fault: e, meta: meta),
    ),
  );
}
```

## Available Shorthand Methods from BlocState

All nested states inherit these methods from `BlocState<T>`:

```dart
// State transitions
.toDefault()              // Reset to default
.toInit({meta})          // Initialization state with optional metadata
.toPreparing({meta})     // Preparing state with optional metadata
.toLoading({meta})       // Loading state with optional metadata
.toSuccess({data, meta}) // Success with data and optional metadata
.toFailed({fault, meta}) // Failed with fault and optional metadata
.toCancelled()           // Cancelled state
```

## Example Workflows

### Creating a Cubit
```bash
$ hygen cubit nested notification

? Write args in module:model in comma separated values
  fetch:NotificationData,markRead:NotificationData
```

This creates:
- Cubit in `lib/blocs/notification/`
- Repo in `lib/repos/notification/`
- Imports models from `lib/models/notification_data.dart`
- Auto-injects into `app.dart`

### Creating Another Cubit
```bash
$ hygen cubit nested profile

? Write args in module:model in comma separated values
  fetch:ProfileData,update:ProfileData
```

This creates:
- Cubit in `lib/blocs/profile/`
- Repo in `lib/repos/profile/`
- Imports models from `lib/models/profile_data.dart`
- Auto-injects into `app.dart`

## Using the Generated Cubit

### In UI (Calling Methods)
```dart
// Trigger fetch
UserCubit.c(context).fetch();

// Trigger update
UserCubit.c(context).update(newData);

// Trigger delete
UserCubit.c(context).delete(userId);
```

### In UI (Watching State)
```dart
BlocBuilder<UserCubit, UserState>(
  builder: (context, state) {
    return state.fetch.when(
      loading: () => CircularProgressIndicator(),
      success: () => UserView(data: state.fetch.data!),
      failed: () => ErrorView(message: state.fetch.errorMessage),
    );
  },
)
```

### Accessing Cubit State
```dart
// One-time read
final state = UserCubit.c(context).state;

// Reactive watch (rebuilds on changes)
final state = UserCubit.c(context, true).state;
```

## Tips

✅ **DO**:
- Use direct method calls instead of events
- Leverage `BlocState` shorthand methods in state emissions
- Use the service locator pattern (`Cubit.c(context)`)
- Use `meta` parameter when you need to pass additional contextual data
- Create models with `freezed` before generating cubits

❌ **DON'T**:
- Try to create events (they don't exist in cubits!)
- Use `context.read<>()` or `context.watch<>()` directly (use service locator)
- Forget to run `build_runner` for models
- Create without models
