import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_emoji_mart/flutter_emoji_mart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'emoji_data.freezed.dart';

part 'emoji_data.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    @JsonKey(name: 'emojis') required List<String> emojiIds,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Skin with _$Skin {
  const factory Skin({
    required String unified,
    required String native,
  }) = _Skin;

  factory Skin.fromJson(Map<String, dynamic> json) => _$SkinFromJson(json);
}

@freezed
class Emoji with _$Emoji {
  const factory Emoji({
    required String id,
    required String name,
    required Set<String> keywords,
    required List<Skin> skins,
    required double version,
  }) = _Emoji;

  factory Emoji.fromJson(Map<String, dynamic> json) => _$EmojiFromJson(json);
}

@freezed
class EmojiData with _$EmojiData {
  const EmojiData._(); // Added constructor

  const factory EmojiData({
    required List<Category> categories,
    required Map<String, Emoji> emojis,
  }) = _EmojiData;

  factory EmojiData.fromJson(Map<String, dynamic> json) =>
      _$EmojiDataFromJson(json);

  static Future<EmojiData> builtIn() async {
    final json = await rootBundle
        .loadString('packages/flutter_emoji_mart/assets/emoji_data.json');
    return EmojiData.fromJson(
      Map<String, dynamic>.from(jsonDecode(json)),
    );
  }

  String getEmojiById(
    String id, {
    EmojiSkinTone skinTone = EmojiSkinTone.none,
  }) {
    final emoji = emojis[id];
    if (emoji == null) {
      throw ArgumentError.value(id, 'id', 'Emoji not found');
    }
    if (0 <= skinTone.index && skinTone.index < emoji.skins.length) {
      return emoji.skins[skinTone.index].native;
    }
    return emoji.skins.first.native;
  }

  String getIdByEmoji(
    String emoji, {
    EmojiSkinTone skinTone = EmojiSkinTone.none,
  }) {
    final emojiEntry = emojis.entries.firstWhere(
      (entry) => entry.value.skins.any(
        (skin) => skin.native == emoji,
      ),
      orElse: () =>
          throw ArgumentError.value(emoji, 'emoji', 'Emoji not found'),
    );
    final emojiId = emojiEntry.key;
    final emojiData = emojiEntry.value;

    if (0 <= skinTone.index && skinTone.index < emojiData.skins.length) {
      return emojiId;
    }
    return emojiId; // Return the first skin's id
  }

  EmojiData filterByKeyword(
    String keyword, {
    bool keepEmptyCategories = false,
  }) {
    final filteredCategories = <Category>[];
    final filteredEmojis = <String, Emoji>{};

    for (final category in categories) {
      final filteredEmojiIds = <String>[];
      for (final emojiId in category.emojiIds) {
        final emoji = emojis[emojiId]!;
        final lowercaseKey = keyword.toLowerCase();
        if (emoji.keywords.any((k) => k.toLowerCase().contains(lowercaseKey)) ||
            emoji.id.toLowerCase().contains(lowercaseKey) ||
            emoji.name.toLowerCase().contains(lowercaseKey)) {
          filteredEmojiIds.add(emojiId);
          filteredEmojis[emojiId] = emoji;
        }
      }

      if (filteredEmojiIds.isNotEmpty || keepEmptyCategories) {
        filteredCategories.add(
          category.copyWith(
            emojiIds: filteredEmojiIds,
          ),
        );
      }
    }

    final filteredEmojiData = copyWith(
      categories: filteredCategories,
      emojis: filteredEmojis,
    );

    return filteredEmojiData;
  }

  EmojiData filterByVersion(
    double maxVersion, {
    bool keepEmptyCategories = false,
  }) {
    final filteredCategories = <Category>[];
    final filteredEmojis = <String, Emoji>{};

    for (final category in categories) {
      final filteredEmojiIds = <String>[];
      for (final emojiId in category.emojiIds) {
        final emoji = emojis[emojiId]!;
        if (emoji.version <= maxVersion) {
          filteredEmojiIds.add(emojiId);
          filteredEmojis[emojiId] = emoji;
        }
      }

      if (filteredEmojiIds.isNotEmpty || keepEmptyCategories) {
        filteredCategories.add(
          category.copyWith(
            emojiIds: filteredEmojiIds,
          ),
        );
      }
    }

    final filteredEmojiData = copyWith(
      categories: filteredCategories,
      emojis: filteredEmojis,
    );

    return filteredEmojiData;
  }

  /// generate a random emoji
  (String, String) get random {
    final random = Random();
    final randomCategory = categories[random.nextInt(
      categories.length,
    )];
    final randomEmojiId = randomCategory.emojiIds[random.nextInt(
      randomCategory.emojiIds.length,
    )];
    return (
      randomEmojiId,
      getEmojiById(randomEmojiId),
    );
  }
}
