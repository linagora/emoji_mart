import 'package:flutter/material.dart';

class EmojiItem extends StatelessWidget {
  const EmojiItem({
    super.key,
    required this.onTap,
    required this.emoji,
    this.fontFamilyFallback,
    required this.textStyle,
  });

  final VoidCallback onTap;

  final String emoji;

  // size of the emoji, font size
  final TextStyle textStyle;

  // In some platforms, emoji is not supported, so we need to use fallback font
  final List<String>? fontFamilyFallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        emoji,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
