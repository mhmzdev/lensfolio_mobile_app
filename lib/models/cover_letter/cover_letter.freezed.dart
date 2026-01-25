// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cover_letter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoverLetter {

 int get id; int get uid;@JsonKey(name: 'letter') LetterPromptResponse get letter;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of CoverLetter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoverLetterCopyWith<CoverLetter> get copyWith => _$CoverLetterCopyWithImpl<CoverLetter>(this as CoverLetter, _$identity);

  /// Serializes this CoverLetter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoverLetter&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.letter, letter) || other.letter == letter)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,letter,createdAt,updatedAt);

@override
String toString() {
  return 'CoverLetter(id: $id, uid: $uid, letter: $letter, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CoverLetterCopyWith<$Res>  {
  factory $CoverLetterCopyWith(CoverLetter value, $Res Function(CoverLetter) _then) = _$CoverLetterCopyWithImpl;
@useResult
$Res call({
 int id, int uid,@JsonKey(name: 'letter') LetterPromptResponse letter,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


$LetterPromptResponseCopyWith<$Res> get letter;

}
/// @nodoc
class _$CoverLetterCopyWithImpl<$Res>
    implements $CoverLetterCopyWith<$Res> {
  _$CoverLetterCopyWithImpl(this._self, this._then);

  final CoverLetter _self;
  final $Res Function(CoverLetter) _then;

/// Create a copy of CoverLetter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? letter = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,letter: null == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as LetterPromptResponse,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of CoverLetter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LetterPromptResponseCopyWith<$Res> get letter {
  
  return $LetterPromptResponseCopyWith<$Res>(_self.letter, (value) {
    return _then(_self.copyWith(letter: value));
  });
}
}


/// Adds pattern-matching-related methods to [CoverLetter].
extension CoverLetterPatterns on CoverLetter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoverLetter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoverLetter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoverLetter value)  $default,){
final _that = this;
switch (_that) {
case _CoverLetter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoverLetter value)?  $default,){
final _that = this;
switch (_that) {
case _CoverLetter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int uid, @JsonKey(name: 'letter')  LetterPromptResponse letter, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoverLetter() when $default != null:
return $default(_that.id,_that.uid,_that.letter,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int uid, @JsonKey(name: 'letter')  LetterPromptResponse letter, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CoverLetter():
return $default(_that.id,_that.uid,_that.letter,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int uid, @JsonKey(name: 'letter')  LetterPromptResponse letter, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CoverLetter() when $default != null:
return $default(_that.id,_that.uid,_that.letter,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoverLetter extends CoverLetter {
   _CoverLetter({required this.id, required this.uid, @JsonKey(name: 'letter') required this.letter, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _CoverLetter.fromJson(Map<String, dynamic> json) => _$CoverLetterFromJson(json);

@override final  int id;
@override final  int uid;
@override@JsonKey(name: 'letter') final  LetterPromptResponse letter;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of CoverLetter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoverLetterCopyWith<_CoverLetter> get copyWith => __$CoverLetterCopyWithImpl<_CoverLetter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoverLetterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoverLetter&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.letter, letter) || other.letter == letter)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,letter,createdAt,updatedAt);

@override
String toString() {
  return 'CoverLetter(id: $id, uid: $uid, letter: $letter, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CoverLetterCopyWith<$Res> implements $CoverLetterCopyWith<$Res> {
  factory _$CoverLetterCopyWith(_CoverLetter value, $Res Function(_CoverLetter) _then) = __$CoverLetterCopyWithImpl;
@override @useResult
$Res call({
 int id, int uid,@JsonKey(name: 'letter') LetterPromptResponse letter,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


@override $LetterPromptResponseCopyWith<$Res> get letter;

}
/// @nodoc
class __$CoverLetterCopyWithImpl<$Res>
    implements _$CoverLetterCopyWith<$Res> {
  __$CoverLetterCopyWithImpl(this._self, this._then);

  final _CoverLetter _self;
  final $Res Function(_CoverLetter) _then;

/// Create a copy of CoverLetter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? letter = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_CoverLetter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as int,letter: null == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as LetterPromptResponse,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of CoverLetter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LetterPromptResponseCopyWith<$Res> get letter {
  
  return $LetterPromptResponseCopyWith<$Res>(_self.letter, (value) {
    return _then(_self.copyWith(letter: value));
  });
}
}

// dart format on
