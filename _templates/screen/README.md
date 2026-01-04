# Screen Templates - Layer-First Architecture

## Overview
Screen templates generate boilerplate code for creating new screens with proper structure, state management, and optional form handling.

## Available Templates

### 1. Screen New
Creates a complete new screen with state management, widgets, and optional form support.

### 2. Screen Consumer  
Adds a BlocConsumer listener to an existing screen (shows loading overlay + handles success/error).

### 3. Screen Listener
Adds a BlocListener to an existing screen (handles success/error without UI).

### 4. Screen Widget
Adds a new widget to an existing screen.

---

## 1. Screen New

Creates a complete screen structure with all necessary files.

### Usage

```bash
hygen screen new <screen_name>
```

### Prompts

#### 1. Form Data
```
? Do you want Dev data for forms with new screen?
  > No / Yes
```

If `Yes`, creates form helper files with dev data for testing.

#### 2. Form Keys
```
? Write the name of form keys in comma separated values.
```

Example: `email,password,name`

Creates `_form_keys.dart` with these keys.

#### 3. Widgets
```
? Write the name of widgets in comma separated values.
```

Example: `header,footer,card` or `_header,_footer,_card`

**Important**: 
- Automatically creates widget files in the `widgets/` folder
- You can use underscores or not (e.g., `header` or `_header`) - both work
- Each widget is created as a separate file
- Widget files are automatically imported in the main screen file

**Note**: This happens automatically during screen creation - no need to run separate widget commands!

### Generated Structure

```
lib/ui/screens/<screen_name>/
├── <screen_name>.dart        # Main screen file
├── _state.dart                # Screen state (Provider)
├── static/                    # (if form enabled)
│   ├── _form_keys.dart
│   └── _form_data.dart
└── widgets/
    ├── _body.dart             # Main body widget
    ├── _header.dart           # (if specified)
    └── _footer.dart           # (if specified)
```

### Example

```bash
$ hygen screen new profile

? Form Data: Yes
? Form Keys: name,email,bio
? Widgets: header,avatar,stats
```

**What happens:**
1. Creates main screen file with imports
2. Creates `_state.dart` for screen state
3. Creates `static/` folder with form files
4. Creates `widgets/_body.dart` (always created)
5. **Automatically runs** `hygen screen _widget` for each widget:
   - `hygen screen _widget header --screen=profile`
   - `hygen screen _widget avatar --screen=profile`
   - `hygen screen _widget stats --screen=profile`

**Final structure:**
```
lib/ui/screens/profile/
├── profile.dart
├── _state.dart
├── static/
│   ├── _form_keys.dart (name, email, bio)
│   └── _form_data.dart
└── widgets/
    ├── _body.dart
    ├── _header.dart        # Auto-generated
    ├── _avatar.dart        # Auto-generated
    └── _stats.dart         # Auto-generated
```

Also updates:
- `lib/router/router.dart` - Adds route import and registration
- `lib/router/routes.dart` - Adds route constant

### How Widget Auto-Generation Works

When you specify widgets during screen creation, the template:

1. **Adds `part` statements** to the main screen file:
```dart
part 'widgets/_body.dart';
part 'widgets/_header.dart';
part 'widgets/_avatar.dart';
part 'widgets/_stats.dart';
```

2. **Executes shell commands** to generate each widget file automatically:
```bash
hygen screen _widget header --screen=profile &&
hygen screen _widget avatar --screen=profile &&
hygen screen _widget stats --screen=profile
```

3. **Each widget file** is created with boilerplate code:
```dart
part of '../profile.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

**Benefits:**
- ✅ Single command creates screen + all widgets
- ✅ No need to manually run widget commands
- ✅ All files properly structured and imported
- ✅ Consistent naming and structure

---

## 2. Screen Consumer

Adds a BlocConsumer listener that shows a loading overlay and handles success/error states.

### Usage

```bash
hygen screen consumer <screen_name>
```

### Prompts

#### Bloc Configuration
```
? Write args in bloc:module:state format
```

Format: `bloc_name:module_name:listener_name`

Example: `user:delete:delete_user`

### What It Does

Creates a `BlocConsumer` that:
- ✅ Shows loading overlay when operation is in progress
- ✅ Shows success flash message
- ✅ Shows error flash message with fault details

### Generated Structure

```
lib/ui/screens/<screen_name>/
├── <screen_name>.dart         # Updated with listener import
└── listeners/
    └── _<listener_name>.dart  # New consumer listener
```

### Generated Code

```dart
class _DeleteUserListener extends StatelessWidget {
  const _DeleteUserListener();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listenWhen: (a, b) => a.delete != b.delete,
      listener: (_, state) {
        if (state.delete.isFailed) {
          UIFlash.error(context, state.delete.fault?.message ?? 'Failed');
        }
        if (state.delete.isSuccess) {
          UIFlash.success(context, 'Request completed successfully');
        }
      },
      builder: (context, state) {
        final loading = state.delete.isLoading;
        return FullScreenLoader(loading: loading);
      },
    );
  }
}
```

### Example

```bash
$ hygen screen consumer profile

? Args: user:update:update_profile
```

Creates `lib/ui/screens/profile/listeners/_update_profile.dart`

---

## 3. Screen Listener

Adds a BlocListener (without loading overlay) that only handles success/error states.

### Usage

```bash
hygen screen listener <screen_name>
```

### Prompts

Same as Screen Consumer.

### What It Does

Creates a `BlocListener` that:
- ✅ Shows success flash message
- ✅ Shows error flash message with fault details
- ❌ NO loading overlay (invisible widget)

### Generated Code

```dart
class _DeleteUserListener extends StatelessWidget {
  const _DeleteUserListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (a, b) => a.delete != b.delete,
      listener: (_, state) {
        if (state.delete.isFailed) {
          UIFlash.error(context, state.delete.fault?.message ?? 'Failed');
        }
        if (state.delete.isSuccess) {
          UIFlash.success(context, 'Request completed successfully');
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
```

### When to Use

| Template | Loading Overlay | Use Case |
|----------|----------------|----------|
| **Consumer** | ✅ Yes | Delete, Update, Submit - blocks UI |
| **Listener** | ❌ No | Background operations, no UI block needed |

---

## 4. Screen Widget

Adds a new widget to an existing screen.

### Usage

```bash
hygen screen _widget <widget_name>
```

### Prompts

#### Screen Name
```
? Enter the screen name!
```

The screen where you want to add the widget.

### Generated Structure

```
lib/ui/screens/<screen_name>/
├── <screen_name>.dart         # Updated with widget import
└── widgets/
    └── _<widget_name>.dart    # New widget
```

### Generated Code

```dart
part of '../<screen_name>.dart';

class _WidgetName extends StatelessWidget {
  const _WidgetName();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

### Example

```bash
$ hygen screen _widget stats_card

? Screen: profile
```

Creates `lib/ui/screens/profile/widgets/_stats_card.dart`

---

## Complete Workflow Example

### 1. Create New Screen

```bash
$ hygen screen new dashboard

? Form Data: No
? Form Keys: 
? Widgets: header,chart,summary
```

### 2. Add Consumer Listener

```bash
$ hygen screen consumer dashboard

? Args: analytics:fetch:fetch_analytics
```

### 3. Add Regular Listener

```bash
$ hygen screen listener dashboard

? Args: analytics:refresh:refresh_analytics
```

### 4. Add New Widget

```bash
$ hygen screen _widget data_table

? Screen: dashboard
```

### Final Structure

```
lib/ui/screens/dashboard/
├── dashboard.dart
├── _state.dart
├── listeners/
│   ├── _fetch_analytics.dart      # Consumer (with loading)
│   └── _refresh_analytics.dart    # Listener (no loading)
└── widgets/
    ├── _body.dart
    ├── _header.dart
    ├── _chart.dart
    ├── _summary.dart
    └── _data_table.dart
```

---

## State Management

### Screen State (_state.dart)

Every screen has a `_ScreenState` class that extends `ChangeNotifier`:

```dart
class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  // Optional form key (if form enabled)
  final formKey = GlobalKey<FormBuilderState>();
  
  // Add your ephemeral state here
  bool _isExpanded = false;
  
  bool get isExpanded => _isExpanded;
  
  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}
```

### Using State in Widgets

```dart
// In _body.dart or any widget
class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true); // listen: true
    
    return Column(
      children: [
        Text(screenState.isExpanded ? 'Expanded' : 'Collapsed'),
        ElevatedButton(
          onPressed: screenState.toggleExpanded,
          child: Text('Toggle'),
        ),
      ],
    );
  }
}
```

---

## Forms

### Form Keys (_form_keys.dart)

```dart
class _FormKeys {
  static const email = 'email';
  static const password = 'password';
  static const name = 'name';
}
```

### Form Data (_form_data.dart)

```dart
class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.email: 'test@example.com',
      _FormKeys.password: 'password123',
      _FormKeys.name: 'John Doe',
    };
  }
}
```

**Note**: Dev data only loads in debug mode!

### Using Forms

```dart
// In _body.dart
return Screen(
  formKey: screenState.formKey,
  initialFormValue: _FormData.initialValues(),
  keyboardHandler: true,
  child: FormBuilder(
    key: screenState.formKey,
    child: Column(
      children: [
        FormBuilderTextField(
          name: _FormKeys.email,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        FormBuilderTextField(
          name: _FormKeys.password,
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
        ),
      ],
    ),
  ),
);
```

### Screen Widget Import

The `Screen` widget is imported from:
```dart
import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';
```

This is the base wrapper widget that provides:
- Keyboard handling (if `keyboardHandler: true`)
- Form management
- Safe area handling
- Consistent app bar and scaffold structure

---

## Tips & Best Practices

### ✅ DO

- Use meaningful screen names (e.g., `user_profile`, not `screen1`)
- Create listeners for operations that affect the UI
- Use Consumer for blocking operations (delete, submit)
- Use Listener for background operations (refresh, sync)
- Keep `_state.dart` for ephemeral UI state only
- Use cubits for business logic and data

### ❌ DON'T

- Put business logic in `_ScreenState`
- Create screens without the `new` template
- Manually create listener files (use templates)
- Forget to add routes to `router.dart`
- Use form dev data in production (it's auto-disabled)

---

## Troubleshooting

**Problem**: Routes not working
- **Solution**: Check `lib/router/router.dart` and `lib/router/routes.dart` are updated

**Problem**: Form keys not found
- **Solution**: Ensure you answered "Yes" to form data and provided form keys

**Problem**: Listener not working
- **Solution**: Check the listener is added to screen's `overlayBuilders`

**Problem**: State not updating
- **Solution**: Ensure you're calling `notifyListeners()` in `_ScreenState`

**Problem**: Screen widget not found
- **Solution**: Verify import path: `lib/ui/widgets/core/screen/screen.dart`

---

## Related Documentation

- [README.md](../../README.md) - Main project documentation
- [Cubit Templates](../cubit/) - Cubit generation templates
- [Layer-First Architecture](../../README.md#architecture)
