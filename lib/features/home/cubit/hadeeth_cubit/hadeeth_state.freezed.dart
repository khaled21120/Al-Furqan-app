// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hadeeth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HadeethState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HadeethState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HadeethState()';
}


}

/// @nodoc
class $HadeethStateCopyWith<$Res>  {
$HadeethStateCopyWith(HadeethState _, $Res Function(HadeethState) __);
}


/// Adds pattern-matching-related methods to [HadeethState].
extension HadeethStatePatterns on HadeethState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _HadeethInitial value)?  initial,TResult Function( _HadeethLoading value)?  loading,TResult Function( _HadeethError value)?  error,TResult Function( _HadeethsLoaded value)?  loaded,TResult Function( _HadeethsCATELoaded value)?  hadeethsCategoriesLoaded,TResult Function( _HadeethDetailsLoaded value)?  hadeethDetailsLoaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HadeethInitial() when initial != null:
return initial(_that);case _HadeethLoading() when loading != null:
return loading(_that);case _HadeethError() when error != null:
return error(_that);case _HadeethsLoaded() when loaded != null:
return loaded(_that);case _HadeethsCATELoaded() when hadeethsCategoriesLoaded != null:
return hadeethsCategoriesLoaded(_that);case _HadeethDetailsLoaded() when hadeethDetailsLoaded != null:
return hadeethDetailsLoaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _HadeethInitial value)  initial,required TResult Function( _HadeethLoading value)  loading,required TResult Function( _HadeethError value)  error,required TResult Function( _HadeethsLoaded value)  loaded,required TResult Function( _HadeethsCATELoaded value)  hadeethsCategoriesLoaded,required TResult Function( _HadeethDetailsLoaded value)  hadeethDetailsLoaded,}){
final _that = this;
switch (_that) {
case _HadeethInitial():
return initial(_that);case _HadeethLoading():
return loading(_that);case _HadeethError():
return error(_that);case _HadeethsLoaded():
return loaded(_that);case _HadeethsCATELoaded():
return hadeethsCategoriesLoaded(_that);case _HadeethDetailsLoaded():
return hadeethDetailsLoaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _HadeethInitial value)?  initial,TResult? Function( _HadeethLoading value)?  loading,TResult? Function( _HadeethError value)?  error,TResult? Function( _HadeethsLoaded value)?  loaded,TResult? Function( _HadeethsCATELoaded value)?  hadeethsCategoriesLoaded,TResult? Function( _HadeethDetailsLoaded value)?  hadeethDetailsLoaded,}){
final _that = this;
switch (_that) {
case _HadeethInitial() when initial != null:
return initial(_that);case _HadeethLoading() when loading != null:
return loading(_that);case _HadeethError() when error != null:
return error(_that);case _HadeethsLoaded() when loaded != null:
return loaded(_that);case _HadeethsCATELoaded() when hadeethsCategoriesLoaded != null:
return hadeethsCategoriesLoaded(_that);case _HadeethDetailsLoaded() when hadeethDetailsLoaded != null:
return hadeethDetailsLoaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String errMsg)?  error,TResult Function( List<HadeethsModel> hadeethslList)?  loaded,TResult Function( List<HadeethsCategoriesModel> hadeethCategorieshList)?  hadeethsCategoriesLoaded,TResult Function( HadeethDetailsModel hadeethDetails)?  hadeethDetailsLoaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HadeethInitial() when initial != null:
return initial();case _HadeethLoading() when loading != null:
return loading();case _HadeethError() when error != null:
return error(_that.errMsg);case _HadeethsLoaded() when loaded != null:
return loaded(_that.hadeethslList);case _HadeethsCATELoaded() when hadeethsCategoriesLoaded != null:
return hadeethsCategoriesLoaded(_that.hadeethCategorieshList);case _HadeethDetailsLoaded() when hadeethDetailsLoaded != null:
return hadeethDetailsLoaded(_that.hadeethDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String errMsg)  error,required TResult Function( List<HadeethsModel> hadeethslList)  loaded,required TResult Function( List<HadeethsCategoriesModel> hadeethCategorieshList)  hadeethsCategoriesLoaded,required TResult Function( HadeethDetailsModel hadeethDetails)  hadeethDetailsLoaded,}) {final _that = this;
switch (_that) {
case _HadeethInitial():
return initial();case _HadeethLoading():
return loading();case _HadeethError():
return error(_that.errMsg);case _HadeethsLoaded():
return loaded(_that.hadeethslList);case _HadeethsCATELoaded():
return hadeethsCategoriesLoaded(_that.hadeethCategorieshList);case _HadeethDetailsLoaded():
return hadeethDetailsLoaded(_that.hadeethDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String errMsg)?  error,TResult? Function( List<HadeethsModel> hadeethslList)?  loaded,TResult? Function( List<HadeethsCategoriesModel> hadeethCategorieshList)?  hadeethsCategoriesLoaded,TResult? Function( HadeethDetailsModel hadeethDetails)?  hadeethDetailsLoaded,}) {final _that = this;
switch (_that) {
case _HadeethInitial() when initial != null:
return initial();case _HadeethLoading() when loading != null:
return loading();case _HadeethError() when error != null:
return error(_that.errMsg);case _HadeethsLoaded() when loaded != null:
return loaded(_that.hadeethslList);case _HadeethsCATELoaded() when hadeethsCategoriesLoaded != null:
return hadeethsCategoriesLoaded(_that.hadeethCategorieshList);case _HadeethDetailsLoaded() when hadeethDetailsLoaded != null:
return hadeethDetailsLoaded(_that.hadeethDetails);case _:
  return null;

}
}

}

/// @nodoc


class _HadeethInitial implements HadeethState {
  const _HadeethInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HadeethInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HadeethState.initial()';
}


}




/// @nodoc


class _HadeethLoading implements HadeethState {
  const _HadeethLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HadeethLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HadeethState.loading()';
}


}




/// @nodoc


class _HadeethError implements HadeethState {
  const _HadeethError(this.errMsg);
  

 final  String errMsg;

/// Create a copy of HadeethState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HadeethErrorCopyWith<_HadeethError> get copyWith => __$HadeethErrorCopyWithImpl<_HadeethError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HadeethError&&(identical(other.errMsg, errMsg) || other.errMsg == errMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errMsg);

@override
String toString() {
  return 'HadeethState.error(errMsg: $errMsg)';
}


}

/// @nodoc
abstract mixin class _$HadeethErrorCopyWith<$Res> implements $HadeethStateCopyWith<$Res> {
  factory _$HadeethErrorCopyWith(_HadeethError value, $Res Function(_HadeethError) _then) = __$HadeethErrorCopyWithImpl;
@useResult
$Res call({
 String errMsg
});




}
/// @nodoc
class __$HadeethErrorCopyWithImpl<$Res>
    implements _$HadeethErrorCopyWith<$Res> {
  __$HadeethErrorCopyWithImpl(this._self, this._then);

  final _HadeethError _self;
  final $Res Function(_HadeethError) _then;

/// Create a copy of HadeethState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errMsg = null,}) {
  return _then(_HadeethError(
null == errMsg ? _self.errMsg : errMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _HadeethsLoaded implements HadeethState {
  const _HadeethsLoaded(final  List<HadeethsModel> hadeethslList): _hadeethslList = hadeethslList;
  

 final  List<HadeethsModel> _hadeethslList;
 List<HadeethsModel> get hadeethslList {
  if (_hadeethslList is EqualUnmodifiableListView) return _hadeethslList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hadeethslList);
}


/// Create a copy of HadeethState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HadeethsLoadedCopyWith<_HadeethsLoaded> get copyWith => __$HadeethsLoadedCopyWithImpl<_HadeethsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HadeethsLoaded&&const DeepCollectionEquality().equals(other._hadeethslList, _hadeethslList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hadeethslList));

@override
String toString() {
  return 'HadeethState.loaded(hadeethslList: $hadeethslList)';
}


}

/// @nodoc
abstract mixin class _$HadeethsLoadedCopyWith<$Res> implements $HadeethStateCopyWith<$Res> {
  factory _$HadeethsLoadedCopyWith(_HadeethsLoaded value, $Res Function(_HadeethsLoaded) _then) = __$HadeethsLoadedCopyWithImpl;
@useResult
$Res call({
 List<HadeethsModel> hadeethslList
});




}
/// @nodoc
class __$HadeethsLoadedCopyWithImpl<$Res>
    implements _$HadeethsLoadedCopyWith<$Res> {
  __$HadeethsLoadedCopyWithImpl(this._self, this._then);

  final _HadeethsLoaded _self;
  final $Res Function(_HadeethsLoaded) _then;

/// Create a copy of HadeethState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hadeethslList = null,}) {
  return _then(_HadeethsLoaded(
null == hadeethslList ? _self._hadeethslList : hadeethslList // ignore: cast_nullable_to_non_nullable
as List<HadeethsModel>,
  ));
}


}

/// @nodoc


class _HadeethsCATELoaded implements HadeethState {
  const _HadeethsCATELoaded(final  List<HadeethsCategoriesModel> hadeethCategorieshList): _hadeethCategorieshList = hadeethCategorieshList;
  

 final  List<HadeethsCategoriesModel> _hadeethCategorieshList;
 List<HadeethsCategoriesModel> get hadeethCategorieshList {
  if (_hadeethCategorieshList is EqualUnmodifiableListView) return _hadeethCategorieshList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hadeethCategorieshList);
}


/// Create a copy of HadeethState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HadeethsCATELoadedCopyWith<_HadeethsCATELoaded> get copyWith => __$HadeethsCATELoadedCopyWithImpl<_HadeethsCATELoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HadeethsCATELoaded&&const DeepCollectionEquality().equals(other._hadeethCategorieshList, _hadeethCategorieshList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hadeethCategorieshList));

@override
String toString() {
  return 'HadeethState.hadeethsCategoriesLoaded(hadeethCategorieshList: $hadeethCategorieshList)';
}


}

/// @nodoc
abstract mixin class _$HadeethsCATELoadedCopyWith<$Res> implements $HadeethStateCopyWith<$Res> {
  factory _$HadeethsCATELoadedCopyWith(_HadeethsCATELoaded value, $Res Function(_HadeethsCATELoaded) _then) = __$HadeethsCATELoadedCopyWithImpl;
@useResult
$Res call({
 List<HadeethsCategoriesModel> hadeethCategorieshList
});




}
/// @nodoc
class __$HadeethsCATELoadedCopyWithImpl<$Res>
    implements _$HadeethsCATELoadedCopyWith<$Res> {
  __$HadeethsCATELoadedCopyWithImpl(this._self, this._then);

  final _HadeethsCATELoaded _self;
  final $Res Function(_HadeethsCATELoaded) _then;

/// Create a copy of HadeethState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hadeethCategorieshList = null,}) {
  return _then(_HadeethsCATELoaded(
null == hadeethCategorieshList ? _self._hadeethCategorieshList : hadeethCategorieshList // ignore: cast_nullable_to_non_nullable
as List<HadeethsCategoriesModel>,
  ));
}


}

/// @nodoc


class _HadeethDetailsLoaded implements HadeethState {
  const _HadeethDetailsLoaded(this.hadeethDetails);
  

 final  HadeethDetailsModel hadeethDetails;

/// Create a copy of HadeethState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HadeethDetailsLoadedCopyWith<_HadeethDetailsLoaded> get copyWith => __$HadeethDetailsLoadedCopyWithImpl<_HadeethDetailsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HadeethDetailsLoaded&&(identical(other.hadeethDetails, hadeethDetails) || other.hadeethDetails == hadeethDetails));
}


@override
int get hashCode => Object.hash(runtimeType,hadeethDetails);

@override
String toString() {
  return 'HadeethState.hadeethDetailsLoaded(hadeethDetails: $hadeethDetails)';
}


}

/// @nodoc
abstract mixin class _$HadeethDetailsLoadedCopyWith<$Res> implements $HadeethStateCopyWith<$Res> {
  factory _$HadeethDetailsLoadedCopyWith(_HadeethDetailsLoaded value, $Res Function(_HadeethDetailsLoaded) _then) = __$HadeethDetailsLoadedCopyWithImpl;
@useResult
$Res call({
 HadeethDetailsModel hadeethDetails
});




}
/// @nodoc
class __$HadeethDetailsLoadedCopyWithImpl<$Res>
    implements _$HadeethDetailsLoadedCopyWith<$Res> {
  __$HadeethDetailsLoadedCopyWithImpl(this._self, this._then);

  final _HadeethDetailsLoaded _self;
  final $Res Function(_HadeethDetailsLoaded) _then;

/// Create a copy of HadeethState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hadeethDetails = null,}) {
  return _then(_HadeethDetailsLoaded(
null == hadeethDetails ? _self.hadeethDetails : hadeethDetails // ignore: cast_nullable_to_non_nullable
as HadeethDetailsModel,
  ));
}


}

// dart format on
