// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tech_stack.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserTechStack {

 TechStack get category; List<String> get technologies;
/// Create a copy of UserTechStack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTechStackCopyWith<UserTechStack> get copyWith => _$UserTechStackCopyWithImpl<UserTechStack>(this as UserTechStack, _$identity);

  /// Serializes this UserTechStack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserTechStack&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.technologies, technologies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(technologies));

@override
String toString() {
  return 'UserTechStack(category: $category, technologies: $technologies)';
}


}

/// @nodoc
abstract mixin class $UserTechStackCopyWith<$Res>  {
  factory $UserTechStackCopyWith(UserTechStack value, $Res Function(UserTechStack) _then) = _$UserTechStackCopyWithImpl;
@useResult
$Res call({
 TechStack category, List<String> technologies
});




}
/// @nodoc
class _$UserTechStackCopyWithImpl<$Res>
    implements $UserTechStackCopyWith<$Res> {
  _$UserTechStackCopyWithImpl(this._self, this._then);

  final UserTechStack _self;
  final $Res Function(UserTechStack) _then;

/// Create a copy of UserTechStack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? technologies = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TechStack,technologies: null == technologies ? _self.technologies : technologies // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserTechStack].
extension UserTechStackPatterns on UserTechStack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserTechStack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserTechStack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserTechStack value)  $default,){
final _that = this;
switch (_that) {
case _UserTechStack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserTechStack value)?  $default,){
final _that = this;
switch (_that) {
case _UserTechStack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TechStack category,  List<String> technologies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserTechStack() when $default != null:
return $default(_that.category,_that.technologies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TechStack category,  List<String> technologies)  $default,) {final _that = this;
switch (_that) {
case _UserTechStack():
return $default(_that.category,_that.technologies);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TechStack category,  List<String> technologies)?  $default,) {final _that = this;
switch (_that) {
case _UserTechStack() when $default != null:
return $default(_that.category,_that.technologies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserTechStack implements UserTechStack {
  const _UserTechStack({required this.category, required final  List<String> technologies}): _technologies = technologies;
  factory _UserTechStack.fromJson(Map<String, dynamic> json) => _$UserTechStackFromJson(json);

@override final  TechStack category;
 final  List<String> _technologies;
@override List<String> get technologies {
  if (_technologies is EqualUnmodifiableListView) return _technologies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_technologies);
}


/// Create a copy of UserTechStack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserTechStackCopyWith<_UserTechStack> get copyWith => __$UserTechStackCopyWithImpl<_UserTechStack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserTechStackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserTechStack&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._technologies, _technologies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_technologies));

@override
String toString() {
  return 'UserTechStack(category: $category, technologies: $technologies)';
}


}

/// @nodoc
abstract mixin class _$UserTechStackCopyWith<$Res> implements $UserTechStackCopyWith<$Res> {
  factory _$UserTechStackCopyWith(_UserTechStack value, $Res Function(_UserTechStack) _then) = __$UserTechStackCopyWithImpl;
@override @useResult
$Res call({
 TechStack category, List<String> technologies
});




}
/// @nodoc
class __$UserTechStackCopyWithImpl<$Res>
    implements _$UserTechStackCopyWith<$Res> {
  __$UserTechStackCopyWithImpl(this._self, this._then);

  final _UserTechStack _self;
  final $Res Function(_UserTechStack) _then;

/// Create a copy of UserTechStack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? technologies = null,}) {
  return _then(_UserTechStack(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TechStack,technologies: null == technologies ? _self._technologies : technologies // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
