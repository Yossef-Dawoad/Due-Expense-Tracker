import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/transactions/models/tag.dart';
import 'package:expancetracker/transactions/views/widgets/transaction_tag_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

/// Date picker, tags, and notes section for the Add Transaction screen.
///
/// Layout (matches reference design):
///   Date  →  Tags  →  Notes
class TransactionDetailsSection extends StatelessWidget {
  const TransactionDetailsSection({
    super.key,
    required this.date,
    required this.onDateChanged,
    required this.notesController,
    required this.pendingTagNames,
    required this.allTags,
    required this.onAddTag,
    required this.onRemoveTag,
  });

  final ValueListenable<DateTime> date;
  final ValueChanged<DateTime> onDateChanged;
  final TextEditingController notesController;
  final ValueListenable<List<String>> pendingTagNames;
  final ValueListenable<List<Tag>> allTags;
  final ValueChanged<String> onAddTag;
  final ValueChanged<String> onRemoveTag;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Date ─────────────────────────────────────────────────────
          Text(
            'Date',
            style: GoogleFonts.manrope(
              color: colors.brandPrimary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _TransactionDatePicker(date: date, onDateChanged: onDateChanged),

          const SizedBox(height: 20),

          // ── Tags ─────────────────────────────────────────────────────
          TransactionTagSelector(
            pendingTagNames: pendingTagNames,
            allTags: allTags,
            onAddTag: onAddTag,
            onRemoveTag: onRemoveTag,
          ),

          const SizedBox(height: 20),

          // ── Notes ────────────────────────────────────────────────────
          Text(
            'Notes',
            style: GoogleFonts.manrope(
              color: colors.brandPrimary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _TransactionNotesField(controller: notesController),
        ],
      ),
    );
  }
}

/// Tappable date row that opens a date picker dialog.
class _TransactionDatePicker extends StatelessWidget {
  const _TransactionDatePicker({
    required this.date,
    required this.onDateChanged,
  });

  final ValueListenable<DateTime> date;
  final ValueChanged<DateTime> onDateChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: date.value,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          onDateChanged(picked);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: colors.bgSurface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.borderDefault),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: colors.textSecondary, size: 20),
            const SizedBox(width: 12),
            ValueListenableBuilder<DateTime>(
              valueListenable: date,
              builder: (context, dateValue, _) {
                return Text(
                  DateFormat('MMM d, yyyy').format(dateValue),
                  style: GoogleFonts.manrope(
                    color: colors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Multi-line text field for transaction notes.
class _TransactionNotesField extends StatelessWidget {
  const _TransactionNotesField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Container(
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.borderDefault),
      ),
      child: TextField(
        controller: controller,
        maxLines: 3,
        style: GoogleFonts.manrope(color: colors.textPrimary, fontSize: 16),
        decoration: InputDecoration(
          hintText: 'What was this for?',
          hintStyle: GoogleFonts.manrope(color: colors.textPlaceholder),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
          filled: false,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
