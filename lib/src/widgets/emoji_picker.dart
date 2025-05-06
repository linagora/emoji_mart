import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_mart/flutter_emoji_mart.dart';
import 'package:linagora_design_flutter/linagora_design_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

typedef EmojiSearchBarBuilder = Widget Function(
  BuildContext context,
  ValueNotifier<String> keyword,
  ValueNotifier<EmojiSkinTone> skinTone,
);

class EmojiPicker extends StatefulWidget {
  const EmojiPicker({
    super.key,
    required this.emojiData,
    required this.onEmojiSelected,
    this.searchBarBuilder,
    this.headerBuilder,
    this.itemBuilder,
    required this.configuration,
    this.padding = const EdgeInsets.all(0),
  });

  /// Data to use for the picker
  ///
  /// You can use the [EmojiData] class to load the data from a JSON file or from
  ///   a custom source
  final EmojiData emojiData;

  /// Callback when an emoji is selected
  final EmojiSelectedCallback onEmojiSelected;

  /// Custom the emoji picker configuration
  final EmojiPickerConfiguration configuration;

  /// Builder for the emoji search bar
  ///
  /// If this is null, the default search bar will be used
  final EmojiSearchBarBuilder? searchBarBuilder;

  /// Builder for the emoji section header
  ///
  /// If this is null, the default section header will be used
  final EmojiSectionHeaderBuilder? headerBuilder;

  /// Builder for the emoji item
  ///
  ///
  final EmojiItemBuilder? itemBuilder;

  /// Padding for the emoji picker
  final EdgeInsets padding;

  @override
  State<EmojiPicker> createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker>
    with SingleTickerProviderStateMixin {
  // global keys for each section
  //
  // it's used to scroll to a specific section
  final sectionKeys = <String, GlobalKey>{};

  // the index of the most visible section
  final ValueNotifier<int> mostVisibleIndex = ValueNotifier(0);

  final ValueNotifier<String> mostVisibleSectionId = ValueNotifier('');

  // store the visible fraction of each section
  // the key is the category id
  // the value is the visible fraction
  // if the visible fraction is equal or less than 0, it means the section is not visible
  final visibleSections = <String, double>{};

  // the text in the search bar
  final ValueNotifier<String> keyword = ValueNotifier('');

  // current selected skin tone
  final ValueNotifier<EmojiSkinTone> skinTone =
      ValueNotifier(EmojiSkinTone.none);

  final categoriesScrollController = AutoScrollController();
  final scrollController = ScrollController();

  // filtered emoji data
  late EmojiData emojiData;

  @override
  void initState() {
    super.initState();

    emojiData = widget.emojiData;
    mostVisibleIndex.addListener(scrollToMostVisibleSectionIndex);
    skinTone.value = widget.configuration.defaultSkinTone;

    for (final element in emojiData.categories) {
      sectionKeys[element.id] = GlobalKey();
    }
  }

  @override
  void dispose() {
    categoriesScrollController.dispose();
    mostVisibleIndex.removeListener(scrollToMostVisibleSectionIndex);
    mostVisibleIndex.dispose();
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // tab bar
        if (widget.configuration.showTabs) _buildTabBar(context),

        // search bar
        if (widget.configuration.showSearchBar)
          widget.searchBarBuilder?.call(context, keyword, skinTone) ??
              EmojiSearchBar(
                configuration: widget.configuration,
                onKeywordChanged: (keyword) {
                  this.keyword.value = keyword;
                },
                onSkinToneChanged: (skinTone) {
                  this.skinTone.value = skinTone;
                },
              ),

        // sections
        Expanded(
          child: _buildSections(context),
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: categoriesScrollController,
        itemCount: widget.emojiData.categories.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              scrollToSection(
                index,
                widget.emojiData.categories[index].id,
              );
            },
            child: ValueListenableBuilder(
              valueListenable: mostVisibleIndex,
              builder: (context, visibleIndex, child) {
                return Column(
                  children: [
                    AutoScrollTag(
                      key: ValueKey(widget.emojiData.categories[index].id),
                      controller: categoriesScrollController,
                      index: index,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 8,
                        ),
                        child: Icon(
                          categoryIcon(
                            widget.emojiData.categories[index].id,
                          ),
                          color: visibleIndex == index
                              ? LinagoraSysColors.material().primary
                              : LinagoraRefColors.material().tertiary[30],
                          size: 24,
                        ),
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 4,
                      decoration: BoxDecoration(
                        color: visibleIndex == index
                            ? LinagoraSysColors.material().primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSections(BuildContext context) {
    CustomScrollView builder(EmojiData emojiData, EmojiSkinTone skinTone) =>
        CustomScrollView(
          controller: scrollController,
          slivers: emojiData.categories
              .map(
                (category) => SliverPadding(
                  padding: widget.padding,
                  sliver: EmojiSection(
                    onVisibilityChanged: (id, info) {
                      updateMostVisibleSection(id, info);
                    },
                    sectionKey: sectionKeys[category.id]!,
                    skinTone: skinTone,
                    configuration: widget.configuration,
                    emojiData: emojiData,
                    category: category,
                    headerBuilder: widget.headerBuilder,
                    itemBuilder: widget.itemBuilder,
                    onEmojiSelected: widget.onEmojiSelected,
                  ),
                ),
              )
              .toList(),
        );

    if (widget.configuration.showSearchBar) {
      return ValueListenableBuilder<EmojiSkinTone>(
        valueListenable: skinTone,
        builder: (_, skinTone, __) {
          return ValueListenableBuilder(
            valueListenable: keyword,
            builder: (_, keyword, ___) {
              final emojiData = widget.emojiData.filterByKeyword(keyword);
              if (emojiData.categories.isEmpty) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.configuration.searchEmptyWidget ??
                        const SizedBox.shrink(),
                    Text(
                      widget.configuration.i18n.searchNoResult,
                      style: widget.configuration.searchEmptyTextStyle,
                    ),
                  ],
                );
              }
              return builder(emojiData, skinTone);
            },
          );
        },
      );
    }

    return builder(emojiData, EmojiSkinTone.none);
  }

  void scrollToMostVisibleSectionIndex() {
    final index = mostVisibleIndex.value;
    categoriesScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
    );
  }

  Future<void> scrollToSection(int index, String categoryId) async {
    final key = sectionKeys[categoryId];
    final currentContext = key?.currentContext;
    mostVisibleSectionId.value = categoryId;
    if (currentContext != null) {
      await Scrollable.ensureVisible(
        currentContext,
      );
    }
  }

  // Count the most visible section based on the visibility info
  void updateMostVisibleSection(String categoryId, VisibilityInfo info) {
    visibleSections[categoryId] = info.visibleFraction;

    // Remove the category if it is not visible
    if (info.visibleFraction <= 0) {
      visibleSections.remove(categoryId);
    }

    // Update the most visible index
    EasyDebounce.debounce(
        'updateMostVisibleIndex', const Duration(milliseconds: 250), () {
      // If there are no visible sections, return
      if (visibleSections.isEmpty) {
        return;
      }
      // Find the category with the highest visibility fraction
      final mostVisibleCategoryId = visibleSections.entries
          .reduce((a, b) => a.value > b.value ? a : b)
          .key;
      mostVisibleIndex.value = widget.emojiData.categories.indexWhere(
        (category) =>
            category.id == mostVisibleSectionId.value ||
            category.id == mostVisibleCategoryId,
      );
      mostVisibleSectionId.value = '';
    });
  }

  IconData categoryIcon(String categoryId) {
    switch (categoryId) {
      case 'people':
        return Icons.sentiment_satisfied;
      case 'nature':
        return Icons.emoji_nature;
      case 'foods':
        return Icons.local_drink;
      case 'activity':
        return Icons.directions_run;
      case 'places':
        return Icons.sports_soccer;
      case 'objects':
        return Icons.directions_car;
      case 'symbols':
        return Icons.lightbulb;
      case 'flags':
        return Icons.flag;
      default:
        return Icons.emoji_emotions;
    }
  }
}
