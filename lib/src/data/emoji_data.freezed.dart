// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emoji_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'emojis')
  List<String> get emojiIds => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({String id, @JsonKey(name: 'emojis') List<String> emojiIds});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emojiIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      emojiIds: null == emojiIds
          ? _value.emojiIds
          : emojiIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, @JsonKey(name: 'emojis') List<String> emojiIds});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? emojiIds = null,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      emojiIds: null == emojiIds
          ? _value._emojiIds
          : emojiIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {required this.id,
      @JsonKey(name: 'emojis') required final List<String> emojiIds})
      : _emojiIds = emojiIds;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final String id;
  final List<String> _emojiIds;
  @override
  @JsonKey(name: 'emojis')
  List<String> get emojiIds {
    if (_emojiIds is EqualUnmodifiableListView) return _emojiIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emojiIds);
  }

  @override
  String toString() {
    return 'Category(id: $id, emojiIds: $emojiIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._emojiIds, _emojiIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_emojiIds));

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
          {required final String id,
          @JsonKey(name: 'emojis') required final List<String> emojiIds}) =
      _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'emojis')
  List<String> get emojiIds;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Skin _$SkinFromJson(Map<String, dynamic> json) {
  return _Skin.fromJson(json);
}

/// @nodoc
mixin _$Skin {
  String get unified => throw _privateConstructorUsedError;
  String get native => throw _privateConstructorUsedError;

  /// Serializes this Skin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Skin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkinCopyWith<Skin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkinCopyWith<$Res> {
  factory $SkinCopyWith(Skin value, $Res Function(Skin) then) =
      _$SkinCopyWithImpl<$Res, Skin>;
  @useResult
  $Res call({String unified, String native});
}

/// @nodoc
class _$SkinCopyWithImpl<$Res, $Val extends Skin>
    implements $SkinCopyWith<$Res> {
  _$SkinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Skin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unified = null,
    Object? native = null,
  }) {
    return _then(_value.copyWith(
      unified: null == unified
          ? _value.unified
          : unified // ignore: cast_nullable_to_non_nullable
              as String,
      native: null == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkinImplCopyWith<$Res> implements $SkinCopyWith<$Res> {
  factory _$$SkinImplCopyWith(
          _$SkinImpl value, $Res Function(_$SkinImpl) then) =
      __$$SkinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String unified, String native});
}

/// @nodoc
class __$$SkinImplCopyWithImpl<$Res>
    extends _$SkinCopyWithImpl<$Res, _$SkinImpl>
    implements _$$SkinImplCopyWith<$Res> {
  __$$SkinImplCopyWithImpl(_$SkinImpl _value, $Res Function(_$SkinImpl) _then)
      : super(_value, _then);

  /// Create a copy of Skin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unified = null,
    Object? native = null,
  }) {
    return _then(_$SkinImpl(
      unified: null == unified
          ? _value.unified
          : unified // ignore: cast_nullable_to_non_nullable
              as String,
      native: null == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkinImpl implements _Skin {
  const _$SkinImpl({required this.unified, required this.native});

  factory _$SkinImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkinImplFromJson(json);

  @override
  final String unified;
  @override
  final String native;

  @override
  String toString() {
    return 'Skin(unified: $unified, native: $native)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkinImpl &&
            (identical(other.unified, unified) || other.unified == unified) &&
            (identical(other.native, native) || other.native == native));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unified, native);

  /// Create a copy of Skin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkinImplCopyWith<_$SkinImpl> get copyWith =>
      __$$SkinImplCopyWithImpl<_$SkinImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkinImplToJson(
      this,
    );
  }
}

abstract class _Skin implements Skin {
  const factory _Skin(
      {required final String unified,
      required final String native}) = _$SkinImpl;

  factory _Skin.fromJson(Map<String, dynamic> json) = _$SkinImpl.fromJson;

  @override
  String get unified;
  @override
  String get native;

  /// Create a copy of Skin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkinImplCopyWith<_$SkinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Emoji _$EmojiFromJson(Map<String, dynamic> json) {
  return _Emoji.fromJson(json);
}

/// @nodoc
mixin _$Emoji {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Set<String> get keywords => throw _privateConstructorUsedError;
  List<Skin> get skins => throw _privateConstructorUsedError;
  double get version => throw _privateConstructorUsedError;

  /// Serializes this Emoji to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Emoji
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmojiCopyWith<Emoji> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmojiCopyWith<$Res> {
  factory $EmojiCopyWith(Emoji value, $Res Function(Emoji) then) =
      _$EmojiCopyWithImpl<$Res, Emoji>;
  @useResult
  $Res call(
      {String id,
      String name,
      Set<String> keywords,
      List<Skin> skins,
      double version});
}

/// @nodoc
class _$EmojiCopyWithImpl<$Res, $Val extends Emoji>
    implements $EmojiCopyWith<$Res> {
  _$EmojiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Emoji
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? keywords = null,
    Object? skins = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      skins: null == skins
          ? _value.skins
          : skins // ignore: cast_nullable_to_non_nullable
              as List<Skin>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmojiImplCopyWith<$Res> implements $EmojiCopyWith<$Res> {
  factory _$$EmojiImplCopyWith(
          _$EmojiImpl value, $Res Function(_$EmojiImpl) then) =
      __$$EmojiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      Set<String> keywords,
      List<Skin> skins,
      double version});
}

/// @nodoc
class __$$EmojiImplCopyWithImpl<$Res>
    extends _$EmojiCopyWithImpl<$Res, _$EmojiImpl>
    implements _$$EmojiImplCopyWith<$Res> {
  __$$EmojiImplCopyWithImpl(
      _$EmojiImpl _value, $Res Function(_$EmojiImpl) _then)
      : super(_value, _then);

  /// Create a copy of Emoji
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? keywords = null,
    Object? skins = null,
    Object? version = null,
  }) {
    return _then(_$EmojiImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      skins: null == skins
          ? _value._skins
          : skins // ignore: cast_nullable_to_non_nullable
              as List<Skin>,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmojiImpl implements _Emoji {
  const _$EmojiImpl(
      {required this.id,
      required this.name,
      required final Set<String> keywords,
      required final List<Skin> skins,
      required this.version})
      : _keywords = keywords,
        _skins = skins;

  factory _$EmojiImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmojiImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final Set<String> _keywords;
  @override
  Set<String> get keywords {
    if (_keywords is EqualUnmodifiableSetView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_keywords);
  }

  final List<Skin> _skins;
  @override
  List<Skin> get skins {
    if (_skins is EqualUnmodifiableListView) return _skins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skins);
  }

  @override
  final double version;

  @override
  String toString() {
    return 'Emoji(id: $id, name: $name, keywords: $keywords, skins: $skins, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmojiImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            const DeepCollectionEquality().equals(other._skins, _skins) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_keywords),
      const DeepCollectionEquality().hash(_skins),
      version);

  /// Create a copy of Emoji
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmojiImplCopyWith<_$EmojiImpl> get copyWith =>
      __$$EmojiImplCopyWithImpl<_$EmojiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmojiImplToJson(
      this,
    );
  }
}

abstract class _Emoji implements Emoji {
  const factory _Emoji(
      {required final String id,
      required final String name,
      required final Set<String> keywords,
      required final List<Skin> skins,
      required final double version}) = _$EmojiImpl;

  factory _Emoji.fromJson(Map<String, dynamic> json) = _$EmojiImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  Set<String> get keywords;
  @override
  List<Skin> get skins;
  @override
  double get version;

  /// Create a copy of Emoji
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmojiImplCopyWith<_$EmojiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmojiData _$EmojiDataFromJson(Map<String, dynamic> json) {
  return _EmojiData.fromJson(json);
}

/// @nodoc
mixin _$EmojiData {
  List<Category> get categories => throw _privateConstructorUsedError;
  Map<String, Emoji> get emojis => throw _privateConstructorUsedError;

  /// Serializes this EmojiData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmojiData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmojiDataCopyWith<EmojiData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmojiDataCopyWith<$Res> {
  factory $EmojiDataCopyWith(EmojiData value, $Res Function(EmojiData) then) =
      _$EmojiDataCopyWithImpl<$Res, EmojiData>;
  @useResult
  $Res call({List<Category> categories, Map<String, Emoji> emojis});
}

/// @nodoc
class _$EmojiDataCopyWithImpl<$Res, $Val extends EmojiData>
    implements $EmojiDataCopyWith<$Res> {
  _$EmojiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmojiData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? emojis = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      emojis: null == emojis
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as Map<String, Emoji>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmojiDataImplCopyWith<$Res>
    implements $EmojiDataCopyWith<$Res> {
  factory _$$EmojiDataImplCopyWith(
          _$EmojiDataImpl value, $Res Function(_$EmojiDataImpl) then) =
      __$$EmojiDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Category> categories, Map<String, Emoji> emojis});
}

/// @nodoc
class __$$EmojiDataImplCopyWithImpl<$Res>
    extends _$EmojiDataCopyWithImpl<$Res, _$EmojiDataImpl>
    implements _$$EmojiDataImplCopyWith<$Res> {
  __$$EmojiDataImplCopyWithImpl(
      _$EmojiDataImpl _value, $Res Function(_$EmojiDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmojiData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? emojis = null,
  }) {
    return _then(_$EmojiDataImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      emojis: null == emojis
          ? _value._emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as Map<String, Emoji>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmojiDataImpl extends _EmojiData {
  const _$EmojiDataImpl(
      {required final List<Category> categories,
      required final Map<String, Emoji> emojis})
      : _categories = categories,
        _emojis = emojis,
        super._();

  factory _$EmojiDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmojiDataImplFromJson(json);

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final Map<String, Emoji> _emojis;
  @override
  Map<String, Emoji> get emojis {
    if (_emojis is EqualUnmodifiableMapView) return _emojis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_emojis);
  }

  @override
  String toString() {
    return 'EmojiData(categories: $categories, emojis: $emojis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmojiDataImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._emojis, _emojis));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_emojis));

  /// Create a copy of EmojiData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmojiDataImplCopyWith<_$EmojiDataImpl> get copyWith =>
      __$$EmojiDataImplCopyWithImpl<_$EmojiDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmojiDataImplToJson(
      this,
    );
  }
}

abstract class _EmojiData extends EmojiData {
  const factory _EmojiData(
      {required final List<Category> categories,
      required final Map<String, Emoji> emojis}) = _$EmojiDataImpl;
  const _EmojiData._() : super._();

  factory _EmojiData.fromJson(Map<String, dynamic> json) =
      _$EmojiDataImpl.fromJson;

  @override
  List<Category> get categories;
  @override
  Map<String, Emoji> get emojis;

  /// Create a copy of EmojiData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmojiDataImplCopyWith<_$EmojiDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
