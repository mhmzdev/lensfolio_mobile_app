part of '../configs.dart';

class BlocState<T> extends Equatable with BlocActionMixin {
  @override
  final BlocAction action;
  final dynamic meta;
  final T? data;
  final Fault? fault;

  BlocState({
    this.action = BlocAction.def,
    this.data,
    this.meta,
    this.fault, //
  });

  BlocState<T> copyWith({
    BlocAction? action,
    T? data,
    dynamic meta,
    Fault? fault,
  }) {
    return BlocState<T>(
      action: action ?? this.action,
      data: data ?? this.data,
      meta: meta ?? this.meta,
      fault: fault ?? this.fault,
    );
  }

  BlocState<T> merge(BlocState<T> model) {
    return BlocState<T>(
      action: model.action,
      meta: model.meta ?? meta,
      data: model.data ?? data,
      fault: model.fault ?? fault,
    );
  }

  T get getData => data!;

  bool get hasError => fault != null;
  String get errorMessage =>
      hasError ? fault!.message : 'Failed to get error message!';

  BlocState<T> toDefault() => copyWith(action: BlocAction.def);

  BlocState<T> toInit({dynamic meta}) => copyWith(
    action: BlocAction.init,
    meta: meta,
  );
  BlocState<T> toPreparing({dynamic meta}) => copyWith(
    action: BlocAction.preparing,
    meta: meta,
  );

  BlocState<T> toLoading({dynamic meta}) => copyWith(
    action: BlocAction.loading,
    meta: meta,
  );
  BlocState<T> toSuccess({
    T? data,
    dynamic meta,
  }) => copyWith(
    action: BlocAction.success,
    data: data,
    meta: meta,
  );
  BlocState<T> toFailed({
    Fault? fault,
    dynamic meta,
  }) => copyWith(
    meta: meta,
    action: BlocAction.failed,
    fault: fault ?? this.fault,
  );
  BlocState<T> toCancelled() => copyWith(action: BlocAction.cancelled);

  @override
  List<Object?> get props => [action, data, meta, fault];

  @override
  String toString() =>
      'BlocState(action: $action, data: ${data?.toString() ?? data}, meta: $meta, fault: $fault)';
}
