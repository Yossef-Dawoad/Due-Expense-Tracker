import 'package:flutter/material.dart';

class ColorfullTextField extends StatefulWidget {
  const ColorfullTextField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<ColorfullTextField> createState() => _ColorfullTextFieldState();
}

class _ColorfullTextFieldState extends State<ColorfullTextField> {
  @override
  Widget build(BuildContext context) {
    final Shader linearGradientShader = LinearGradient(
      colors: <Color>[
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.secondary,
        Theme.of(context).colorScheme.tertiary,
      ],
      begin: Alignment.topLeft,
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 25.0, 25.0));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextFormField(
        controller: widget.controller,
        textAlign: TextAlign.center,
        showCursor: false,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader = linearGradientShader,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.white,
          hintText: '0.00',
          prefix: InkWell(
            onTap: () {},
            child: Text(
              '\$',
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradientShader),
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 28.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
