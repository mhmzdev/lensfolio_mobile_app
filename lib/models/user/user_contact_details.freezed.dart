// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_contact_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserContactDetails {

 String get phoneNumber; String get address;
/// Create a copy of UserContactDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserContactDetailsCopyWith<UserContactDetails> get copyWith => _$UserContactDetailsCopyWithImpl<UserContactDetails>(this as UserContactDetails, _$identity);

  /// Serializes this UserContactDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserContactDetails&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,address);

@override
String toString() {
  return 'UserContactDetails(phoneNumber: $phoneNumber, address: $address)';
}


}

/// @nodoc
abstract mixin class $UserContactDetailsCopyWith<$Res>  {
  factory $UserContactDetailsCopyWith(UserContactDetails value, $Res Function(UserContactDetails) _then) = _$UserContactDetailsCopyWithImpl;
@useResult
$Res call({
 String phoneNumber, String address
});




}
/// @nodoc
class _$UserContactDetailsCopyWithImpl<$Res>
    implements $UserContactDetailsCopyWith<$Res> {
  _$UserContactDetailsCopyWithImpl(this._self, this._then);

  final UserContactDetails _self;
  final $Res Function(UserContactDetails) _then;

/// Create a copy of UserContactDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumber = null,Object? address = null,}) {
  return _then(_self.copyWith(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserContactDetails].
extension UserContactDetailsPatterns on UserContactDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserContactDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserContactDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserContactDetails value)  $default,){
final _that = this;
switch (_that) {
case _UserContactDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserContactDetails value)?  $default,){
final _that = this;
switch (_that) {
case _UserContactDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phoneNumber,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserContactDetails() when $default != null:
return $default(_that.phoneNumber,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phoneNumber,  String address)  $default,) {final _that = this;
switch (_that) {
case _UserContactDetails():
return $default(_that.phoneNumber,_that.address);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phoneNumber,  String address)?  $default,) {final _that = this;
switch (_that) {
case _UserContactDetails() when $default != null:
return $default(_that.phoneNumber,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserContactDetails implements UserContactDetails {
  const _UserContactDetails({required this.phoneNumber, required this.address});
  factory _UserContactDetails.fromJson(Map<String, dynamic> json) => _$UserContactDetailsFromJson(json);

@override final  String phoneNumber;
@override final  String address;

/// Create a copy of UserContactDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserContactDetailsCopyWith<_UserContactDetails> get copyWith => __$UserContactDetailsCopyWithImpl<_UserContactDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserContactDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserContactDetails&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phoneNumber,address);

@override
String toString() {
  return 'UserContactDetails(phoneNumber: $phoneNumber, address: $address)';
}


}

/// @nodoc
abstract mixin class _$UserContactDetailsCopyWith<$Res> implements $UserContactDetailsCopyWith<$Res> {
  factory _$UserContactDetailsCopyWith(_UserContactDetails value, $Res Function(_UserContactDetails) _then) = __$UserContactDetailsCopyWithImpl;
@override @useResult
$Res call({
 String phoneNumber, String address
});




}
/// @nodoc
class __$UserContactDetailsCopyWithImpl<$Res>
    implements _$UserContactDetailsCopyWith<$Res> {
  __$UserContactDetailsCopyWithImpl(this._self, this._then);

  final _UserContactDetails _self;
  final $Res Function(_UserContactDetails) _then;

/// Create a copy of UserContactDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,Object? address = null,}) {
  return _then(_UserContactDetails(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
