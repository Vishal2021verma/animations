import 'package:flutter/material.dart';

class OpacityAnimationScreen extends StatefulWidget {
  const OpacityAnimationScreen({super.key});

  @override
  State<OpacityAnimationScreen> createState() => _OpacityAnimationScreenState();
}

class _OpacityAnimationScreenState extends State<OpacityAnimationScreen> {
  double opacityLevel = 1;
  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == .2 ? 1 : 0.2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _changeOpacity,
          child: AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(seconds: 1),
            
            child: Container(
              color: Colors.blue,
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
