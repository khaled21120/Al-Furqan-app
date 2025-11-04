// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prayer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrayerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrayerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrayerState()';
}


}

/// @nodoc
class $PrayerStateCopyWith<$Res>  {
$PrayerStateCopyWith(PrayerState _, $Res Function(PrayerState) __);
}


/// Adds pattern-matching-related methods to [PrayerState].
extension PrayerStatePatterns on PrayerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PrayerInitial value)?  initial,TResult Function( _PrayerLoading value)?  loading,TResult Function( _PrayerLoaded value)?  loaded,TResult Function( _PrayerError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrayerInitial() when initial != null:
return initial(_that);case _PrayerLoading() when loading != null:
return loading(_that);case _PrayerLoaded() when loaded != null:
return loaded(_that);case _PrayerError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PrayerInitial value)  initial,required TResult Function( _PrayerLoading value)  loading,required TResult Function( _PrayerLoaded value)  loaded,required TResult Function( _PrayerError value)  error,}){
final _that = this;
switch (_that) {
case _PrayerInitial():
return initial(_that);case _PrayerLoading():
return loading(_that);case _PrayerLoaded():
return loaded(_that);case _PrayerError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PrayerInitial value)?  initial,TResult? Function( _PrayerLoading value)?  loading,TResult? Function( _PrayerLoaded value)?  loaded,TResult? Function( _PrayerError value)?  error,}){
final _that = this;
switch (_that) {
case _PrayerInitial() when initial != null:
return initial(_that);case _PrayerLoading() when loading != null:
return loading(_that);case _PrayerLoaded() when loaded != null:
return loaded(_that);case _PrayerError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PrayerModel prayerTime)?  loaded,TResult Function( String errMsg)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrayerInitial() when initial != null:
return initial();case _PrayerLoading() when loading != null:
return loading();case _PrayerLoaded() when loaded != null:
return loaded(_that.prayerTime);case _PrayerError() when error != null:
return error(_that.errMsg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PrayerModel prayerTime)  loaded,required TResult Function( String errMsg)  error,}) {final _that = this;
switch (_that) {
case _PrayerInitial():
return initial();case _PrayerLoading():
return loading();case _PrayerLoaded():
return loaded(_that.prayerTime);case _PrayerError():
return error(_that.errMsg);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PrayerModel prayerTime)?  loaded,TResult? Function( String errMsg)?  error,}) {final _that = this;
switch (_that) {
case _PrayerInitial() when initial != null:
return initial();case _PrayerLoading() when loading != null:
return loading();case _PrayerLoaded() when loaded != null:
return loaded(_that.prayerTime);case _PrayerError() when error != null:
return error(_that.errMsg);case _:
  return null;

}
}

}

/// @nodoc


class _PrayerInitial implements PrayerState {
  const _PrayerInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrayerInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrayerState.initial()';
}


}




/// @nodoc


class _PrayerLoading implements PrayerState {
  const _PrayerLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrayerLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrayerState.loading()';
}


}




/// @nodoc


class _PrayerLoaded implements PrayerState {
  const _PrayerLoaded(this.prayerTime);
  

 final  PrayerModel prayerTime;

/// Create a copy of PrayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrayerLoadedCopyWith<_PrayerLoaded> get copyWith => __$PrayerLoadedCopyWithImpl<_PrayerLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrayerLoaded&&(identical(other.prayerTime, prayerTime) || other.prayerTime == prayerTime));
}


@override
int get hashCode => Object.hash(runtimeType,prayerTime);

@override
String toString() {
  return 'PrayerState.loaded(prayerTime: $prayerTime)';
}


}

/// @nodoc
abstract mixin class _$PrayerLoadedCopyWith<$Res> implements $PrayerStateCopyWith<$Res> {
  factory _$PrayerLoadedCopyWith(_PrayerLoaded value, $Res Function(_PrayerLoaded) _then) = __$PrayerLoadedCopyWithImpl;
@useResult
$Res call({
 PrayerModel prayerTime
});




}
/// @nodoc
class __$PrayerLoadedCopyWithImpl<$Res>
    implements _$PrayerLoadedCopyWith<$Res> {
  __$PrayerLoadedCopyWithImpl(this._self, this._then);

  final _PrayerLoaded _self;
  final $Res Function(_PrayerLoaded) _then;

/// Create a copy of PrayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? prayerTime = null,}) {
  return _then(_PrayerLoaded(
null == prayerTime ? _self.prayerTime : prayerTime // ignore: cast_nullable_to_non_nullable
as PrayerModel,
  ));
}


}

/// @nodoc


class _PrayerError implements PrayerState {
  const _PrayerError(this.errMsg);
  

 final  String errMsg;

/// Create a copy of PrayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrayerErrorCopyWith<_PrayerError> get copyWith => __$PrayerErrorCopyWithImpl<_PrayerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrayerError&&(identical(other.errMsg, errMsg) || other.errMsg == errMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errMsg);

@override
String toString() {
  return 'PrayerState.error(errMsg: $errMsg)';
}


}

/// @nodoc
abstract mixin class _$PrayerErrorCopyWith<$Res> implements $PrayerStateCopyWith<$Res> {
  factory _$PrayerErrorCopyWith(_PrayerError value, $Res Function(_PrayerError) _then) = __$PrayerErrorCopyWithImpl;
@useResult
$Res call({
 String errMsg
});




}
/// @nodoc
class __$PrayerErrorCopyWithImpl<$Res>
    implements _$PrayerErrorCopyWith<$Res> {
  __$PrayerErrorCopyWithImpl(this._self, this._then);

  final _PrayerError _self;
  final $Res Function(_PrayerError) _then;

/// Create a copy of PrayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errMsg = null,}) {
  return _then(_PrayerError(
null == errMsg ? _self.errMsg : errMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
