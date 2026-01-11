# Theme System Context

## Overview
This document describes the theme and color system architecture in the LensFolio mobile app. It serves as a guide for developers adding new colors, updating themes, or understanding how the theming works.

---

## Architecture

### Files Structure
```
lib/configs/theme/
├── _colors.dart         # Color definitions for light/dark themes
├── _theme_model.dart    # Theme model class with all color properties
├── _theme_data.dart     # Theme instances (light & dark)
├── _theme.dart          # AppTheme class for accessing current theme
├── _material.dart       # Flutter Material theme configuration
└── _typography.dart     # Text styles (not modified in this update)
```

---

## Color System

### Color Categories

#### 1. **Base Colors** (`AppColors`)
Global colors shared across themes:
- `primary` = `#723FED` (Purple)
- `secondary` = `#2762EB` (Blue)
- `gradientPrimary` = Linear gradient from primary to secondary

#### 2. **Light Theme Colors** (`AppColorsLight`)
```dart
// Base
primary:     #723FED
secondary:   #2762EB

// Text & Background
text:        #020817 (dark text)
subText:     #64748B (gray text)
background:  #FFFFFF (white)

// Status Colors
successBase:  #2ed6a4 (green)
successShade: #00b188
successTint:  #80e1be

warningBase:  #ffa109 (orange)
warningShade: #ff9008
warningTint:  #ffd551

dangerBase:   #b6113d (red)
dangerShade:  #a30736
dangerTint:   #e13b5c
```

#### 3. **Dark Theme Colors** (`AppColorsDark`)
```dart
// Base
primary:     #723FED
secondary:   #2762EB

// Text & Background
text:        #FFFFFF (white text)
subText:     #64748B (gray text - same as light)
background:  #020817 (dark background)

// Status Colors (same as light theme)
successBase, successShade, successTint
warningBase, warningShade, warningTint
dangerBase, dangerShade, dangerTint
```

---

## Theme Model (`_ThemeModel`)

### Properties
```dart
class _ThemeModel {
  final Color primary;           // Main brand color
  final Color secondary;         // Secondary brand color
  final Color text;              // Primary text color
  final Color subText;           // Secondary/muted text
  final Color background;        // Background color
  final Color successBase;       // Success state
  final Color successShade;      // Success darker
  final Color successTint;       // Success lighter
  final Color warningBase;       // Warning state
  final Color warningShade;      // Warning darker
  final Color warningTint;       // Warning lighter
  final Color dangerBase;        // Error/danger state
  final Color dangerShade;       // Danger darker
  final Color dangerTint;        // Danger lighter
  final LinearGradient primaryGradient;
}
```

### Usage
Access current theme colors anywhere in the app:
```dart
AppTheme.c.primary
AppTheme.c.text
AppTheme.c.background
AppTheme.c.successBase
```

---

## How It Works

### 1. **Initialization**
In `app.dart`, `AppTheme.init(context)` is called to set the current theme based on system brightness:
```dart
@override
Widget build(BuildContext context) {
  AppTheme.init(context);
  // ...
}
```

### 2. **Theme Selection**
`_theme.dart` checks brightness and assigns the appropriate theme:
```dart
c = Theme.of(context).brightness == Brightness.light
    ? _lightTheme
    : _darkTheme;
```

### 3. **Material Theme Integration**
`_material.dart` maps our custom theme to Flutter's Material theme:
- `scaffoldBackgroundColor` → `background`
- `primaryColor` → `primary`
- Text styles → `text` and `subText`
- Error colors → `dangerBase`

---

## Adding New Colors

### Step 1: Update `_colors.dart`
Add the color to both `AppColorsLight` and `AppColorsDark`:
```dart
sealed class AppColorsLight {
  // ... existing colors
  static const newColor = Color(0xffXXXXXX);
}

sealed class AppColorsDark {
  // ... existing colors
  static const newColor = Color(0xffYYYYYY);
}
```

### Step 2: Update `_theme_model.dart`
Add property, constructor parameter, and copyWith:
```dart
class _ThemeModel {
  final Color newColor;  // Add property
  
  const _ThemeModel({
    // ... existing params
    required this.newColor,  // Add to constructor
  });
  
  _ThemeModel copyWith({
    // ... existing params
    Color? newColor,  // Add to copyWith
  }) {
    return _ThemeModel(
      // ... existing assignments
      newColor: newColor ?? this.newColor,
    );
  }
}
```

### Step 3: Update `_theme_data.dart`
Add the color to both theme instances:
```dart
const _lightTheme = _ThemeModel(
  // ... existing colors
  newColor: AppColorsLight.newColor,
);

const _darkTheme = _ThemeModel(
  // ... existing colors
  newColor: AppColorsDark.newColor,
);
```

### Step 4: Use It
```dart
Container(
  color: AppTheme.c.newColor,
  // ...
)
```

---

## Component Integration

### Button Colors (`lib/ui/widgets/core/button/_data.dart`)
Buttons use the theme system for consistent styling:
- **Primary button**: `primary` background, `background` text
- **Secondary button**: `secondary` background, `background` text
- **Error button**: `dangerBase` background
- **Border buttons**: Use `primary`, `secondary`, or `text` for borders

When updating buttons:
1. Use `AppTheme.c.{colorName}` for color references
2. Use `.withValues(alpha: 0.X)` for opacity variants
3. Define all three states: `def`, `pressed`, `disabled`

---

## Best Practices

### 1. **Use Semantic Color Names**
❌ Don't: `purple`, `blue900`, `lightGray`
✅ Do: `primary`, `text`, `subText`, `successBase`

### 2. **Support Both Themes**
Always define colors for both light and dark themes.

### 3. **Use Opacity for Variants**
Instead of creating multiple color shades:
```dart
// ❌ Bad
primary100, primary200, primary300, ...

// ✅ Good
primary.withValues(alpha: 0.1)
primary.withValues(alpha: 0.5)
```

### 4. **Keep Status Colors Consistent**
Success, warning, and danger colors should remain consistent across themes unless there's a strong UX reason to change them.

### 5. **Test Both Themes**
Always test your changes in both light and dark modes.

---

## Common Patterns

### Conditional Theme-Based Styling
```dart
// Use AppTheme.c which automatically switches
Container(
  color: AppTheme.c.background,
  child: Text(
    'Hello',
    style: TextStyle(color: AppTheme.c.text),
  ),
)
```

### Opacity Variations
```dart
// Disabled state
color: AppTheme.c.primary.withValues(alpha: 0.5)

// Hover/pressed state
color: AppTheme.c.primary.withValues(alpha: 0.8)
```

### Gradient Usage
```dart
Container(
  decoration: BoxDecoration(
    gradient: AppTheme.c.primaryGradient,
  ),
)
```

---

## Migration Notes

### Previous System → Current System
The theme was simplified from a complex multi-tier color system to a focused, semantic approach:

**Removed:**
- `primaryBase`, `primaryShade`, `primaryTint`, `primary50-900`
- `accent50-950` (19+ variants)
- `neutral50-950` (19+ variants)
- `secondary50-900`, `tertiary50-900`
- `neutralBlack`, `neutralWhite`
- `lightBase`, `mediumBase`, `darkBase`
- `bronze`
- Multiple gradient variants

**Kept/Added:**
- `primary`, `secondary` (base colors)
- `text`, `subText`, `background` (semantic text/bg)
- Success/Warning/Danger sets (3 colors each)
- `primaryGradient`

**Benefits:**
- Simpler API (15 colors vs 100+)
- Easier to maintain
- Better semantic naming
- Better dark mode support

---

## Troubleshooting

### Issue: "The getter 'X' isn't defined for the type '_ThemeModel'"
**Cause:** Using an old color property that doesn't exist in the new system.
**Solution:** Update to use new semantic colors:
- `primaryBase` → `primary`
- `neutralWhite` → `background` (in light theme)
- `neutralBlack` → `text` (in light theme)
- `accent900` → `text` or `subText`

### Issue: Colors look wrong in dark mode
**Cause:** Using hardcoded colors instead of theme.
**Solution:** Replace hardcoded colors with `AppTheme.c.{colorName}`.

### Issue: Need more color variants
**Solution:** Use opacity instead of creating new colors:
```dart
AppTheme.c.primary.withValues(alpha: 0.1)  // 10% opacity
AppTheme.c.primary.withValues(alpha: 0.5)  // 50% opacity
```

---

## Future Enhancements

### Potential Additions
1. **Elevation/Shadow colors** - For depth/layers
2. **Border colors** - Dedicated border color variants
3. **Surface variants** - Surface1, Surface2 for layering
4. **Accent color** - Third brand color if needed
5. **Info color** - For informational states (like blue)

### When to Add New Colors
Only add new colors when:
- ✅ It's needed across multiple screens/components
- ✅ It represents a distinct semantic meaning
- ✅ Opacity variations don't work
- ❌ Don't add for one-off use cases

---

## Reference Links

### Related Files
- `lib/configs/configs.dart` - Main export file
- `lib/app.dart` - Theme initialization
- `lib/ui/widgets/core/button/` - Example component using theme
- `lib/configs/extension/_typography.dart` - Text style extensions

### Design Resources
- Primary color reference: `color.txt` (root directory)

---

**Date:** 10th Jan, 2025  
**Author:** Cursor AI agent
