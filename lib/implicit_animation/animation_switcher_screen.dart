import 'package:flutter/material.dart';

class AnimationSwitcherScreen extends StatefulWidget {
  const AnimationSwitcherScreen({super.key});

  @override
  State<AnimationSwitcherScreen> createState() =>
      _AnimationSwitcherScreenState();
}

class _AnimationSwitcherScreenState extends State<AnimationSwitcherScreen> {
  int value = 0;

  timer() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        value = value + 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await timer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: Text(
          key: ValueKey<int>(value),
          value.toString(),
          style: const TextStyle(fontSize: 30),
        ),
      ),
    ));
  }
}
