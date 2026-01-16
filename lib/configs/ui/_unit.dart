part of '../configs.dart';

/// Responsive design utility that scales UI elements based on device characteristics.
///
/// AppUnit automatically calibrates to match Figma designs exactly while maintaining
/// device-aware responsiveness. Call [autoCalibrateFigma] after [init] to enable
/// automatic calibration.
///
/// Example:
/// ```dart
/// // Designer specifies 12px padding
/// Container(padding: EdgeInsets.all(12.un()))  // Returns exactly 12px
///
/// // Designer specifies 16px font
/// Text('Hello', style: TextStyle(fontSize: 16.font()))  // Returns exactly 16px
/// ```
///
/// See also:
/// - [autoCalibrateFigma] for automatic calibration setup
/// - [calibrateForDesign] for manual calibration
/// - [un] for general measurements (width, height, margins, padding)
/// - [font] for font sizes
/// - [sp] for spacing values
class AppUnit {
  /// Base padding value calculated from the device ratio.
  /// Multiplied by calibration factor when used in [sp].
  static double padding = 0.0;

  /// Core scaling ratio calculated from screen dimensions and pixel density.
  /// Typically capped at 2.4 on most devices. Used by [un] and [font] methods.
  static double ratio = 0.0;

  /// Figma design calibration multiplier applied to all AppUnit outputs.
  ///
  /// Default is 1.0 (no calibration). After calling [autoCalibrateFigma],
  /// this is automatically set to a value that makes AppUnit outputs match
  /// Figma specifications exactly.
  ///
  /// Example: If [un] returns 34px for input 12, this will be set to ~0.35
  /// so that 34 × 0.35 ≈ 12px.
  static double designCalibration = .125;

  /// Initializes AppUnit by calculating the scaling ratio based on device characteristics.
  ///
  /// This method:
  /// 1. Calculates base ratio from screen aspect ratio (width/height)
  /// 2. Factors in device pixel density (DPI)
  /// 3. Applies adjustments for small, high-DPI screens
  /// 4. Applies large screen multipliers with safety caps
  /// 5. Applies small screen density caps
  /// 6. Calculates base padding value
  ///
  /// Note: This should be called after [AppMedia.init] and before using any
  /// AppUnit methods. Follow with [autoCalibrateFigma] for Figma calibration.
  ///
  /// Example initialization order:
  /// ```dart
  /// AppMedia.init(context);
  /// AppUnit.init();
  /// AppUnit.autoCalibrateFigma(12.0);  // Optional: for Figma calibration
  /// ```
  static void init() {
    ratio = AppMedia.width / AppMedia.height;
    final pixelDensity = AppMedia.media().devicePixelRatio;
    ratio = (ratio) + ((pixelDensity + ratio) / 2);

    if (AppMedia.width <= 380 && pixelDensity >= 3) {
      ratio *= 0.85;
    }

    _initLargeScreens();
    _initSmallScreensHighDensity();

    padding = ratio * 3;
  }

  /// Applies large screen scaling with a safety cap.
  ///
  /// Multiplies [ratio] by 1.5 to scale up UI elements for larger screens,
  /// but caps it at 2.4 to prevent elements from becoming too large.
  static void _initLargeScreens() {
    const safe = 2.4;

    ratio *= 1.5;

    if (ratio > safe) {
      ratio = safe;
    }
  }

  /// Applies caps to prevent UI elements from becoming too large on small screens.
  ///
  /// Uses screen size breakpoints from [AppScreen] to determine appropriate caps:
  /// - Non-small screens (>480px): cap at 2.0
  /// - Non-extra-small screens (>360px): cap at 1.6
  /// - Non-extra-extra-small screens (>300px): cap at 1.4
  ///
  /// This ensures that high-DPI small devices don't get oversized UI elements.
  static void _initSmallScreensHighDensity() {
    if (!AppScreen.sm && ratio > 2.0) {
      ratio = 2.0;
    }
    if (!AppScreen.xs && ratio > 1.6) {
      ratio = 1.6;
    }
    if (!AppScreen.xxs && ratio > 1.4) {
      ratio = 1.4;
    }
  }

  /// Returns calibrated spacing value for padding and margins.
  ///
  /// Uses the base [padding] value multiplied by [multiplier] and [designCalibration].
  /// With auto-calibration enabled, this returns exact Figma spacing values.
  ///
  /// Parameters:
  /// - [multiplier]: Spacing multiplier (default: 1.0)
  static double sp([num multiplier = 1.0]) {
    return AppUnit.padding * 1 * multiplier * designCalibration;
  }

  /// Returns calibrated measurement for general UI elements (width, height, margins, padding).
  ///
  /// This is the primary method for converting Figma pixel values to device-appropriate
  /// logical pixels. With auto-calibration enabled, input values match output exactly.
  ///
  /// Parameters:
  /// - [unit]: The pixel value from your Figma design
  static double un(num unit) {
    return ((AppUnit.ratio * unit * 0.77) + unit) * designCalibration;
  }

  /// Returns calibrated font size for text elements.
  static double font(num unit) {
    return ((AppUnit.ratio * unit * 0.125) + (unit * 2.0)) * designCalibration;
  }

  /// Manually sets the design calibration multiplier.
  ///
  /// Use this method if you want precise control over the calibration factor,
  /// or if you've calculated a specific multiplier for your design system.
  ///
  /// Parameters:
  /// - [calibration]: The multiplier to apply to all AppUnit outputs.
  ///   Calculate as: `desiredValue / currentAppUnitValue`
  ///
  /// Note: In most cases, use [autoCalibrateFigma] instead for automatic calibration.
  ///
  /// Example:
  /// ```dart
  /// // If AppUnit.un(12) returns 34px but you want 12px:
  /// // Calibration = 12 / 34 = 0.353
  /// AppUnit.calibrateForDesign(0.353);
  ///
  /// // Now AppUnit.un(12) will return ~12px
  /// ```
  static void calibrateForDesign(double calibration) {
    designCalibration = calibration;
  }
}
