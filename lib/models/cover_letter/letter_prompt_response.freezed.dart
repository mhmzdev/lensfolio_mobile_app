// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letter_prompt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LetterPromptResponse {

@JsonKey(name: 'letter_body') String? get letterBody; String? get error;
/// Create a copy of LetterPromptResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LetterPromptResponseCopyWith<LetterPromptResponse> get copyWith => _$LetterPromptResponseCopyWithImpl<LetterPromptResponse>(this as LetterPromptResponse, _$identity);

  /// Serializes this LetterPromptResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LetterPromptResponse&&(identical(other.letterBody, letterBody) || other.letterBody == letterBody)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,letterBody,error);

@override
String toString() {
  return 'LetterPromptResponse(letterBody: $letterBody, error: $error)';
}


}

/// @nodoc
abstract mixin class $LetterPromptResponseCopyWith<$Res>  {
  factory $LetterPromptResponseCopyWith(LetterPromptResponse value, $Res Function(LetterPromptResponse) _then) = _$LetterPromptResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'letter_body') String? letterBody, String? error
});




}
/// @nodoc
class _$LetterPromptResponseCopyWithImpl<$Res>
    implements $LetterPromptResponseCopyWith<$Res> {
  _$LetterPromptResponseCopyWithImpl(this._self, this._then);

  final LetterPromptResponse _self;
  final $Res Function(LetterPromptResponse) _then;

/// Create a copy of LetterPromptResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? letterBody = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
letterBody: freezed == letterBody ? _self.letterBody : letterBody // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LetterPromptResponse].
extension LetterPromptResponsePatterns on LetterPromptResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LetterPromptResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LetterPromptResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LetterPromptResponse value)  $default,){
final _that = this;
switch (_that) {
case _LetterPromptResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LetterPromptResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LetterPromptResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'letter_body')  String? letterBody,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LetterPromptResponse() when $default != null:
return $default(_that.letterBody,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'letter_body')  String? letterBody,  String? error)  $default,) {final _that = this;
switch (_that) {
case _LetterPromptResponse():
return $default(_that.letterBody,_that.error);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'letter_body')  String? letterBody,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _LetterPromptResponse() when $default != null:
return $default(_that.letterBody,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LetterPromptResponse implements LetterPromptResponse {
  const _LetterPromptResponse({@JsonKey(name: 'letter_body') this.letterBody, this.error});
  factory _LetterPromptResponse.fromJson(Map<String, dynamic> json) => _$LetterPromptResponseFromJson(json);

@override@JsonKey(name: 'letter_body') final  String? letterBody;
@override final  String? error;

/// Create a copy of LetterPromptResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LetterPromptResponseCopyWith<_LetterPromptResponse> get copyWith => __$LetterPromptResponseCopyWithImpl<_LetterPromptResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LetterPromptResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LetterPromptResponse&&(identical(other.letterBody, letterBody) || other.letterBody == letterBody)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,letterBody,error);

@override
String toString() {
  return 'LetterPromptResponse(letterBody: $letterBody, error: $error)';
}


}

/// @nodoc
abstract mixin class _$LetterPromptResponseCopyWith<$Res> implements $LetterPromptResponseCopyWith<$Res> {
  factory _$LetterPromptResponseCopyWith(_LetterPromptResponse value, $Res Function(_LetterPromptResponse) _then) = __$LetterPromptResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'letter_body') String? letterBody, String? error
});




}
/// @nodoc
class __$LetterPromptResponseCopyWithImpl<$Res>
    implements _$LetterPromptResponseCopyWith<$Res> {
  __$LetterPromptResponseCopyWithImpl(this._self, this._then);

  final _LetterPromptResponse _self;
  final $Res Function(_LetterPromptResponse) _then;

/// Create a copy of LetterPromptResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? letterBody = freezed,Object? error = freezed,}) {
  return _then(_LetterPromptResponse(
letterBody: freezed == letterBody ? _self.letterBody : letterBody // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
