// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drop_down_data_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DropDownDataOptions {
  String? get source;
  Map<String, dynamic> get items;

  /// Create a copy of DropDownDataOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DropDownDataOptionsCopyWith<DropDownDataOptions> get copyWith =>
      _$DropDownDataOptionsCopyWithImpl<DropDownDataOptions>(
          this as DropDownDataOptions, _$identity);

  /// Serializes this DropDownDataOptions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DropDownDataOptions &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, source, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'DropDownDataOptions(source: $source, items: $items)';
  }
}

/// @nodoc
abstract mixin class $DropDownDataOptionsCopyWith<$Res> {
  factory $DropDownDataOptionsCopyWith(
          DropDownDataOptions value, $Res Function(DropDownDataOptions) _then) =
      _$DropDownDataOptionsCopyWithImpl;
  @useResult
  $Res call({String? source, Map<String, dynamic> items});
}

/// @nodoc
class _$DropDownDataOptionsCopyWithImpl<$Res>
    implements $DropDownDataOptionsCopyWith<$Res> {
  _$DropDownDataOptionsCopyWithImpl(this._self, this._then);

  final DropDownDataOptions _self;
  final $Res Function(DropDownDataOptions) _then;

  /// Create a copy of DropDownDataOptions
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
              as Map<String, dynamic>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DropDownDataOptions].
extension DropDownDataOptionsPatterns on DropDownDataOptions {
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
    TResult Function(_DropDownDataOptions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DropDownDataOptions() when $default != null:
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
    TResult Function(_DropDownDataOptions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DropDownDataOptions():
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
    TResult? Function(_DropDownDataOptions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DropDownDataOptions() when $default != null:
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
    TResult Function(String? source, Map<String, dynamic> items)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DropDownDataOptions() when $default != null:
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
    TResult Function(String? source, Map<String, dynamic> items) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DropDownDataOptions():
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
    TResult? Function(String? source, Map<String, dynamic> items)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DropDownDataOptions() when $default != null:
        return $default(_that.source, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DropDownDataOptions implements DropDownDataOptions {
  const _DropDownDataOptions(
      {this.source, final Map<String, dynamic> items = const {}})
      : _items = items;
  factory _DropDownDataOptions.fromJson(Map<String, dynamic> json) =>
      _$DropDownDataOptionsFromJson(json);

  @override
  final String? source;
  final Map<String, dynamic> _items;
  @override
  @JsonKey()
  Map<String, dynamic> get items {
    if (_items is EqualUnmodifiableMapView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  /// Create a copy of DropDownDataOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DropDownDataOptionsCopyWith<_DropDownDataOptions> get copyWith =>
      __$DropDownDataOptionsCopyWithImpl<_DropDownDataOptions>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DropDownDataOptionsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DropDownDataOptions &&
            (identical(other.source, source) || other.source == source) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, source, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'DropDownDataOptions(source: $source, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$DropDownDataOptionsCopyWith<$Res>
    implements $DropDownDataOptionsCopyWith<$Res> {
  factory _$DropDownDataOptionsCopyWith(_DropDownDataOptions value,
          $Res Function(_DropDownDataOptions) _then) =
      __$DropDownDataOptionsCopyWithImpl;
  @override
  @useResult
  $Res call({String? source, Map<String, dynamic> items});
}

/// @nodoc
class __$DropDownDataOptionsCopyWithImpl<$Res>
    implements _$DropDownDataOptionsCopyWith<$Res> {
  __$DropDownDataOptionsCopyWithImpl(this._self, this._then);

  final _DropDownDataOptions _self;
  final $Res Function(_DropDownDataOptions) _then;

  /// Create a copy of DropDownDataOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? source = freezed,
    Object? items = null,
  }) {
    return _then(_DropDownDataOptions(
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

// dart format on
