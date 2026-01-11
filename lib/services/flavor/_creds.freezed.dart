// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '_creds.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupabaseCreds {

 String get url;@JsonKey(name: 'anon_key') String get anonKey;
/// Create a copy of SupabaseCreds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupabaseCredsCopyWith<SupabaseCreds> get copyWith => _$SupabaseCredsCopyWithImpl<SupabaseCreds>(this as SupabaseCreds, _$identity);

  /// Serializes this SupabaseCreds to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupabaseCreds&&(identical(other.url, url) || other.url == url)&&(identical(other.anonKey, anonKey) || other.anonKey == anonKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,anonKey);

@override
String toString() {
  return 'SupabaseCreds(url: $url, anonKey: $anonKey)';
}


}

/// @nodoc
abstract mixin class $SupabaseCredsCopyWith<$Res>  {
  factory $SupabaseCredsCopyWith(SupabaseCreds value, $Res Function(SupabaseCreds) _then) = _$SupabaseCredsCopyWithImpl;
@useResult
$Res call({
 String url,@JsonKey(name: 'anon_key') String anonKey
});




}
/// @nodoc
class _$SupabaseCredsCopyWithImpl<$Res>
    implements $SupabaseCredsCopyWith<$Res> {
  _$SupabaseCredsCopyWithImpl(this._self, this._then);

  final SupabaseCreds _self;
  final $Res Function(SupabaseCreds) _then;

/// Create a copy of SupabaseCreds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? anonKey = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,anonKey: null == anonKey ? _self.anonKey : anonKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SupabaseCreds].
extension SupabaseCredsPatterns on SupabaseCreds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupabaseCreds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupabaseCreds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupabaseCreds value)  $default,){
final _that = this;
switch (_that) {
case _SupabaseCreds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupabaseCreds value)?  $default,){
final _that = this;
switch (_that) {
case _SupabaseCreds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url, @JsonKey(name: 'anon_key')  String anonKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupabaseCreds() when $default != null:
return $default(_that.url,_that.anonKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url, @JsonKey(name: 'anon_key')  String anonKey)  $default,) {final _that = this;
switch (_that) {
case _SupabaseCreds():
return $default(_that.url,_that.anonKey);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url, @JsonKey(name: 'anon_key')  String anonKey)?  $default,) {final _that = this;
switch (_that) {
case _SupabaseCreds() when $default != null:
return $default(_that.url,_that.anonKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupabaseCreds implements SupabaseCreds {
  const _SupabaseCreds({required this.url, @JsonKey(name: 'anon_key') required this.anonKey});
  factory _SupabaseCreds.fromJson(Map<String, dynamic> json) => _$SupabaseCredsFromJson(json);

@override final  String url;
@override@JsonKey(name: 'anon_key') final  String anonKey;

/// Create a copy of SupabaseCreds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupabaseCredsCopyWith<_SupabaseCreds> get copyWith => __$SupabaseCredsCopyWithImpl<_SupabaseCreds>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupabaseCredsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupabaseCreds&&(identical(other.url, url) || other.url == url)&&(identical(other.anonKey, anonKey) || other.anonKey == anonKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,anonKey);

@override
String toString() {
  return 'SupabaseCreds(url: $url, anonKey: $anonKey)';
}


}

/// @nodoc
abstract mixin class _$SupabaseCredsCopyWith<$Res> implements $SupabaseCredsCopyWith<$Res> {
  factory _$SupabaseCredsCopyWith(_SupabaseCreds value, $Res Function(_SupabaseCreds) _then) = __$SupabaseCredsCopyWithImpl;
@override @useResult
$Res call({
 String url,@JsonKey(name: 'anon_key') String anonKey
});




}
/// @nodoc
class __$SupabaseCredsCopyWithImpl<$Res>
    implements _$SupabaseCredsCopyWith<$Res> {
  __$SupabaseCredsCopyWithImpl(this._self, this._then);

  final _SupabaseCreds _self;
  final $Res Function(_SupabaseCreds) _then;

/// Create a copy of SupabaseCreds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? anonKey = null,}) {
  return _then(_SupabaseCreds(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,anonKey: null == anonKey ? _self.anonKey : anonKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
