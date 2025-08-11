// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_data_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableDataOptions {
  String? get source;
  Map<String, TableItemOptions> get items;

  /// Create a copy of TableDataOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableDataOptionsCopyWith<TableDataOptions> get copyWith =>
      _$TableDataOptionsCopyWithImpl<TableDataOptions>(
          this as TableDataOptions, _$identity);

  /// Serializes this TableDataOptions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableDataOptions &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, source, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'TableDataOptions(source: $source, items: $items)';
  }
}

/// @nodoc
abstract mixin class $TableDataOptionsCopyWith<$Res> {
  factory $TableDataOptionsCopyWith(
          TableDataOptions value, $Res Function(TableDataOptions) _then) =
      _$TableDataOptionsCopyWithImpl;
  @useResult
  $Res call({String? source, Map<String, TableItemOptions> items});
}

/// @nodoc
class _$TableDataOptionsCopyWithImpl<$Res>
    implements $TableDataOptionsCopyWith<$Res> {
  _$TableDataOptionsCopyWithImpl(this._self, this._then);

  final TableDataOptions _self;
  final $Res Function(TableDataOptions) _then;

  /// Create a copy of TableDataOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = freezed,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<String, TableItemOptions>,
    ));
  }
}

/// Adds pattern-matching-related methods to [TableDataOptions].
extension TableDataOptionsPatterns on TableDataOptions {
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
    TResult Function(_TableDataOptions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableDataOptions() when $default != null:
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
    TResult Function(_TableDataOptions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDataOptions():
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
    TResult? Function(_TableDataOptions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDataOptions() when $default != null:
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
    TResult Function(String? source, Map<String, TableItemOptions> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableDataOptions() when $default != null:
        return $default(_that.source, _that.items);
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
    TResult Function(String? source, Map<String, TableItemOptions> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDataOptions():
        return $default(_that.source, _that.items);
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
    TResult? Function(String? source, Map<String, TableItemOptions> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDataOptions() when $default != null:
        return $default(_that.source, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TableDataOptions implements TableDataOptions {
  const _TableDataOptions(
      {this.source, final Map<String, TableItemOptions> items = const {}})
      : _items = items;
  factory _TableDataOptions.fromJson(Map<String, dynamic> json) =>
      _$TableDataOptionsFromJson(json);

  @override
  final String? source;
  final Map<String, TableItemOptions> _items;
  @override
  @JsonKey()
  Map<String, TableItemOptions> get items {
    if (_items is EqualUnmodifiableMapView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  /// Create a copy of TableDataOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableDataOptionsCopyWith<_TableDataOptions> get copyWith =>
      __$TableDataOptionsCopyWithImpl<_TableDataOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TableDataOptionsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableDataOptions &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, source, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'TableDataOptions(source: $source, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$TableDataOptionsCopyWith<$Res>
    implements $TableDataOptionsCopyWith<$Res> {
  factory _$TableDataOptionsCopyWith(
          _TableDataOptions value, $Res Function(_TableDataOptions) _then) =
      __$TableDataOptionsCopyWithImpl;
  @override
  @useResult
  $Res call({String? source, Map<String, TableItemOptions> items});
}

/// @nodoc
class __$TableDataOptionsCopyWithImpl<$Res>
    implements _$TableDataOptionsCopyWith<$Res> {
  __$TableDataOptionsCopyWithImpl(this._self, this._then);

  final _TableDataOptions _self;
  final $Res Function(_TableDataOptions) _then;

  /// Create a copy of TableDataOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? source = freezed,
    Object? items = null,
  }) {
    return _then(_TableDataOptions(
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<String, TableItemOptions>,
    ));
  }
}

// dart format on
