// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AudioState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioState()';
}


}

/// @nodoc
class $AudioStateCopyWith<$Res>  {
$AudioStateCopyWith(AudioState _, $Res Function(AudioState) __);
}


/// Adds pattern-matching-related methods to [AudioState].
extension AudioStatePatterns on AudioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Playing value)?  playing,TResult Function( _Paused value)?  paused,TResult Function( _Completed value)?  completed,TResult Function( _Stopped value)?  stopped,TResult Function( _Downloading value)?  downloading,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Playing() when playing != null:
return playing(_that);case _Paused() when paused != null:
return paused(_that);case _Completed() when completed != null:
return completed(_that);case _Stopped() when stopped != null:
return stopped(_that);case _Downloading() when downloading != null:
return downloading(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Playing value)  playing,required TResult Function( _Paused value)  paused,required TResult Function( _Completed value)  completed,required TResult Function( _Stopped value)  stopped,required TResult Function( _Downloading value)  downloading,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Playing():
return playing(_that);case _Paused():
return paused(_that);case _Completed():
return completed(_that);case _Stopped():
return stopped(_that);case _Downloading():
return downloading(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Playing value)?  playing,TResult? Function( _Paused value)?  paused,TResult? Function( _Completed value)?  completed,TResult? Function( _Stopped value)?  stopped,TResult? Function( _Downloading value)?  downloading,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Playing() when playing != null:
return playing(_that);case _Paused() when paused != null:
return paused(_that);case _Completed() when completed != null:
return completed(_that);case _Stopped() when stopped != null:
return stopped(_that);case _Downloading() when downloading != null:
return downloading(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  playing,TResult Function()?  paused,TResult Function()?  completed,TResult Function()?  stopped,TResult Function()?  downloading,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Playing() when playing != null:
return playing();case _Paused() when paused != null:
return paused();case _Completed() when completed != null:
return completed();case _Stopped() when stopped != null:
return stopped();case _Downloading() when downloading != null:
return downloading();case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  playing,required TResult Function()  paused,required TResult Function()  completed,required TResult Function()  stopped,required TResult Function()  downloading,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Playing():
return playing();case _Paused():
return paused();case _Completed():
return completed();case _Stopped():
return stopped();case _Downloading():
return downloading();case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  playing,TResult? Function()?  paused,TResult? Function()?  completed,TResult? Function()?  stopped,TResult? Function()?  downloading,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Playing() when playing != null:
return playing();case _Paused() when paused != null:
return paused();case _Completed() when completed != null:
return completed();case _Stopped() when stopped != null:
return stopped();case _Downloading() when downloading != null:
return downloading();case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AudioState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioState.initial()';
}


}




/// @nodoc


class _Loading implements AudioState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioState.loading()';
}


}




/// @nodoc


class _Playing implements AudioState {
  const _Playing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Playing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioState.playing()';
}


}




/// @nodoc


class _Paused implements AudioState {
  const _Paused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Paused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioState.paused()';
}


}




/// @nodoc


class _Completed implements AudioState {
  const _Completed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Completed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioState.completed()';
}


}




/// @nodoc


class _Stopped implements AudioState {
  const _Stopped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stopped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioState.stopped()';
}


}




/// @nodoc


class _Downloading implements AudioState {
  const _Downloading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Downloading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AudioState.downloading()';
}


}




/// @nodoc


class _Error implements AudioState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of AudioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AudioState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AudioStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AudioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
