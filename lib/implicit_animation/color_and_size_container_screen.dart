import 'package:flutter/material.dart';

// This example demonstrates a container that changes its color, size, and border radius when tapped.
class ColorSizeContainerScreen extends StatefulWidget {
  const ColorSizeContainerScreen({super.key});

  @override
  State<ColorSizeContainerScreen> createState() =>
      _ColorSizeContainerScreenState();
}

class _ColorSizeContainerScreenState extends State<ColorSizeContainerScreen> {
  double containerWidth = 200;
  double containerHeight = 200;
  Color containerColor = Colors.blue;
  double radius = 5;
  Color shadowColor = const Color.fromARGB(56, 216, 216, 216);

  animate() {
    setState(() {
      containerWidth = containerWidth == 200 ? 100 : 200;
      containerHeight = containerHeight == 200 ? 100 : 200;
      containerColor = containerColor == Colors.blue ? Colors.red : Colors.blue;
      radius = radius == 5 ? 100 : 5;
      shadowColor = shadowColor == const Color.fromARGB(56, 216, 216, 216)
          ? Colors.transparent
          : const Color.fromARGB(56, 216, 216, 216);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Easing.emphasizedAccelerate,
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: shadowColor, blurRadius: 5, spreadRadius: 5),
                  ],
                  color: containerColor,
                  borderRadius: BorderRadius.circular(radius)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  animate();
                },
                child: const Text("Animate"))
          ],
        ),
      ),
    );
  }
}
