import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class DateTextField extends StatefulWidget {
  const DateTextField({super.key, required this.dateNotifier});

  final ValueNotifier<DateTime> dateNotifier;

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    dateController.text = DateFormat('EEEE').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateController,
      onTap: () async {
        selectedDate =
            await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            ) ??
            DateTime.now();

        dateController.text = DateFormat('EEEE, MMMM dd').format(selectedDate);
        widget.dateNotifier.value = selectedDate;
      },
      readOnly: true,
      textAlignVertical: TextAlignVertical.center,
      style: context.textStyles.bodyMD.copyWith(fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        fillColor: context.kitColors.bgSurface,
        prefixIcon: Icon(
          Iconsax.clock,
          size: 28,
          color: context.kitColors.textSecondary,
        ),
        contentPadding: EdgeInsets.all(context.spacing.s6),
        hintText: 'Date',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: context.borderRadius.input,
        ),
      ),
    );
  }
}
