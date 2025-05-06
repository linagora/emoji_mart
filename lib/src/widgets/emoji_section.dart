import 'package:flutter/material.dart';
import 'package:flutter_emoji_mart/flutter_emoji_mart.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:visibility_detector/visibility_detector.dart';

typedef EmojiSectionHeaderBuilder = Widget Function(
  BuildContext context,
  Category category,
);

typedef EmojiItemBuilder = Widget Function(
  BuildContext context,
  String emojiId,
  String emoji,
  EmojiSelectedCallback callback,
);

class EmojiSection extends StatelessWidget {
  const EmojiSection({
    super.key,
    required this.configuration,
    required this.emojiData,
    required this.category,
    required this.onEmojiSelected,
    required this.sectionKey,
    this.headerBuilder,
    this.itemBuilder,
    this.skinTone = EmojiSkinTone.none,
    this.onVisibilityChanged,
  });

  final Key sectionKey;
  final EmojiPickerConfiguration configuration;
  final EmojiData emojiData;
  final Category category;
  final EmojiSkinTone skinTone;
  final EmojiSelectedCallback onEmojiSelected;
  final EmojiSectionHeaderBuilder? headerBuilder;
  final EmojiItemBuilder? itemBuilder;
  final void Function(String categoryId, VisibilityInfo info)?
      onVisibilityChanged;

  @override
  Widget build(BuildContext context) {
    Widget child = SliverGrid.builder(
      itemCount: category.emojiIds.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: configuration.perLine,
      ),
      itemBuilder: (context, index) {
        final emojiId = category.emojiIds[index];
        final emoji = emojiData.getEmojiById(
          emojiId,
          skinTone: skinTone,
        );
        return itemBuilder?.call(
              context,
              emojiId,
              emoji,
              onEmojiSelected,
            ) ??
            EmojiItem(
              textStyle: configuration.emojiStyle,
              emoji: emoji,
              onTap: () => onEmojiSelected(
                emojiId,
                emoji,
              ),
            );
      },
    );
    if (configuration.showSectionHeader) {
      child = SliverVisibilityDetector(
        key: ValueKey(category.id),
        onVisibilityChanged: (onVisibilityChanged != null)
            ? (info) => onVisibilityChanged!(category.id, info)
            : null,
        sliver: SliverStickyHeader(
          key: sectionKey,
          sticky: configuration.stickyHeader,
          header: headerBuilder != null
              ? headerBuilder!(context, category)
              : EmojiSectionHeader(
                  category: category,
                  configuration: configuration,
                ),
          sliver: child,
        ),
      );
    }

    return child;
  }
}
