import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tag selector matching the reference design:
///
/// ┌──────────────────────────────────────────────┐
/// │ Tags                          (green label)  │
/// │ [#Dinner] [#Vacation] [#Gift]  (pill chips)  │
/// │ ┌────────────────────────────────── ┐         │
/// │ │ Add a tag…                    +  │         │
/// │ └──────────────────────────────────┘         │
/// └──────────────────────────────────────────────┘
///
/// Works with plain [String] tag names — nothing is persisted to the
/// database until the transaction is saved.
class TransactionTagSelector extends StatefulWidget {
  const TransactionTagSelector({
    super.key,
    required this.pendingTagNames,
    required this.onAddTag,
    required this.onRemoveTag,
  });

  /// The current list of tag names entered by the user.
  final ValueListenable<List<String>> pendingTagNames;

  /// Called with the new tag name when the user types + presses Enter / "+".
  final ValueChanged<String> onAddTag;

  /// Called when the user taps a chip to remove a tag.
  final ValueChanged<String> onRemoveTag;

  @override
  State<TransactionTagSelector> createState() => _TransactionTagSelectorState();
}

class _TransactionTagSelectorState extends State<TransactionTagSelector> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  void _submit() {
    final name = _controller.text.trim();
    if (name.isNotEmpty) {
      widget.onAddTag(name);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Section label ──────────────────────────────────────────────
        Text(
          'Tags',
          style: GoogleFonts.manrope(
            color: colors.brandPrimary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        // ── Tag chips ──────────────────────────────────────────────────
        ValueListenableBuilder<List<String>>(
          valueListenable: widget.pendingTagNames,
          builder: (context, tagNames, _) {
            if (tagNames.isEmpty) return const SizedBox.shrink();

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final name in tagNames)
                    _TagChip(
                      name: name,
                      onRemove: () => widget.onRemoveTag(name),
                    ),
                ],
              ),
            );
          },
        ),

        // ── "Add a tag…" input row ─────────────────────────────────────
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: colors.bgSurface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colors.borderDefault),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  textCapitalization: TextCapitalization.words,
                  style: GoogleFonts.manrope(
                    color: colors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add a tag...',
                    hintStyle: GoogleFonts.manrope(
                      color: colors.textPlaceholder,
                      fontSize: 16,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    isDense: true,
                    filled: false,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onSubmitted: (_) => _submit(),
                ),
              ),
              // Green "+" button
              ScaleFeedback(
                onTap: _submit,
                minScale: 0.85,
                duration: AnimationDurations.rapid,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.add_rounded,
                    color: colors.brandPrimary,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

/// Green pill chip showing "#TagName" — tapping removes it.
class _TagChip extends StatelessWidget {
  const _TagChip({required this.name, required this.onRemove});

  final String name;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return ScaleFeedback(
      onTap: onRemove,
      minScale: 0.93,
      duration: AnimationDurations.rapid,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: colors.brandPrimary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '#$name',
          style: GoogleFonts.manrope(
            color: colors.brandPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
