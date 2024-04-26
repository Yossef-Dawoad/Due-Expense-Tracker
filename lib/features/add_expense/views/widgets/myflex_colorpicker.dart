import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class MyFlexColorPicker extends StatefulWidget {
  const MyFlexColorPicker({super.key, required this.onColorSelected});
  final ValueChanged onColorSelected;

  @override
  State<MyFlexColorPicker> createState() => _MyFlexColorPickerState();
}

class _MyFlexColorPickerState extends State<MyFlexColorPicker> {
  // Color for the picker shown in Card on the screen.
  late Color screenPickerColor;
  // Color for the picker in a dialog using onChanged.
  late Color dialogPickerColor;
  // Color for picker using the color select dialog.
  late Color dialogSelectColor;

  @override
  void initState() {
    super.initState();
    screenPickerColor = Colors.blue; // Material blue.
    dialogPickerColor = Colors.red; // Material red.
    dialogSelectColor = const Color(0xFFA239CA); // A purple color.
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card.outlined(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        elevation: 0.0,
        child: ColorPicker(
          // Use the screenPickerColor as start color.
          color: screenPickerColor,
          // Update the screenPickerColor using the callback.
          onColorChanged: (Color color) {
            setState(() => screenPickerColor = color);
            widget.onColorSelected(screenPickerColor);
          },
          width: 44,
          height: 44,
          hasBorder: true,
          borderRadius: 22,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
          heading: Text(
            'Select Category color',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          enableShadesSelection: false,
          elevation: 0.0,
          pickersEnabled: const {
            ColorPickerType.accent: false,
            ColorPickerType.wheel: true,
          },
        ),
      ),
    );
  }
}
