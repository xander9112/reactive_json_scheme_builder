// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableOptions {
  TableDataOptions get data;
  TableSizeOptions get size;
  bool get sticky;
  bool get bordered;
  TableZebraStripedOptions? get zebraStriped;
  TableItemOptionsAlign? get verticalAlign;

  /// Create a copy of TableOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableOptionsCopyWith<TableOptions> get copyWith =>
      _$TableOptionsCopyWithImpl<TableOptions>(
          this as TableOptions, _$identity);

  /// Serializes this TableOptions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableOptions &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.sticky, sticky) || other.sticky == sticky) &&
            (identical(other.bordered, bordered) ||
                other.bordered == bordered) &&
            (identical(other.zebraStriped, zebraStriped) ||
                other.zebraStriped == zebraStriped) &&
            (identical(other.verticalAlign, verticalAlign) ||
                other.verticalAlign == verticalAlign));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, data, size, sticky, bordered, zebraStriped, verticalAlign);

  @override
  String toString() {
    return 'TableOptions(data: $data, size: $size, sticky: $sticky, bordered: $bordered, zebraStriped: $zebraStriped, verticalAlign: $verticalAlign)';
  }
}

/// @nodoc
abstract mixin class $TableOptionsCopyWith<$Res> {
  factory $TableOptionsCopyWith(
          TableOptions value, $Res Function(TableOptions) _then) =
      _$TableOptionsCopyWithImpl;
  @useResult
  $Res call(
      {TableDataOptions data,
      TableSizeOptions size,
      bool sticky,
      bool bordered,
      TableZebraStripedOptions? zebraStriped,
      TableItemOptionsAlign? verticalAlign});

  $TableDataOptionsCopyWith<$Res> get data;
}

/// @nodoc
class _$TableOptionsCopyWithImpl<$Res> implements $TableOptionsCopyWith<$Res> {
  _$TableOptionsCopyWithImpl(this._self, this._then);

  final TableOptions _self;
  final $Res Function(TableOptions) _then;

  /// Create a copy of TableOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? size = null,
    Object? sticky = null,
    Object? bordered = null,
    Object? zebraStriped = freezed,
    Object? verticalAlign = freezed,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as TableDataOptions,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as TableSizeOptions,
      sticky: null == sticky
          ? _self.sticky
          : sticky // ignore: cast_nullable_to_non_nullable
              as bool,
      bordered: null == bordered
          ? _self.bordered
          : bordered // ignore: cast_nullable_to_non_nullable
              as bool,
      zebraStriped: freezed == zebraStriped
          ? _self.zebraStriped
          : zebraStriped // ignore: cast_nullable_to_non_nullable
              as TableZebraStripedOptions?,
      verticalAlign: freezed == verticalAlign
          ? _self.verticalAlign
          : verticalAlign // ignore: cast_nullable_to_non_nullable
              as TableItemOptionsAlign?,
    ));
  }

  /// Create a copy of TableOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableDataOptionsCopyWith<$Res> get data {
    return $TableDataOptionsCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TableOptions].
extension TableOptionsPatterns on TableOptions {
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
    TResult Function(_TableOptions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableOptions() when $default != null:
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
    TResult Function(_TableOptions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableOptions():
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
    TResult? Function(_TableOptions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableOptions() when $default != null:
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
            TableDataOptions data,
            TableSizeOptions size,
            bool sticky,
            bool bordered,
            TableZebraStripedOptions? zebraStriped,
            TableItemOptionsAlign? verticalAlign)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableOptions() when $default != null:
        return $default(_that.data, _that.size, _that.sticky, _that.bordered,
            _that.zebraStriped, _that.verticalAlign);
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
            TableDataOptions data,
            TableSizeOptions size,
            bool sticky,
            bool bordered,
            TableZebraStripedOptions? zebraStriped,
            TableItemOptionsAlign? verticalAlign)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableOptions():
        return $default(_that.data, _that.size, _that.sticky, _that.bordered,
            _that.zebraStriped, _that.verticalAlign);
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
            TableDataOptions data,
            TableSizeOptions size,
            bool sticky,
            bool bordered,
            TableZebraStripedOptions? zebraStriped,
            TableItemOptionsAlign? verticalAlign)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableOptions() when $default != null:
        return $default(_that.data, _that.size, _that.sticky, _that.bordered,
            _that.zebraStriped, _that.verticalAlign);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TableOptions extends TableOptions {
  const _TableOptions(
      {required this.data,
      this.size = TableSizeOptions.middle,
      this.sticky = false,
      this.bordered = true,
      this.zebraStriped,
      this.verticalAlign})
      : super._();
  factory _TableOptions.fromJson(Map<String, dynamic> json) =>
      _$TableOptionsFromJson(json);

  @override
  final TableDataOptions data;
  @override
  @JsonKey()
  final TableSizeOptions size;
  @override
  @JsonKey()
  final bool sticky;
  @override
  @JsonKey()
  final bool bordered;
  @override
  final TableZebraStripedOptions? zebraStriped;
  @override
  final TableItemOptionsAlign? verticalAlign;

  /// Create a copy of TableOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableOptionsCopyWith<_TableOptions> get copyWith =>
      __$TableOptionsCopyWithImpl<_TableOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TableOptionsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableOptions &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.sticky, sticky) || other.sticky == sticky) &&
            (identical(other.bordered, bordered) ||
                other.bordered == bordered) &&
            (identical(other.zebraStriped, zebraStriped) ||
                other.zebraStriped == zebraStriped) &&
            (identical(other.verticalAlign, verticalAlign) ||
                other.verticalAlign == verticalAlign));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, data, size, sticky, bordered, zebraStriped, verticalAlign);

  @override
  String toString() {
    return 'TableOptions(data: $data, size: $size, sticky: $sticky, bordered: $bordered, zebraStriped: $zebraStriped, verticalAlign: $verticalAlign)';
  }
}

/// @nodoc
abstract mixin class _$TableOptionsCopyWith<$Res>
    implements $TableOptionsCopyWith<$Res> {
  factory _$TableOptionsCopyWith(
          _TableOptions value, $Res Function(_TableOptions) _then) =
      __$TableOptionsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {TableDataOptions data,
      TableSizeOptions size,
      bool sticky,
      bool bordered,
      TableZebraStripedOptions? zebraStriped,
      TableItemOptionsAlign? verticalAlign});

  @override
  $TableDataOptionsCopyWith<$Res> get data;
}

/// @nodoc
class __$TableOptionsCopyWithImpl<$Res>
    implements _$TableOptionsCopyWith<$Res> {
  __$TableOptionsCopyWithImpl(this._self, this._then);

  final _TableOptions _self;
  final $Res Function(_TableOptions) _then;

  /// Create a copy of TableOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? size = null,
    Object? sticky = null,
    Object? bordered = null,
    Object? zebraStriped = freezed,
    Object? verticalAlign = freezed,
  }) {
    return _then(_TableOptions(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as TableDataOptions,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as TableSizeOptions,
      sticky: null == sticky
          ? _self.sticky
          : sticky // ignore: cast_nullable_to_non_nullable
              as bool,
      bordered: null == bordered
          ? _self.bordered
          : bordered // ignore: cast_nullable_to_non_nullable
              as bool,
      zebraStriped: freezed == zebraStriped
          ? _self.zebraStriped
          : zebraStriped // ignore: cast_nullable_to_non_nullable
              as TableZebraStripedOptions?,
      verticalAlign: freezed == verticalAlign
          ? _self.verticalAlign
          : verticalAlign // ignore: cast_nullable_to_non_nullable
              as TableItemOptionsAlign?,
    ));
  }

  /// Create a copy of TableOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableDataOptionsCopyWith<$Res> get data {
    return $TableDataOptionsCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
