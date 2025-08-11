// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_item_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableItemOptions {
  String get title;
  TableItemOptionsAlign get align;
  bool get fixed;
  num? get width;
  bool get ellipsis;
  bool get sortable;
  TableItemOptionsSortOrder get defaultSortOrder;

  /// Create a copy of TableItemOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableItemOptionsCopyWith<TableItemOptions> get copyWith =>
      _$TableItemOptionsCopyWithImpl<TableItemOptions>(
          this as TableItemOptions, _$identity);

  /// Serializes this TableItemOptions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableItemOptions &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.align, align) || other.align == align) &&
            (identical(other.fixed, fixed) || other.fixed == fixed) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.ellipsis, ellipsis) ||
                other.ellipsis == ellipsis) &&
            (identical(other.sortable, sortable) ||
                other.sortable == sortable) &&
            (identical(other.defaultSortOrder, defaultSortOrder) ||
                other.defaultSortOrder == defaultSortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, align, fixed, width,
      ellipsis, sortable, defaultSortOrder);

  @override
  String toString() {
    return 'TableItemOptions(title: $title, align: $align, fixed: $fixed, width: $width, ellipsis: $ellipsis, sortable: $sortable, defaultSortOrder: $defaultSortOrder)';
  }
}

/// @nodoc
abstract mixin class $TableItemOptionsCopyWith<$Res> {
  factory $TableItemOptionsCopyWith(
          TableItemOptions value, $Res Function(TableItemOptions) _then) =
      _$TableItemOptionsCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      TableItemOptionsAlign align,
      bool fixed,
      num? width,
      bool ellipsis,
      bool sortable,
      TableItemOptionsSortOrder defaultSortOrder});
}

/// @nodoc
class _$TableItemOptionsCopyWithImpl<$Res>
    implements $TableItemOptionsCopyWith<$Res> {
  _$TableItemOptionsCopyWithImpl(this._self, this._then);

  final TableItemOptions _self;
  final $Res Function(TableItemOptions) _then;

  /// Create a copy of TableItemOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? align = null,
    Object? fixed = null,
    Object? width = freezed,
    Object? ellipsis = null,
    Object? sortable = null,
    Object? defaultSortOrder = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      align: null == align
          ? _self.align
          : align // ignore: cast_nullable_to_non_nullable
              as TableItemOptionsAlign,
      fixed: null == fixed
          ? _self.fixed
          : fixed // ignore: cast_nullable_to_non_nullable
              as bool,
      width: freezed == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as num?,
      ellipsis: null == ellipsis
          ? _self.ellipsis
          : ellipsis // ignore: cast_nullable_to_non_nullable
              as bool,
      sortable: null == sortable
          ? _self.sortable
          : sortable // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultSortOrder: null == defaultSortOrder
          ? _self.defaultSortOrder
          : defaultSortOrder // ignore: cast_nullable_to_non_nullable
              as TableItemOptionsSortOrder,
    ));
  }
}

/// Adds pattern-matching-related methods to [TableItemOptions].
extension TableItemOptionsPatterns on TableItemOptions {
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
    TResult Function(_TableItemOptions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableItemOptions() when $default != null:
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
    TResult Function(_TableItemOptions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableItemOptions():
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
    TResult? Function(_TableItemOptions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableItemOptions() when $default != null:
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
            String title,
            TableItemOptionsAlign align,
            bool fixed,
            num? width,
            bool ellipsis,
            bool sortable,
            TableItemOptionsSortOrder defaultSortOrder)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableItemOptions() when $default != null:
        return $default(_that.title, _that.align, _that.fixed, _that.width,
            _that.ellipsis, _that.sortable, _that.defaultSortOrder);
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
            String title,
            TableItemOptionsAlign align,
            bool fixed,
            num? width,
            bool ellipsis,
            bool sortable,
            TableItemOptionsSortOrder defaultSortOrder)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableItemOptions():
        return $default(_that.title, _that.align, _that.fixed, _that.width,
            _that.ellipsis, _that.sortable, _that.defaultSortOrder);
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
            String title,
            TableItemOptionsAlign align,
            bool fixed,
            num? width,
            bool ellipsis,
            bool sortable,
            TableItemOptionsSortOrder defaultSortOrder)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableItemOptions() when $default != null:
        return $default(_that.title, _that.align, _that.fixed, _that.width,
            _that.ellipsis, _that.sortable, _that.defaultSortOrder);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TableItemOptions implements TableItemOptions {
  const _TableItemOptions(
      {required this.title,
      this.align = TableItemOptionsAlign.left,
      this.fixed = false,
      this.width,
      this.ellipsis = false,
      this.sortable = false,
      this.defaultSortOrder = TableItemOptionsSortOrder.none});
  factory _TableItemOptions.fromJson(Map<String, dynamic> json) =>
      _$TableItemOptionsFromJson(json);

  @override
  final String title;
  @override
  @JsonKey()
  final TableItemOptionsAlign align;
  @override
  @JsonKey()
  final bool fixed;
  @override
  final num? width;
  @override
  @JsonKey()
  final bool ellipsis;
  @override
  @JsonKey()
  final bool sortable;
  @override
  @JsonKey()
  final TableItemOptionsSortOrder defaultSortOrder;

  /// Create a copy of TableItemOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableItemOptionsCopyWith<_TableItemOptions> get copyWith =>
      __$TableItemOptionsCopyWithImpl<_TableItemOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TableItemOptionsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableItemOptions &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.align, align) || other.align == align) &&
            (identical(other.fixed, fixed) || other.fixed == fixed) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.ellipsis, ellipsis) ||
                other.ellipsis == ellipsis) &&
            (identical(other.sortable, sortable) ||
                other.sortable == sortable) &&
            (identical(other.defaultSortOrder, defaultSortOrder) ||
                other.defaultSortOrder == defaultSortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, align, fixed, width,
      ellipsis, sortable, defaultSortOrder);

  @override
  String toString() {
    return 'TableItemOptions(title: $title, align: $align, fixed: $fixed, width: $width, ellipsis: $ellipsis, sortable: $sortable, defaultSortOrder: $defaultSortOrder)';
  }
}

/// @nodoc
abstract mixin class _$TableItemOptionsCopyWith<$Res>
    implements $TableItemOptionsCopyWith<$Res> {
  factory _$TableItemOptionsCopyWith(
          _TableItemOptions value, $Res Function(_TableItemOptions) _then) =
      __$TableItemOptionsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      TableItemOptionsAlign align,
      bool fixed,
      num? width,
      bool ellipsis,
      bool sortable,
      TableItemOptionsSortOrder defaultSortOrder});
}

/// @nodoc
class __$TableItemOptionsCopyWithImpl<$Res>
    implements _$TableItemOptionsCopyWith<$Res> {
  __$TableItemOptionsCopyWithImpl(this._self, this._then);

  final _TableItemOptions _self;
  final $Res Function(_TableItemOptions) _then;

  /// Create a copy of TableItemOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? align = null,
    Object? fixed = null,
    Object? width = freezed,
    Object? ellipsis = null,
    Object? sortable = null,
    Object? defaultSortOrder = null,
  }) {
    return _then(_TableItemOptions(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      align: null == align
          ? _self.align
          : align // ignore: cast_nullable_to_non_nullable
              as TableItemOptionsAlign,
      fixed: null == fixed
          ? _self.fixed
          : fixed // ignore: cast_nullable_to_non_nullable
              as bool,
      width: freezed == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as num?,
      ellipsis: null == ellipsis
          ? _self.ellipsis
          : ellipsis // ignore: cast_nullable_to_non_nullable
              as bool,
      sortable: null == sortable
          ? _self.sortable
          : sortable // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultSortOrder: null == defaultSortOrder
          ? _self.defaultSortOrder
          : defaultSortOrder // ignore: cast_nullable_to_non_nullable
              as TableItemOptionsSortOrder,
    ));
  }
}

// dart format on
