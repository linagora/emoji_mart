import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_emoji_mart/src/data/emoji_data.dart';

class EmojiStreamBuilder extends StatefulWidget {
  const EmojiStreamBuilder({
    super.key,
    required this.categoryFuture,
    required this.builder,
  });

  final Future<Category?>? categoryFuture;
  final Widget Function(List<String> emojiIds) builder;

  @override
  State<EmojiStreamBuilder> createState() => _EmojiStreamBuilderState();
}

class _EmojiStreamBuilderState extends State<EmojiStreamBuilder> {
  late final StreamController<List<String>> _streamController;

  Future<void> _extractEmojiIdsFromCategory() async {
    if (widget.categoryFuture == null) return;
    final category = await widget.categoryFuture!;
    if (category == null || category.emojiIds.isEmpty) return;
    _streamController.add(List.unmodifiable(category.emojiIds));
  }

  @override
  void initState() {
    super.initState();
    _streamController = StreamController.broadcast();
    _extractEmojiIdsFromCategory();
  }

  @override
  void didUpdateWidget(covariant EmojiStreamBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    _extractEmojiIdsFromCategory();
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _streamController.stream.distinct(),
      builder: (context, snapshot) {
        return widget.builder(snapshot.hasData ? snapshot.requireData : []);
      },
    );
  }
}
