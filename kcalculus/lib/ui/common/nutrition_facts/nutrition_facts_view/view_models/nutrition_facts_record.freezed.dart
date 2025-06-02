// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NutritionFactsRecord {
  Amount get perAmount => throw _privateConstructorUsedError;
  List<NutrientNode> get nodes => throw _privateConstructorUsedError;

  /// Create a copy of NutritionFactsRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionFactsRecordCopyWith<NutritionFactsRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionFactsRecordCopyWith<$Res> {
  factory $NutritionFactsRecordCopyWith(NutritionFactsRecord value,
          $Res Function(NutritionFactsRecord) then) =
      _$NutritionFactsRecordCopyWithImpl<$Res, NutritionFactsRecord>;
  @useResult
  $Res call({Amount perAmount, List<NutrientNode> nodes});

  $AmountCopyWith<$Res> get perAmount;
}

/// @nodoc
class _$NutritionFactsRecordCopyWithImpl<$Res,
        $Val extends NutritionFactsRecord>
    implements $NutritionFactsRecordCopyWith<$Res> {
  _$NutritionFactsRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionFactsRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perAmount = null,
    Object? nodes = null,
  }) {
    return _then(_value.copyWith(
      perAmount: null == perAmount
          ? _value.perAmount
          : perAmount // ignore: cast_nullable_to_non_nullable
              as Amount,
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<NutrientNode>,
    ) as $Val);
  }

  /// Create a copy of NutritionFactsRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get perAmount {
    return $AmountCopyWith<$Res>(_value.perAmount, (value) {
      return _then(_value.copyWith(perAmount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NutritionFactsRecordImplCopyWith<$Res>
    implements $NutritionFactsRecordCopyWith<$Res> {
  factory _$$NutritionFactsRecordImplCopyWith(_$NutritionFactsRecordImpl value,
          $Res Function(_$NutritionFactsRecordImpl) then) =
      __$$NutritionFactsRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Amount perAmount, List<NutrientNode> nodes});

  @override
  $AmountCopyWith<$Res> get perAmount;
}

/// @nodoc
class __$$NutritionFactsRecordImplCopyWithImpl<$Res>
    extends _$NutritionFactsRecordCopyWithImpl<$Res, _$NutritionFactsRecordImpl>
    implements _$$NutritionFactsRecordImplCopyWith<$Res> {
  __$$NutritionFactsRecordImplCopyWithImpl(_$NutritionFactsRecordImpl _value,
      $Res Function(_$NutritionFactsRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionFactsRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perAmount = null,
    Object? nodes = null,
  }) {
    return _then(_$NutritionFactsRecordImpl(
      perAmount: null == perAmount
          ? _value.perAmount
          : perAmount // ignore: cast_nullable_to_non_nullable
              as Amount,
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<NutrientNode>,
    ));
  }
}

/// @nodoc

class _$NutritionFactsRecordImpl implements _NutritionFactsRecord {
  const _$NutritionFactsRecordImpl(
      {required this.perAmount, required final List<NutrientNode> nodes})
      : _nodes = nodes;

  @override
  final Amount perAmount;
  final List<NutrientNode> _nodes;
  @override
  List<NutrientNode> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  @override
  String toString() {
    return 'NutritionFactsRecord(perAmount: $perAmount, nodes: $nodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionFactsRecordImpl &&
            (identical(other.perAmount, perAmount) ||
                other.perAmount == perAmount) &&
            const DeepCollectionEquality().equals(other._nodes, _nodes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, perAmount, const DeepCollectionEquality().hash(_nodes));

  /// Create a copy of NutritionFactsRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionFactsRecordImplCopyWith<_$NutritionFactsRecordImpl>
      get copyWith =>
          __$$NutritionFactsRecordImplCopyWithImpl<_$NutritionFactsRecordImpl>(
              this, _$identity);
}

abstract class _NutritionFactsRecord implements NutritionFactsRecord {
  const factory _NutritionFactsRecord(
      {required final Amount perAmount,
      required final List<NutrientNode> nodes}) = _$NutritionFactsRecordImpl;

  @override
  Amount get perAmount;
  @override
  List<NutrientNode> get nodes;

  /// Create a copy of NutritionFactsRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionFactsRecordImplCopyWith<_$NutritionFactsRecordImpl>
      get copyWith => throw _privateConstructorUsedError;
}
