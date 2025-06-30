// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaintenanceTask {
  String Function(BuildContext) get title;
  FutureOr<bool> Function(Ref) get shouldRun;
  FutureOr<void> Function(Ref) get run;

  /// Create a copy of MaintenanceTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MaintenanceTaskCopyWith<MaintenanceTask> get copyWith =>
      _$MaintenanceTaskCopyWithImpl<MaintenanceTask>(
          this as MaintenanceTask, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaintenanceTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.shouldRun, shouldRun) ||
                other.shouldRun == shouldRun) &&
            (identical(other.run, run) || other.run == run));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, shouldRun, run);

  @override
  String toString() {
    return 'MaintenanceTask(title: $title, shouldRun: $shouldRun, run: $run)';
  }
}

/// @nodoc
abstract mixin class $MaintenanceTaskCopyWith<$Res> {
  factory $MaintenanceTaskCopyWith(
          MaintenanceTask value, $Res Function(MaintenanceTask) _then) =
      _$MaintenanceTaskCopyWithImpl;
  @useResult
  $Res call(
      {String Function(BuildContext) title,
      FutureOr<bool> Function(Ref) shouldRun,
      FutureOr<void> Function(Ref) run});
}

/// @nodoc
class _$MaintenanceTaskCopyWithImpl<$Res>
    implements $MaintenanceTaskCopyWith<$Res> {
  _$MaintenanceTaskCopyWithImpl(this._self, this._then);

  final MaintenanceTask _self;
  final $Res Function(MaintenanceTask) _then;

  /// Create a copy of MaintenanceTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? shouldRun = null,
    Object? run = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String Function(BuildContext),
      shouldRun: null == shouldRun
          ? _self.shouldRun
          : shouldRun // ignore: cast_nullable_to_non_nullable
              as FutureOr<bool> Function(Ref),
      run: null == run
          ? _self.run
          : run // ignore: cast_nullable_to_non_nullable
              as FutureOr<void> Function(Ref),
    ));
  }
}

/// @nodoc

class _MaintenanceTask implements MaintenanceTask {
  const _MaintenanceTask(
      {required this.title, required this.shouldRun, required this.run});

  @override
  final String Function(BuildContext) title;
  @override
  final FutureOr<bool> Function(Ref) shouldRun;
  @override
  final FutureOr<void> Function(Ref) run;

  /// Create a copy of MaintenanceTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MaintenanceTaskCopyWith<_MaintenanceTask> get copyWith =>
      __$MaintenanceTaskCopyWithImpl<_MaintenanceTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MaintenanceTask &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.shouldRun, shouldRun) ||
                other.shouldRun == shouldRun) &&
            (identical(other.run, run) || other.run == run));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, shouldRun, run);

  @override
  String toString() {
    return 'MaintenanceTask(title: $title, shouldRun: $shouldRun, run: $run)';
  }
}

/// @nodoc
abstract mixin class _$MaintenanceTaskCopyWith<$Res>
    implements $MaintenanceTaskCopyWith<$Res> {
  factory _$MaintenanceTaskCopyWith(
          _MaintenanceTask value, $Res Function(_MaintenanceTask) _then) =
      __$MaintenanceTaskCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String Function(BuildContext) title,
      FutureOr<bool> Function(Ref) shouldRun,
      FutureOr<void> Function(Ref) run});
}

/// @nodoc
class __$MaintenanceTaskCopyWithImpl<$Res>
    implements _$MaintenanceTaskCopyWith<$Res> {
  __$MaintenanceTaskCopyWithImpl(this._self, this._then);

  final _MaintenanceTask _self;
  final $Res Function(_MaintenanceTask) _then;

  /// Create a copy of MaintenanceTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? shouldRun = null,
    Object? run = null,
  }) {
    return _then(_MaintenanceTask(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String Function(BuildContext),
      shouldRun: null == shouldRun
          ? _self.shouldRun
          : shouldRun // ignore: cast_nullable_to_non_nullable
              as FutureOr<bool> Function(Ref),
      run: null == run
          ? _self.run
          : run // ignore: cast_nullable_to_non_nullable
              as FutureOr<void> Function(Ref),
    ));
  }
}

// dart format on
