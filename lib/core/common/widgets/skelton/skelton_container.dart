import 'package:flutter/material.dart';

class SkeltonContainer extends StatefulWidget {
  const SkeltonContainer({
    super.key,
    this.child,
    this.radius = 10,
    this.padding = 8,
    this.animationDuration = 2000,
    this.height,
    this.width,
  });
  final double radius;
  final double padding;
  final int animationDuration;
  final double? height, width;
  final Widget? child;

  @override
  State<SkeltonContainer> createState() => _SkeltonContainerState();
}

class _SkeltonContainerState extends State<SkeltonContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic, // This is where you set your curve
    );
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) => Container(
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.all(widget.padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          gradient: LinearGradient(
            colors: const [Color.fromARGB(3, 214, 214, 214), Colors.white],
            stops: [0, _controller.value],
          ),
        ),
      ),
    );
  }
}
