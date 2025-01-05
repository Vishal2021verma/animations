import 'package:flutter/material.dart';

class RepeatingAnimationScreen extends StatefulWidget {
  const RepeatingAnimationScreen({super.key});
  @override
  State<RepeatingAnimationScreen> createState() =>
      _RepeatingAnimationScreenState();
}

class _RepeatingAnimationScreenState extends State<RepeatingAnimationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _size;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this, )
          ..repeat(reverse: false);
    _size = Tween<double>(begin: 50, end: 200)
        .animate(_controller as Animation<double>);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _size!,
          builder: (BuildContext context, Widget? child) {
            return Container(
              width: _size!.value,
              height: _size!.value,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: Colors.redAccent,
              ),
            );
          },
        ),
      ),
    );
  }
}
