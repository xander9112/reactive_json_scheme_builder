// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drop_down_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DropDownOptions {
  DropDownDataOptions? get data;
  TableSizeOptions get size;
  String? get label;

  /// Create a copy of DropDownOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DropDownOptionsCopyWith<DropDownOptions> get copyWith =>
      _$DropDownOptionsCopyWithImpl<DropDownOptions>(
          this as DropDownOptions, _$identity);

  /// Serializes this DropDownOptions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DropDownOptions &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, size, label);

  @override
  String toString() {
    return 'DropDownOptions(data: $data, size: $size, label: $label)';
  }
}

/// @nodoc
abstract mixin class $DropDownOptionsCopyWith<$Res> {
  factory $DropDownOptionsCopyWith(
          DropDownOptions value, $Res Function(DropDownOptions) _then) =
      _$DropDownOptionsCopyWithImpl;
  @useResult
  $Res call({DropDownDataOptions? data, TableSizeOptions size, String? label});

  $DropDownDataOptionsCopyWith<$Res>? get data;
}

/// @nodoc
class _$DropDownOptionsCopyWithImpl<$Res>
    implements $DropDownOptionsCopyWith<$Res> {
  _$DropDownOptionsCopyWithImpl(this._self, this._then);

  final DropDownOptions _self;
  final $Res Function(DropDownOptions) _then;

  /// Create a copy of DropDownOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? size = null,
    Object? label = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as DropDownDataOptions?,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as TableSizeOptions,
      label: freezed == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of DropDownOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DropDownDataOptionsCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DropDownDataOptionsCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DropDownOptions].
extension DropDownOptionsPatterns on DropDownOptions {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DropDownOptions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DropDownOptions() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DropDownOptions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DropDownOptions():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DropDownOptions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DropDownOptions() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            DropDownDataOptions? data, TableSizeOptions size, String? label)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DropDownOptions() when $default != null:
        return $default(_that.data, _that.size, _that.label);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            DropDownDataOptions? data, TableSizeOptions size, String? label)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DropDownOptions():
        return $default(_that.data, _that.size, _that.label);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            DropDownDataOptions? data, TableSizeOptions size, String? label)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DropDownOptions() when $default != null:
        return $default(_that.data, _that.size, _that.label);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DropDownOptions extends DropDownOptions {
  const _DropDownOptions(
      {this.data, this.size = TableSizeOptions.middle, this.label})
      : super._();
  factory _DropDownOptions.fromJson(Map<String, dynamic> json) =>
      _$DropDownOptionsFromJson(json);

  @override
  final DropDownDataOptions? data;
  @override
  @JsonKey()
  final TableSizeOptions size;
  @override
  final String? label;

  /// Create a copy of DropDownOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DropDownOptionsCopyWith<_DropDownOptions> get copyWith =>
      __$DropDownOptionsCopyWithImpl<_DropDownOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DropDownOptionsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DropDownOptions &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, size, label);

  @override
  String toString() {
    return 'DropDownOptions(data: $data, size: $size, label: $label)';
  }
}

/// @nodoc
abstract mixin class _$DropDownOptionsCopyWith<$Res>
    implements $DropDownOptionsCopyWith<$Res> {
  factory _$DropDownOptionsCopyWith(
          _DropDownOptions value, $Res Function(_DropDownOptions) _then) =
      __$DropDownOptionsCopyWithImpl;
  @override
  @useResult
  $Res call({DropDownDataOptions? data, TableSizeOptions size, String? label});

  @override
  $DropDownDataOptionsCopyWith<$Res>? get data;
}

/// @nodoc
class __$DropDownOptionsCopyWithImpl<$Res>
    implements _$DropDownOptionsCopyWith<$Res> {
  __$DropDownOptionsCopyWithImpl(this._self, this._then);

  final _DropDownOptions _self;
  final $Res Function(_DropDownOptions) _then;

  /// Create a copy of DropDownOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
    Object? size = null,
    Object? label = freezed,
  }) {
    return _then(_DropDownOptions(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as DropDownDataOptions?,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as TableSizeOptions,
      label: freezed == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of DropDownOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DropDownDataOptionsCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DropDownDataOptionsCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
