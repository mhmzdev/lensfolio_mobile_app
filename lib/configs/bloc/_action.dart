part of '../configs.dart';

/// Mixin for handling bloc action states.
///
/// Provides both imperative (boolean getters) and functional (when/maybeWhen) approaches
/// for handling different bloc states.
///
/// ## Usage Examples
///
/// ### Imperative Approach (Boolean Getters)
/// ```dart
/// BlocBuilder<UserBloc, UserState>(
///   builder: (context, state) {
///     if (state.fetch.isLoading) {
///       return CircularProgressIndicator();
///     }
///
///     if (state.fetch.isSuccess) {
///       return UserProfile(user: state.fetch.data!);
///     }
///
///     if (state.fetch.isFailed) {
///       return ErrorMessage(state.fetch.fault?.message);
///     }
///
///     return SizedBox.shrink();
///   },
/// )
/// ```
///
/// ### Functional Approach (when method)
/// ```dart
/// BlocBuilder<UserBloc, UserState>(
///   builder: (context, state) {
///     return state.fetch.when(
///       loading: () => CircularProgressIndicator(),
///       success: () => UserProfile(user: state.fetch.data!),
///       failed: () => ErrorMessage(state.fetch.fault?.message),
///       orElse: () => SizedBox.shrink(),
///     );
///   },
/// )
/// ```
///
/// ### Functional Approach (maybeWhen - safer)
/// ```dart
/// BlocBuilder<UserBloc, UserState>(
///   builder: (context, state) {
///     return state.fetch.maybeWhen(
///       loading: () => CircularProgressIndicator(),
///       success: () => UserProfile(user: state.fetch.data!),
///       orElse: () => Container(), // Required!
///     );
///   },
/// )
/// ```
abstract class BlocActionMixinBlueprint {
  final BlocAction action = BlocAction.def;
}

mixin BlocActionMixin implements BlocActionMixinBlueprint {
  /// Returns true if the bloc is in its default/initial state.
  ///
  /// Example:
  /// ```dart
  /// if (state.fetch.isDefault) {
  ///   return Text('No data loaded yet');
  /// }
  /// ```
  bool get isDefault => action == BlocAction.def;

  /// Returns true if the bloc is in initialization state.
  ///
  /// Example:
  /// ```dart
  /// if (state.fetch.isInit) {
  ///   return Text('Initializing...');
  /// }
  /// ```
  bool get isInit => action == BlocAction.init;

  /// Returns true if the bloc is preparing for an operation.
  ///
  /// Useful for pre-operation setup or validation.
  ///
  /// Example:
  /// ```dart
  /// if (state.upload.isPreparing) {
  ///   return Text('Preparing file for upload...');
  /// }
  /// ```
  bool get isPreparing => action == BlocAction.preparing;

  /// Returns true if the bloc is currently loading/fetching data.
  ///
  /// Example:
  /// ```dart
  /// if (state.fetch.isLoading) {
  ///   return CircularProgressIndicator();
  /// }
  /// ```
  bool get isLoading => action == BlocAction.loading;

  /// Returns true if the operation completed successfully.
  ///
  /// Example:
  /// ```dart
  /// if (state.fetch.isSuccess) {
  ///   return UserProfile(user: state.fetch.data!);
  /// }
  /// ```
  bool get isSuccess => action == BlocAction.success;

  /// Returns true if the operation failed with an error.
  ///
  /// Example:
  /// ```dart
  /// if (state.fetch.isFailed) {
  ///   return ErrorMessage(state.fetch.fault?.message ?? 'Error');
  /// }
  /// ```
  bool get isFailed => action == BlocAction.failed;

  /// Returns true if the operation was cancelled by the user.
  ///
  /// Example:
  /// ```dart
  /// if (state.upload.isCancelled) {
  ///   return Text('Upload cancelled');
  /// }
  /// ```
  bool get isCancelled => action == BlocAction.cancelled;

  /// Handles different bloc states in a functional way.
  ///
  /// Provide callbacks for each state you want to handle. Unhandled states
  /// will use [orElse] if provided, otherwise returns null.
  ///
  /// Example:
  /// ```dart
  /// state.fetch.when(
  ///   loading: () => CircularProgressIndicator(),
  ///   success: () => Text(state.fetch.data?.name ?? ''),
  ///   failed: () => ErrorView(message: state.fetch.fault?.message),
  /// );
  /// ```
  T? when<T>({
    T Function()? def,
    T Function()? init,
    T Function()? preparing,
    T Function()? loading,
    T Function()? success,
    T Function()? failed,
    T Function()? cancelled,
    T Function()? orElse,
  }) {
    switch (action) {
      case BlocAction.def:
        return def?.call() ?? orElse?.call();
      case BlocAction.init:
        return init?.call() ?? orElse?.call();
      case BlocAction.preparing:
        return preparing?.call() ?? orElse?.call();
      case BlocAction.loading:
        return loading?.call() ?? orElse?.call();
      case BlocAction.success:
        return success?.call() ?? orElse?.call();
      case BlocAction.failed:
        return failed?.call() ?? orElse?.call();
      case BlocAction.cancelled:
        return cancelled?.call() ?? orElse?.call();
    }
  }

  /// Simplified version that handles only common states.
  ///
  /// Useful when you only care about loading, success, and failed states.
  ///
  /// Example:
  /// ```dart
  /// state.fetch.maybeWhen(
  ///   loading: () => CircularProgressIndicator(),
  ///   success: () => UserProfile(user: state.fetch.data!),
  ///   orElse: () => SizedBox.shrink(),
  /// );
  /// ```
  T maybeWhen<T>({
    T Function()? def,
    T Function()? init,
    T Function()? preparing,
    T Function()? loading,
    T Function()? success,
    T Function()? failed,
    T Function()? cancelled,
    required T Function() orElse,
  }) {
    return when(
      def: def,
      init: init,
      preparing: preparing,
      loading: loading,
      success: success,
      failed: failed,
      cancelled: cancelled,
      orElse: orElse,
    )!;
  }
}

/// Represents different states of a bloc operation.
///
/// Use these states to track the lifecycle of async operations like
/// API calls, database queries, or any long-running tasks.
///
/// ## State Flow Example
/// ```
/// def → init → preparing → loading → success/failed/cancelled
/// ```
///
/// ## Usage in Bloc
/// ```dart
/// Future<void> _onFetch(FetchEvent event, Emitter<BlocState<User>> emit) async {
///   // Start loading
///   emit(state.copyWith(action: BlocAction.loading));
///
///   try {
///     final user = await userRepo.fetch();
///     // Success
///     emit(state.copyWith(action: BlocAction.success, data: user));
///   } on Fault catch (e) {
///     // Failed
///     emit(state.copyWith(action: BlocAction.failed, fault: e));
///   }
/// }
/// ```
enum BlocAction {
  /// Default/initial state. No operation has started yet.
  ///
  /// Use this for newly created blocs or after a reset.
  ///
  /// Example:
  /// ```dart
  /// UserBloc() : super(BlocState(action: BlocAction.def));
  /// ```
  def,

  /// Initialization state. Bloc is setting up initial data.
  ///
  /// Use this when you need to distinguish between "never loaded" (def)
  /// and "currently initializing" (init).
  ///
  /// Example:
  /// ```dart
  /// emit(state.copyWith(action: BlocAction.init));
  /// await initializeDatabase();
  /// ```
  init,

  /// Preparing state. Pre-operation setup or validation in progress.
  ///
  /// Use this for tasks that need to happen before the main operation,
  /// like file validation before upload or form validation before submit.
  ///
  /// Example:
  /// ```dart
  /// emit(state.copyWith(action: BlocAction.preparing));
  /// final validatedFile = await validateFile(file);
  /// ```
  preparing,

  /// Loading state. Main operation is in progress.
  ///
  /// Most common state for async operations like API calls.
  ///
  /// Example:
  /// ```dart
  /// emit(state.copyWith(action: BlocAction.loading));
  /// final data = await api.fetchData();
  /// ```
  loading,

  /// Success state. Operation completed successfully.
  ///
  /// Data should be available in the state when this is set.
  ///
  /// Example:
  /// ```dart
  /// emit(state.copyWith(
  ///   action: BlocAction.success,
  ///   data: fetchedData,
  /// ));
  /// ```
  success,

  /// Failed state. Operation encountered an error.
  ///
  /// Fault/error should be available in the state when this is set.
  ///
  /// Example:
  /// ```dart
  /// emit(state.copyWith(
  ///   action: BlocAction.failed,
  ///   fault: NetworkFault('Connection timeout'),
  /// ));
  /// ```
  failed,

  /// Cancelled state. Operation was cancelled by user or system.
  ///
  /// Use this when an operation is intentionally stopped before completion.
  ///
  /// Example:
  /// ```dart
  /// emit(state.copyWith(action: BlocAction.cancelled));
  /// ```
  cancelled,
}
