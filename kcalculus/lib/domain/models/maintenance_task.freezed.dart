// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaintenanceTask {
  String Function(BuildContext) get title => throw _privateConstructorUsedError;
  FutureOr<bool> Function(Ref<Object?>) get shouldRun =>
      throw _privateConstructorUsedError;
  FutureOr<void> Function(Ref<Object?>) get run =>
      throw _privateConstructorUsedError;

  /// Create a copy of MaintenanceTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaintenanceTaskCopyWith<MaintenanceTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceTaskCopyWith<$Res> {
  factory $MaintenanceTaskCopyWith(
          MaintenanceTask value, $Res Function(MaintenanceTask) then) =
      _$MaintenanceTaskCopyWithImpl<$Res, MaintenanceTask>;
  @useResult
  $Res call(
      {String Function(BuildContext) title,
      FutureOr<bool> Function(Ref<Object?>) shouldRun,
      FutureOr<void> Function(Ref<Object?>) run});
}

/// @nodoc
class _$MaintenanceTaskCopyWithImpl<$Res, $Val extends MaintenanceTask>
    implements $MaintenanceTaskCopyWith<$Res> {
  _$MaintenanceTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaintenanceTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? shouldRun = null,
    Object? run = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String Function(BuildContext),
      shouldRun: null == shouldRun
          ? _value.shouldRun
          : shouldRun // ignore: cast_nullable_to_non_nullable
              as FutureOr<bool> Function(Ref<Object?>),
      run: null == run
          ? _value.run
          : run // ignore: cast_nullable_to_non_nullable
              as FutureOr<void> Function(Ref<Object?>),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaintenanceTaskImplCopyWith<$Res>
    implements $MaintenanceTaskCopyWith<$Res> {
  factory _$$MaintenanceTaskImplCopyWith(_$MaintenanceTaskImpl value,
          $Res Function(_$MaintenanceTaskImpl) then) =
      __$$MaintenanceTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String Function(BuildContext) title,
      FutureOr<bool> Function(Ref<Object?>) shouldRun,
      FutureOr<void> Function(Ref<Object?>) run});
}

/// @nodoc
class __$$MaintenanceTaskImplCopyWithImpl<$Res>
    extends _$MaintenanceTaskCopyWithImpl<$Res, _$MaintenanceTaskImpl>
    implements _$$MaintenanceTaskImplCopyWith<$Res> {
  __$$MaintenanceTaskImplCopyWithImpl(
      _$MaintenanceTaskImpl _value, $Res Function(_$MaintenanceTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaintenanceTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? shouldRun = null,
    Object? run = null,
  }) {
    return _then(_$MaintenanceTaskImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String Function(BuildContext),
      shouldRun: null == shouldRun
          ? _value.shouldRun
          : shouldRun // ignore: cast_nullable_to_non_nullable
              as FutureOr<bool> Function(Ref<Object?>),
      run: null == run
          ? _value.run
          : run // ignore: cast_nullable_to_non_nullable
              as FutureOr<void> Function(Ref<Object?>),
    ));
  }
}

/// @nodoc

class _$MaintenanceTaskImpl implements _MaintenanceTask {
  const _$MaintenanceTaskImpl(
      {required this.title, required this.shouldRun, required this.run});

  @override
  final String Function(BuildContext) title;
  @override
  final FutureOr<bool> Function(Ref<Object?>) shouldRun;
  @override
  final FutureOr<void> Function(Ref<Object?>) run;

  @override
  String toString() {
    return 'MaintenanceTask(title: $title, shouldRun: $shouldRun, run: $run)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceTaskImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.shouldRun, shouldRun) ||
                other.shouldRun == shouldRun) &&
            (identical(other.run, run) || other.run == run));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, shouldRun, run);

  /// Create a copy of MaintenanceTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceTaskImplCopyWith<_$MaintenanceTaskImpl> get copyWith =>
      __$$MaintenanceTaskImplCopyWithImpl<_$MaintenanceTaskImpl>(
          this, _$identity);
}

abstract class _MaintenanceTask implements MaintenanceTask {
  const factory _MaintenanceTask(
          {required final String Function(BuildContext) title,
          required final FutureOr<bool> Function(Ref<Object?>) shouldRun,
          required final FutureOr<void> Function(Ref<Object?>) run}) =
      _$MaintenanceTaskImpl;

  @override
  String Function(BuildContext) get title;
  @override
  FutureOr<bool> Function(Ref<Object?>) get shouldRun;
  @override
  FutureOr<void> Function(Ref<Object?>) get run;

  /// Create a copy of MaintenanceTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceTaskImplCopyWith<_$MaintenanceTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
