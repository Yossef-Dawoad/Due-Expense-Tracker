import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Large amount entry field for the Add Transaction screen.
///
/// Owns a [TextEditingController] in its [State] so the cursor position and
/// focus survive rebuilds, which was broken by the previous approach of
/// constructing a new controller inside [ValueListenableBuilder].
///
/// The field is **always visible and focusable** — the inactive state shows a
/// styled hint (`0`) rather than hiding the widget, so the user can always
/// tap to start typing.
class TransactionAmountInput extends StatefulWidget {
  const TransactionAmountInput({
    super.key,
    required this.amountString,
    required this.onAmountChanged,
  });

  final ValueListenable<String> amountString;
  final ValueChanged<String> onAmountChanged;

  @override
  State<TransactionAmountInput> createState() => _TransactionAmountInputState();
}

class _TransactionAmountInputState extends State<TransactionAmountInput> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    final initial = widget.amountString.value;
    _controller = TextEditingController(text: initial == '0' ? '' : initial);
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    widget.amountString.addListener(_onExternalChange);
  }

  /// Keeps the text field in sync when [amountString] is changed externally
  /// (e.g. by the reset button), without disturbing user-driven edits.
  void _onExternalChange() {
    final external = widget.amountString.value;
    final fieldText = _controller.text.isEmpty ? '0' : _controller.text;
    if (fieldText != external) {
      _controller.text = external == '0' ? '' : external;
    }
  }

  void _onFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    widget.amountString.removeListener(_onExternalChange);
    _focusNode.removeListener(_onFocusChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    final labelStyle = GoogleFonts.manrope(
      color: colors.textSecondary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.2,
    );

    final amountStyle = GoogleFonts.manrope(
      color: colors.textPrimary,
      fontSize: 56,
      fontWeight: FontWeight.w800,
      height: 1.1,
    );

    return GestureDetector(
      // Tapping anywhere in the widget (including the $ prefix) grabs focus.
      onTap: _focusNode.requestFocus,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Text('AMOUNT', style: labelStyle),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ── Currency symbol ──────────────────────────────────────────
              ValueListenableBuilder<String>(
                valueListenable: widget.amountString,
                builder: (context, amountStr, _) {
                  final isEmpty = amountStr == '0' || amountStr.isEmpty;
                  return Text(
                    '\$',
                    style: amountStyle.copyWith(
                      color: isEmpty
                          ? colors.textPlaceholder
                          : colors.brandPrimary.withValues(alpha: 0.7),
                    ),
                  );
                },
              ),

              // ── Amount field / placeholder ────────────────────────────────
              //
              // The TextField is ALWAYS in the tree so _focusNode always has
              // an attached RenderObject and requestFocus() works.
              //
              // When unfocused + empty, an IgnorePointer overlay of Text('0')
              // sits on top to mask the cursor — taps fall through to the field
              // below, triggering focus and making the overlay disappear.
              Stack(
                alignment: Alignment.center,
                children: [
                  // Always-present field — owns the FocusNode.
                  IntrinsicWidth(
                    stepWidth: 56,
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      textAlign: TextAlign.center,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d*'),
                        ),
                      ],
                      style: amountStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        // No hint — the overlay below handles the '0' display.
                        hintText: '',
                        filled: false,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onChanged: widget.onAmountChanged,
                    ),
                  ),

                  // Cursor-masking overlay: visible only when there is nothing
                  // to show yet. IgnorePointer lets taps fall to the TextField.
                  if (!_isFocused && _controller.text.isEmpty)
                    IgnorePointer(
                      child: Text(
                        '0',
                        style: amountStyle.copyWith(
                          color: colors.textPlaceholder,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
