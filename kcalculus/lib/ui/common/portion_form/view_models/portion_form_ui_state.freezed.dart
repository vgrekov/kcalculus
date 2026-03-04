// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portion_form_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PortionFormUiState {

 Edible? get selectedEdible; String get name; String get description; Unit? get amountUnit; double? get amountValue; List<NutritionFacts>? get nutritionFacts;
/// Create a copy of PortionFormUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortionFormUiStateCopyWith<PortionFormUiState> get copyWith => _$PortionFormUiStateCopyWithImpl<PortionFormUiState>(this as PortionFormUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortionFormUiState&&(identical(other.selectedEdible, selectedEdible) || other.selectedEdible == selectedEdible)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.amountUnit, amountUnit) || other.amountUnit == amountUnit)&&(identical(other.amountValue, amountValue) || other.amountValue == amountValue)&&const DeepCollectionEquality().equals(other.nutritionFacts, nutritionFacts));
}


@override
int get hashCode => Object.hash(runtimeType,selectedEdible,name,description,amountUnit,amountValue,const DeepCollectionEquality().hash(nutritionFacts));

@override
String toString() {
  return 'PortionFormUiState(selectedEdible: $selectedEdible, name: $name, description: $description, amountUnit: $amountUnit, amountValue: $amountValue, nutritionFacts: $nutritionFacts)';
}


}

/// @nodoc
abstract mixin class $PortionFormUiStateCopyWith<$Res>  {
  factory $PortionFormUiStateCopyWith(PortionFormUiState value, $Res Function(PortionFormUiState) _then) = _$PortionFormUiStateCopyWithImpl;
@useResult
$Res call({
 Edible? selectedEdible, String name, String description, Unit? amountUnit, double? amountValue, List<NutritionFacts>? nutritionFacts
});




}
/// @nodoc
class _$PortionFormUiStateCopyWithImpl<$Res>
    implements $PortionFormUiStateCopyWith<$Res> {
  _$PortionFormUiStateCopyWithImpl(this._self, this._then);

  final PortionFormUiState _self;
  final $Res Function(PortionFormUiState) _then;

/// Create a copy of PortionFormUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedEdible = freezed,Object? name = null,Object? description = null,Object? amountUnit = freezed,Object? amountValue = freezed,Object? nutritionFacts = freezed,}) {
  return _then(_self.copyWith(
selectedEdible: freezed == selectedEdible ? _self.selectedEdible : selectedEdible // ignore: cast_nullable_to_non_nullable
as Edible?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amountUnit: freezed == amountUnit ? _self.amountUnit : amountUnit // ignore: cast_nullable_to_non_nullable
as Unit?,amountValue: freezed == amountValue ? _self.amountValue : amountValue // ignore: cast_nullable_to_non_nullable
as double?,nutritionFacts: freezed == nutritionFacts ? _self.nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFacts>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PortionFormUiState].
extension PortionFormUiStatePatterns on PortionFormUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortionFormUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortionFormUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortionFormUiState value)  $default,){
final _that = this;
switch (_that) {
case _PortionFormUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortionFormUiState value)?  $default,){
final _that = this;
switch (_that) {
case _PortionFormUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Edible? selectedEdible,  String name,  String description,  Unit? amountUnit,  double? amountValue,  List<NutritionFacts>? nutritionFacts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortionFormUiState() when $default != null:
return $default(_that.selectedEdible,_that.name,_that.description,_that.amountUnit,_that.amountValue,_that.nutritionFacts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Edible? selectedEdible,  String name,  String description,  Unit? amountUnit,  double? amountValue,  List<NutritionFacts>? nutritionFacts)  $default,) {final _that = this;
switch (_that) {
case _PortionFormUiState():
return $default(_that.selectedEdible,_that.name,_that.description,_that.amountUnit,_that.amountValue,_that.nutritionFacts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Edible? selectedEdible,  String name,  String description,  Unit? amountUnit,  double? amountValue,  List<NutritionFacts>? nutritionFacts)?  $default,) {final _that = this;
switch (_that) {
case _PortionFormUiState() when $default != null:
return $default(_that.selectedEdible,_that.name,_that.description,_that.amountUnit,_that.amountValue,_that.nutritionFacts);case _:
  return null;

}
}

}

/// @nodoc


class _PortionFormUiState extends PortionFormUiState {
  const _PortionFormUiState({this.selectedEdible, this.name = '', this.description = '', this.amountUnit = Unit.gram, this.amountValue, final  List<NutritionFacts>? nutritionFacts}): _nutritionFacts = nutritionFacts,super._();
  

@override final  Edible? selectedEdible;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  Unit? amountUnit;
@override final  double? amountValue;
 final  List<NutritionFacts>? _nutritionFacts;
@override List<NutritionFacts>? get nutritionFacts {
  final value = _nutritionFacts;
  if (value == null) return null;
  if (_nutritionFacts is EqualUnmodifiableListView) return _nutritionFacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PortionFormUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortionFormUiStateCopyWith<_PortionFormUiState> get copyWith => __$PortionFormUiStateCopyWithImpl<_PortionFormUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortionFormUiState&&(identical(other.selectedEdible, selectedEdible) || other.selectedEdible == selectedEdible)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.amountUnit, amountUnit) || other.amountUnit == amountUnit)&&(identical(other.amountValue, amountValue) || other.amountValue == amountValue)&&const DeepCollectionEquality().equals(other._nutritionFacts, _nutritionFacts));
}


@override
int get hashCode => Object.hash(runtimeType,selectedEdible,name,description,amountUnit,amountValue,const DeepCollectionEquality().hash(_nutritionFacts));

@override
String toString() {
  return 'PortionFormUiState(selectedEdible: $selectedEdible, name: $name, description: $description, amountUnit: $amountUnit, amountValue: $amountValue, nutritionFacts: $nutritionFacts)';
}


}

/// @nodoc
abstract mixin class _$PortionFormUiStateCopyWith<$Res> implements $PortionFormUiStateCopyWith<$Res> {
  factory _$PortionFormUiStateCopyWith(_PortionFormUiState value, $Res Function(_PortionFormUiState) _then) = __$PortionFormUiStateCopyWithImpl;
@override @useResult
$Res call({
 Edible? selectedEdible, String name, String description, Unit? amountUnit, double? amountValue, List<NutritionFacts>? nutritionFacts
});




}
/// @nodoc
class __$PortionFormUiStateCopyWithImpl<$Res>
    implements _$PortionFormUiStateCopyWith<$Res> {
  __$PortionFormUiStateCopyWithImpl(this._self, this._then);

  final _PortionFormUiState _self;
  final $Res Function(_PortionFormUiState) _then;

/// Create a copy of PortionFormUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedEdible = freezed,Object? name = null,Object? description = null,Object? amountUnit = freezed,Object? amountValue = freezed,Object? nutritionFacts = freezed,}) {
  return _then(_PortionFormUiState(
selectedEdible: freezed == selectedEdible ? _self.selectedEdible : selectedEdible // ignore: cast_nullable_to_non_nullable
as Edible?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amountUnit: freezed == amountUnit ? _self.amountUnit : amountUnit // ignore: cast_nullable_to_non_nullable
as Unit?,amountValue: freezed == amountValue ? _self.amountValue : amountValue // ignore: cast_nullable_to_non_nullable
as double?,nutritionFacts: freezed == nutritionFacts ? _self._nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFacts>?,
  ));
}


}

// dart format on
