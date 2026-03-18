import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateBudgetMoneyField extends StatefulWidget {
  const CreateBudgetMoneyField({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.controller,
    this.hintText = '0',
    this.enabled = true,
    this.onFocusChanged,
  });

  final String initialValue;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final String hintText;
  final bool enabled;
  final ValueChanged<bool>? onFocusChanged;

  @override
  State<CreateBudgetMoneyField> createState() => _CreateBudgetMoneyFieldState();
}

class _CreateBudgetMoneyFieldState extends State<CreateBudgetMoneyField> {
  late final TextEditingController _localController;
  late final FocusNode _focusNode;

  TextEditingController get _effectiveController =>
      widget.controller ?? _localController;

  @override
  void initState() {
    super.initState();
    _localController = TextEditingController(text: widget.initialValue);
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChanged);
  }

  @override
  void didUpdateWidget(covariant CreateBudgetMoneyField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != null) {
      return;
    }
    if (widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != _localController.text) {
      _localController.value = TextEditingValue(
        text: widget.initialValue,
        selection: TextSelection.collapsed(offset: widget.initialValue.length),
      );
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChanged);
    _focusNode.dispose();
    _localController.dispose();
    super.dispose();
  }

  void _handleFocusChanged() {
    widget.onFocusChanged?.call(_focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return TextField(
      controller: _effectiveController,
      focusNode: _focusNode,
      showCursor: true,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
      style: textStyles.bodyMD.copyWith(
        color: colors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        prefixText: '\$',
        prefixStyle: textStyles.bodyMD.copyWith(
          color: colors.textPrimary,
          fontWeight: FontWeight.w800,
        ),
        hintText: widget.hintText,
      ),
    );
  }
}
