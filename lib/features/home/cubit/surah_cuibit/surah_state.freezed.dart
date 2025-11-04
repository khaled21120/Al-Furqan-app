// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'surah_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SurahState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurahState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurahState()';
}


}

/// @nodoc
class $SurahStateCopyWith<$Res>  {
$SurahStateCopyWith(SurahState _, $Res Function(SurahState) __);
}


/// Adds pattern-matching-related methods to [SurahState].
extension SurahStatePatterns on SurahState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SurahInitial value)?  initial,TResult Function( _SurahLoading value)?  loading,TResult Function( _SurahLoaded value)?  loaded,TResult Function( _SurahError value)?  error,TResult Function( _AyahLoading value)?  ayahLoading,TResult Function( _AyahLoaded value)?  ayahLoaded,TResult Function( _AyahError value)?  ayahError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SurahInitial() when initial != null:
return initial(_that);case _SurahLoading() when loading != null:
return loading(_that);case _SurahLoaded() when loaded != null:
return loaded(_that);case _SurahError() when error != null:
return error(_that);case _AyahLoading() when ayahLoading != null:
return ayahLoading(_that);case _AyahLoaded() when ayahLoaded != null:
return ayahLoaded(_that);case _AyahError() when ayahError != null:
return ayahError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SurahInitial value)  initial,required TResult Function( _SurahLoading value)  loading,required TResult Function( _SurahLoaded value)  loaded,required TResult Function( _SurahError value)  error,required TResult Function( _AyahLoading value)  ayahLoading,required TResult Function( _AyahLoaded value)  ayahLoaded,required TResult Function( _AyahError value)  ayahError,}){
final _that = this;
switch (_that) {
case _SurahInitial():
return initial(_that);case _SurahLoading():
return loading(_that);case _SurahLoaded():
return loaded(_that);case _SurahError():
return error(_that);case _AyahLoading():
return ayahLoading(_that);case _AyahLoaded():
return ayahLoaded(_that);case _AyahError():
return ayahError(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SurahInitial value)?  initial,TResult? Function( _SurahLoading value)?  loading,TResult? Function( _SurahLoaded value)?  loaded,TResult? Function( _SurahError value)?  error,TResult? Function( _AyahLoading value)?  ayahLoading,TResult? Function( _AyahLoaded value)?  ayahLoaded,TResult? Function( _AyahError value)?  ayahError,}){
final _that = this;
switch (_that) {
case _SurahInitial() when initial != null:
return initial(_that);case _SurahLoading() when loading != null:
return loading(_that);case _SurahLoaded() when loaded != null:
return loaded(_that);case _SurahError() when error != null:
return error(_that);case _AyahLoading() when ayahLoading != null:
return ayahLoading(_that);case _AyahLoaded() when ayahLoaded != null:
return ayahLoaded(_that);case _AyahError() when ayahError != null:
return ayahError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<SurahModel> surah)?  loaded,TResult Function( String message)?  error,TResult Function()?  ayahLoading,TResult Function( AyahModel ayahs)?  ayahLoaded,TResult Function( String errMsg)?  ayahError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SurahInitial() when initial != null:
return initial();case _SurahLoading() when loading != null:
return loading();case _SurahLoaded() when loaded != null:
return loaded(_that.surah);case _SurahError() when error != null:
return error(_that.message);case _AyahLoading() when ayahLoading != null:
return ayahLoading();case _AyahLoaded() when ayahLoaded != null:
return ayahLoaded(_that.ayahs);case _AyahError() when ayahError != null:
return ayahError(_that.errMsg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<SurahModel> surah)  loaded,required TResult Function( String message)  error,required TResult Function()  ayahLoading,required TResult Function( AyahModel ayahs)  ayahLoaded,required TResult Function( String errMsg)  ayahError,}) {final _that = this;
switch (_that) {
case _SurahInitial():
return initial();case _SurahLoading():
return loading();case _SurahLoaded():
return loaded(_that.surah);case _SurahError():
return error(_that.message);case _AyahLoading():
return ayahLoading();case _AyahLoaded():
return ayahLoaded(_that.ayahs);case _AyahError():
return ayahError(_that.errMsg);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<SurahModel> surah)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  ayahLoading,TResult? Function( AyahModel ayahs)?  ayahLoaded,TResult? Function( String errMsg)?  ayahError,}) {final _that = this;
switch (_that) {
case _SurahInitial() when initial != null:
return initial();case _SurahLoading() when loading != null:
return loading();case _SurahLoaded() when loaded != null:
return loaded(_that.surah);case _SurahError() when error != null:
return error(_that.message);case _AyahLoading() when ayahLoading != null:
return ayahLoading();case _AyahLoaded() when ayahLoaded != null:
return ayahLoaded(_that.ayahs);case _AyahError() when ayahError != null:
return ayahError(_that.errMsg);case _:
  return null;

}
}

}

/// @nodoc


class _SurahInitial implements SurahState {
  const _SurahInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SurahInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurahState.initial()';
}


}




/// @nodoc


class _SurahLoading implements SurahState {
  const _SurahLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SurahLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurahState.loading()';
}


}




/// @nodoc


class _SurahLoaded implements SurahState {
  const _SurahLoaded(final  List<SurahModel> surah): _surah = surah;
  

 final  List<SurahModel> _surah;
 List<SurahModel> get surah {
  if (_surah is EqualUnmodifiableListView) return _surah;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_surah);
}


/// Create a copy of SurahState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SurahLoadedCopyWith<_SurahLoaded> get copyWith => __$SurahLoadedCopyWithImpl<_SurahLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SurahLoaded&&const DeepCollectionEquality().equals(other._surah, _surah));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_surah));

@override
String toString() {
  return 'SurahState.loaded(surah: $surah)';
}


}

/// @nodoc
abstract mixin class _$SurahLoadedCopyWith<$Res> implements $SurahStateCopyWith<$Res> {
  factory _$SurahLoadedCopyWith(_SurahLoaded value, $Res Function(_SurahLoaded) _then) = __$SurahLoadedCopyWithImpl;
@useResult
$Res call({
 List<SurahModel> surah
});




}
/// @nodoc
class __$SurahLoadedCopyWithImpl<$Res>
    implements _$SurahLoadedCopyWith<$Res> {
  __$SurahLoadedCopyWithImpl(this._self, this._then);

  final _SurahLoaded _self;
  final $Res Function(_SurahLoaded) _then;

/// Create a copy of SurahState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? surah = null,}) {
  return _then(_SurahLoaded(
null == surah ? _self._surah : surah // ignore: cast_nullable_to_non_nullable
as List<SurahModel>,
  ));
}


}

/// @nodoc


class _SurahError implements SurahState {
  const _SurahError(this.message);
  

 final  String message;

/// Create a copy of SurahState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SurahErrorCopyWith<_SurahError> get copyWith => __$SurahErrorCopyWithImpl<_SurahError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SurahError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SurahState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SurahErrorCopyWith<$Res> implements $SurahStateCopyWith<$Res> {
  factory _$SurahErrorCopyWith(_SurahError value, $Res Function(_SurahError) _then) = __$SurahErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SurahErrorCopyWithImpl<$Res>
    implements _$SurahErrorCopyWith<$Res> {
  __$SurahErrorCopyWithImpl(this._self, this._then);

  final _SurahError _self;
  final $Res Function(_SurahError) _then;

/// Create a copy of SurahState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SurahError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AyahLoading implements SurahState {
  const _AyahLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AyahLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurahState.ayahLoading()';
}


}




/// @nodoc


class _AyahLoaded implements SurahState {
  const _AyahLoaded(this.ayahs);
  

 final  AyahModel ayahs;

/// Create a copy of SurahState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AyahLoadedCopyWith<_AyahLoaded> get copyWith => __$AyahLoadedCopyWithImpl<_AyahLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AyahLoaded&&(identical(other.ayahs, ayahs) || other.ayahs == ayahs));
}


@override
int get hashCode => Object.hash(runtimeType,ayahs);

@override
String toString() {
  return 'SurahState.ayahLoaded(ayahs: $ayahs)';
}


}

/// @nodoc
abstract mixin class _$AyahLoadedCopyWith<$Res> implements $SurahStateCopyWith<$Res> {
  factory _$AyahLoadedCopyWith(_AyahLoaded value, $Res Function(_AyahLoaded) _then) = __$AyahLoadedCopyWithImpl;
@useResult
$Res call({
 AyahModel ayahs
});




}
/// @nodoc
class __$AyahLoadedCopyWithImpl<$Res>
    implements _$AyahLoadedCopyWith<$Res> {
  __$AyahLoadedCopyWithImpl(this._self, this._then);

  final _AyahLoaded _self;
  final $Res Function(_AyahLoaded) _then;

/// Create a copy of SurahState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ayahs = null,}) {
  return _then(_AyahLoaded(
null == ayahs ? _self.ayahs : ayahs // ignore: cast_nullable_to_non_nullable
as AyahModel,
  ));
}


}

/// @nodoc


class _AyahError implements SurahState {
  const _AyahError(this.errMsg);
  

 final  String errMsg;

/// Create a copy of SurahState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AyahErrorCopyWith<_AyahError> get copyWith => __$AyahErrorCopyWithImpl<_AyahError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AyahError&&(identical(other.errMsg, errMsg) || other.errMsg == errMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errMsg);

@override
String toString() {
  return 'SurahState.ayahError(errMsg: $errMsg)';
}


}

/// @nodoc
abstract mixin class _$AyahErrorCopyWith<$Res> implements $SurahStateCopyWith<$Res> {
  factory _$AyahErrorCopyWith(_AyahError value, $Res Function(_AyahError) _then) = __$AyahErrorCopyWithImpl;
@useResult
$Res call({
 String errMsg
});




}
/// @nodoc
class __$AyahErrorCopyWithImpl<$Res>
    implements _$AyahErrorCopyWith<$Res> {
  __$AyahErrorCopyWithImpl(this._self, this._then);

  final _AyahError _self;
  final $Res Function(_AyahError) _then;

/// Create a copy of SurahState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errMsg = null,}) {
  return _then(_AyahError(
null == errMsg ? _self.errMsg : errMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
