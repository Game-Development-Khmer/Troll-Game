import 'package:flutter/material.dart';

class ShakingWidget extends StatefulWidget {
  final Widget child;
  final bool isShaking;
  final Duration duration;

  const ShakingWidget({
    super.key,
    required this.child,
    this.isShaking = true,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<ShakingWidget> createState() => _ShakingWidgetState();
}

class _ShakingWidgetState extends State<ShakingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    if (widget.isShaking) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(ShakingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isShaking != oldWidget.isShaking) {
      if (widget.isShaking) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.child,
    );
  }
}
