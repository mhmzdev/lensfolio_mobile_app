# Cubit Update Template - Layer-First Architecture

## Overview
This template **updates existing cubits** with new methods and functionality. It injects code into pre-existing cubit files without creating new ones.

**Important**: The cubit must already exist! This template only adds new functionality to existing cubits.

## Migration from Event/Bloc to Cubit
This template uses the **Cubit pattern** with direct method calls instead of events. No event classes are created or updated.

## Usage

Run the following command with the name of an **existing** cubit:
```bash
hygen cubit update <existing_cubit_name>
```

You'll be prompted with:

### New Modules to Add
```
? Write args in module:model in comma separated values
```

Format: `module:Model`

Example: `delete:UserData,archive:UserData`

## What Gets Updated

The template injects code into these existing files:

### Cubit Files
- `cubit.dart` - Adds new methods with inline state emissions (no events!)
- `state.dart` - Updates state with new properties and methods

### Repo Files
- `{cubit_name}_repo.dart` - Adds new repository methods
- `{cubit_name}_data_provider.dart` - Adds new data provider methods
- `{cubit_name}_mocks.dart` - Adds new mock data methods
- `{cubit_name}_parser.dart` - Adds new parser methods

## Injection Points

The template uses specific markers/patterns to inject code:

### In cubit.dart
- **Before**: `Future<void>` - Adds new cubit methods with inline emission methods
- No constructor updates needed (cubits don't have event registrations)

### In state.dart
- **After**: `// --- nested states --- //` - Adds new state properties
- **After**: `const {CubitName}State` - Adds constructor parameters
- **After**: `root-def-constructor` - Adds default constructor values
- **After**: `{CubitName}State copyWith` - Adds copyWith parameters
- **After**: `return {CubitName}State` - Adds copyWith return values
- **After**: `root-state-props` - Adds equatable properties

### In repo files
- **After**: `/// --- repo functions --- ///` - Adds new repo methods
- **After**: `_{CubitName}Provider` - Adds provider methods
- **After**: `_{CubitName}Mocks` - Adds mock methods
- **After**: `_{CubitName}Parser` - Adds parser methods

## Key Differences from Old Bloc Update

### Before (Bloc with Events)
Added event handlers and event classes:
```dart
// In events.dart - added new event class
class UserDeleteEvent extends UserEvent {}

// In bloc.dart - added event handler registration
on<UserDeleteEvent>(_onDelete);

// In bloc.dart - added handler method
Future<void> _onDelete(UserDeleteEvent event, Emitter<UserState> emit) {
  // ...
}
```

### After (Cubit with Methods)
Only adds methods with inline emissions, no events:
```dart
// In cubit.dart - directly adds method
Future<void> delete() async {
  _deleteLoading();
  try {
    final data = await UserRepo.ins.delete();
    _deleteSuccess(data);
  } catch (e, st) {
    _deleteFailed(e);
  }
}

// Inline emission methods
void _deleteLoading({dynamic meta}) {
  emit(
    state.copyWith(
      delete: state.delete.toLoading(meta: meta),
    ),
  );
}

void _deleteSuccess(UserData data, {dynamic meta}) {
  emit(
    state.copyWith(
      delete: state.delete.toSuccess(data: data, meta: meta),
    ),
  );
}

void _deleteFailed(Fault e, {dynamic meta}) {
  emit(
    state.copyWith(
      delete: state.delete.toFailed(fault: e, meta: meta),
    ),
  );
}
```

## Inline State Emissions with BlocState Shorthands

The template generates state emission methods inline within the cubit using `BlocState` shorthand methods:

```dart
/// Emit loading state for delete
void _deleteLoading({dynamic meta}) => emit(state.copyWith(
  delete: state.delete.toLoading(meta: meta)
));

/// Emit success state for delete
void _deleteSuccess(UserData data, {dynamic meta}) => emit(state.copyWith(
  delete: state.delete.toSuccess(data: data, meta: meta)
));

/// Emit failed state for delete
void _deleteFailed(Fault e, {dynamic meta}) => emit(state.copyWith(
  delete: state.delete.toFailed(fault: e, meta: meta)
));
```

## Available Shorthand Methods from BlocState

All nested states can use these methods:

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

## Prerequisites

1. **Cubit must exist** - Created via `hygen cubit nested`
2. **Models must exist** in `lib/models/`
3. **Injection markers** must be present in the cubit files (automatically added by `nested` template)

## Example Workflows

### Updating a Cubit
```bash
$ hygen cubit update notification

? Write args in module:model in comma separated values
  delete:NotificationData,archive:NotificationData
```

This updates:
- `lib/blocs/notification/` - All cubit files
- `lib/repos/notification/` - All repo files

**Usage in UI**:
```dart
// Call new methods
NotificationCubit.c(context).delete(notificationId);
NotificationCubit.c(context).archive(notificationId);
```

### Real-World Example: Adding Delete Functionality

**Scenario**: You have a `user` cubit that can fetch and update users. Now you want to add delete functionality.

```bash
$ hygen cubit update user

? Write args in module:model in comma separated values: delete:UserData
```

**Result**: The template injects:
1. `delete()` method in `cubit.dart`
2. `_deleteLoading()`, `_deleteSuccess()`, `_deleteFailed()` inline emission methods in `cubit.dart`
3. `delete` property in `UserState`
4. `delete()` method in `UserRepo`
5. Provider, mock, and parser methods for delete

**Usage in UI**:
```dart
// Delete a user
UserCubit.c(context).delete(userId);

// Watch delete state
BlocBuilder<UserCubit, UserState>(
  builder: (context, state) {
    return state.delete.when(
      loading: () => CircularProgressIndicator(),
      success: () => SuccessMessage('User deleted!'),
      failed: () => ErrorMessage(state.delete.errorMessage),
    );
  },
)
```

## Notes

1. **Must use existing cubit name**: The cubit directory must exist in `lib/blocs/`
2. **Models must exist**: Create models in `lib/models/` before updating
3. **Markers are required**: Original cubit must be created with `hygen cubit nested`
4. **Code is injected**: Won't overwrite existing code, only adds new code
5. **Auto-formatted**: Runs `dart format` after injection

## Comparison with `cubit nested`

| Template | Purpose | Requires Existing Cubit |
|----------|---------|----------------------|
| `cubit nested` | **Creates** new cubit with initial functionality | ❌ No |
| `cubit update` | **Updates** existing cubit with new functionality | ✅ Yes |

## Service Locator Usage

All cubits use the service locator pattern for access:

```dart
// Call cubit methods (read)
UserCubit.c(context).delete(userId);

// Watch cubit state (reactive)
final state = UserCubit.c(context, true).state;
```

**Don't use** `context.read` or `context.watch` directly - always use the service locator!

## Tips

✅ **DO**:
- Use on existing cubits to add new functionality
- Verify cubit exists in `lib/blocs/` before running
- Use meaningful method names (delete, update, archive, etc.)
- Add models before running the template
- Use PascalCase for model names
- Use the service locator pattern for cubit access

❌ **DON'T**:
- Try to create new cubits with this template (use `cubit nested` instead)
- Update cubits without verifying injection markers exist
- Use this on manually created cubits (they may lack markers)
- Rename methods that already exist (will create duplicates)
- Use `context.read` or `context.watch` directly

## Troubleshooting

**Problem**: "Could not find injection point"
- **Solution**: Ensure the cubit was created with `hygen cubit nested` or has the required markers

**Problem**: Code not injected
- **Solution**: Check that injection markers exist in the target files

**Problem**: Duplicate code
- **Solution**: The method name already exists; choose a different name or manually update

**Problem**: Path not found
- **Solution**: Verify the cubit exists in `lib/blocs/{cubit_name}/`

## Example of Generated Methods

When you add a `delete:UserData` module, this gets injected into `cubit.dart`:

```dart
Future<void> delete() async {
  _deleteLoading();
  try {
    final data = await UserRepo.ins.delete();
    _deleteSuccess(data);
  } on Fault catch (e) {
    _deleteFailed(e);
  }
}

void _deleteLoading({dynamic meta}) {
  emit(
    state.copyWith(
      delete: state.delete.toLoading(meta: meta),
    ),
  );
}

void _deleteSuccess(UserData data, {dynamic meta}) {
  emit(
    state.copyWith(
      delete: state.delete.toSuccess(data: data, meta: meta),
    ),
  );
}

void _deleteFailed(Fault e, {dynamic meta}) {
  emit(
    state.copyWith(
      delete: state.delete.toFailed(fault: e, meta: meta),
    ),
  );
}
```

These methods use the `toLoading()`, `toSuccess()`, and `toFailed()` shorthand methods from `BlocState` instead of manual `copyWith` calls!
