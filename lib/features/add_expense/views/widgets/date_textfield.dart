import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class DateTextField extends StatefulWidget {
  const DateTextField({super.key, required this.onDateSelected});

  final ValueChanged<DateTime> onDateSelected;

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate = DateTime.now();
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
        selectedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        if (selectedDate != null) {
          dateController.text = DateFormat('EEEE').format(selectedDate!);
          widget.onDateSelected(selectedDate!);
        }
      },
      readOnly: true,
      textAlignVertical: TextAlignVertical.center,
      style: f14greyRegularText.copyWith(fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Iconsax.clock, size: 28),
        contentPadding: const EdgeInsets.all(24.0),
        hintText: 'Date',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
