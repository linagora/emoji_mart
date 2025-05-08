import 'package:flutter/material.dart';
import 'package:flutter_emoji_mart/flutter_emoji_mart.dart';
import 'package:linagora_design_flutter/colors/linagora_ref_colors.dart';
import 'package:linagora_design_flutter/colors/linagora_sys_colors.dart';

class EmojiSearchBar extends StatefulWidget {
  const EmojiSearchBar({
    super.key,
    required this.configuration,
    required this.onKeywordChanged,
    required this.onSkinToneChanged,
    this.searchBarTextStyle,
  });

  final EmojiPickerConfiguration configuration;
  final void Function(String keyword) onKeywordChanged;
  final EmojiSkinToneChanged onSkinToneChanged;
  final TextStyle? searchBarTextStyle;

  @override
  State<EmojiSearchBar> createState() => _EmojiSearchBarState();
}

class _EmojiSearchBarState extends State<EmojiSearchBar> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        child: SizedBox(
          height: 40,
          child: TextField(
            focusNode: widget.configuration.searchFocusNode,
            controller: controller,
            textInputAction: TextInputAction.search,
            enabled: true,
            onChanged: widget.onKeywordChanged,
            decoration: InputDecoration(
              filled: true,
              contentPadding: const EdgeInsets.all(12.0),
              fillColor: LinagoraSysColors.material().surface,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(24),
              ),
              hintText: widget.configuration.i18n.searchHintText,
              hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: LinagoraRefColors.material().neutral[60],
                  ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Icon(
                Icons.search_outlined,
                size: 24,
                color: LinagoraRefColors.material().neutral[60],
              ),
              suffixIcon: ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, value, child) {
                  return value.text.isNotEmpty ? child! : const SizedBox.shrink();
                },
                child: InkWell(
                  onTap: () {
                    controller.clear();
                    widget.onKeywordChanged('');
                  },
                  child: Icon(
                    Icons.close,
                    size: 24,
                    color: LinagoraRefColors.material().neutral[60],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
