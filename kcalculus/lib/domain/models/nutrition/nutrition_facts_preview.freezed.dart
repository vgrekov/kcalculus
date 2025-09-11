// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFactsPreview {
  Amount get per;
  Amount get calories;
  Amount? get fat;
  Amount? get carbs;
  Amount? get protein;
  Amount? get fiber;

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionFactsPreviewCopyWith<NutritionFactsPreview> get copyWith =>
      _$NutritionFactsPreviewCopyWithImpl<NutritionFactsPreview>(
          this as NutritionFactsPreview, _$identity);

  /// Serializes this NutritionFactsPreview to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionFactsPreview &&
            (identical(other.per, per) || other.per == per) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.fat, fat) || other.fat == fat) &&
            (identical(other.carbs, carbs) || other.carbs == carbs) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.fiber, fiber) || other.fiber == fiber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, per, calories, fat, carbs, protein, fiber);

  @override
  String toString() {
    return 'NutritionFactsPreview(per: $per, calories: $calories, fat: $fat, carbs: $carbs, protein: $protein, fiber: $fiber)';
  }
}

/// @nodoc
abstract mixin class $NutritionFactsPreviewCopyWith<$Res> {
  factory $NutritionFactsPreviewCopyWith(NutritionFactsPreview value,
          $Res Function(NutritionFactsPreview) _then) =
      _$NutritionFactsPreviewCopyWithImpl;
  @useResult
  $Res call(
      {Amount per,
      Amount calories,
      Amount? fat,
      Amount? carbs,
      Amount? protein,
      Amount? fiber});

  $AmountCopyWith<$Res> get per;
  $AmountCopyWith<$Res> get calories;
  $AmountCopyWith<$Res>? get fat;
  $AmountCopyWith<$Res>? get carbs;
  $AmountCopyWith<$Res>? get protein;
  $AmountCopyWith<$Res>? get fiber;
}

/// @nodoc
class _$NutritionFactsPreviewCopyWithImpl<$Res>
    implements $NutritionFactsPreviewCopyWith<$Res> {
  _$NutritionFactsPreviewCopyWithImpl(this._self, this._then);

  final NutritionFactsPreview _self;
  final $Res Function(NutritionFactsPreview) _then;

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? per = null,
    Object? calories = null,
    Object? fat = freezed,
    Object? carbs = freezed,
    Object? protein = freezed,
    Object? fiber = freezed,
  }) {
    return _then(_self.copyWith(
      per: null == per
          ? _self.per
          : per // ignore: cast_nullable_to_non_nullable
              as Amount,
      calories: null == calories
          ? _self.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as Amount,
      fat: freezed == fat
          ? _self.fat
          : fat // ignore: cast_nullable_to_non_nullable
              as Amount?,
      carbs: freezed == carbs
          ? _self.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as Amount?,
      protein: freezed == protein
          ? _self.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as Amount?,
      fiber: freezed == fiber
          ? _self.fiber
          : fiber // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ));
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get per {
    return $AmountCopyWith<$Res>(_self.per, (value) {
      return _then(_self.copyWith(per: value));
    });
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get calories {
    return $AmountCopyWith<$Res>(_self.calories, (value) {
      return _then(_self.copyWith(calories: value));
    });
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get fat {
    if (_self.fat == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.fat!, (value) {
      return _then(_self.copyWith(fat: value));
    });
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get carbs {
    if (_self.carbs == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.carbs!, (value) {
      return _then(_self.copyWith(carbs: value));
    });
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get protein {
    if (_self.protein == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.protein!, (value) {
      return _then(_self.copyWith(protein: value));
    });
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get fiber {
    if (_self.fiber == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.fiber!, (value) {
      return _then(_self.copyWith(fiber: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NutritionFactsPreview extends NutritionFactsPreview {
  const _NutritionFactsPreview(
      {required this.per,
      required this.calories,
      this.fat,
      this.carbs,
      this.protein,
      this.fiber})
      : super._();
  factory _NutritionFactsPreview.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactsPreviewFromJson(json);

  @override
  final Amount per;
  @override
  final Amount calories;
  @override
  final Amount? fat;
  @override
  final Amount? carbs;
  @override
  final Amount? protein;
  @override
  final Amount? fiber;

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionFactsPreviewCopyWith<_NutritionFactsPreview> get copyWith =>
      __$NutritionFactsPreviewCopyWithImpl<_NutritionFactsPreview>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutritionFactsPreviewToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionFactsPreview &&
            (identical(other.per, per) || other.per == per) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.fat, fat) || other.fat == fat) &&
            (identical(other.carbs, carbs) || other.carbs == carbs) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.fiber, fiber) || other.fiber == fiber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, per, calories, fat, carbs, protein, fiber);

  @override
  String toString() {
    return 'NutritionFactsPreview(per: $per, calories: $calories, fat: $fat, carbs: $carbs, protein: $protein, fiber: $fiber)';
  }
}

/// @nodoc
abstract mixin class _$NutritionFactsPreviewCopyWith<$Res>
    implements $NutritionFactsPreviewCopyWith<$Res> {
  factory _$NutritionFactsPreviewCopyWith(_NutritionFactsPreview value,
          $Res Function(_NutritionFactsPreview) _then) =
      __$NutritionFactsPreviewCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Amount per,
      Amount calories,
      Amount? fat,
      Amount? carbs,
      Amount? protein,
      Amount? fiber});

  @override
  $AmountCopyWith<$Res> get per;
  @override
  $AmountCopyWith<$Res> get calories;
  @override
  $AmountCopyWith<$Res>? get fat;
  @override
  $AmountCopyWith<$Res>? get carbs;
  @override
  $AmountCopyWith<$Res>? get protein;
  @override
  $AmountCopyWith<$Res>? get fiber;
}

/// @nodoc
class __$NutritionFactsPreviewCopyWithImpl<$Res>
    implements _$NutritionFactsPreviewCopyWith<$Res> {
  __$NutritionFactsPreviewCopyWithImpl(this._self, this._then);

  final _NutritionFactsPreview _self;
  final $Res Function(_NutritionFactsPreview) _then;

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? per = null,
    Object? calories = null,
    Object? fat = freezed,
    Object? carbs = freezed,
    Object? protein = freezed,
    Object? fiber = freezed,
  }) {
    return _then(_NutritionFactsPreview(
      per: null == per
          ? _self.per
          : per // ignore: cast_nullable_to_non_nullable
              as Amount,
      calories: null == calories
          ? _self.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as Amount,
      fat: freezed == fat
          ? _self.fat
          : fat // ignore: cast_nullable_to_non_nullable
              as Amount?,
      carbs: freezed == carbs
          ? _self.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as Amount?,
      protein: freezed == protein
          ? _self.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as Amount?,
      fiber: freezed == fiber
          ? _self.fiber
          : fiber // ignore: cast_nullable_to_non_nullable
              as Amount?,
    ));
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get per {
    return $AmountCopyWith<$Res>(_self.per, (value) {
      return _then(_self.copyWith(per: value));
    });
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get calories {
    return $AmountCopyWith<$Res>(_self.calories, (value) {
      return _then(_self.copyWith(calories: value));
    });
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get fat {
    if (_self.fat == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.fat!, (value) {
      return _then(_self.copyWith(fat: value));
    });
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get carbs {
    if (_self.carbs == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.carbs!, (value) {
      return _then(_self.copyWith(carbs: value));
    });
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get protein {
    if (_self.protein == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.protein!, (value) {
      return _then(_self.copyWith(protein: value));
    });
  }

  /// Create a copy of NutritionFactsPreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res>? get fiber {
    if (_self.fiber == null) {
      return null;
    }

    return $AmountCopyWith<$Res>(_self.fiber!, (value) {
      return _then(_self.copyWith(fiber: value));
    });
  }
}

// dart format on
