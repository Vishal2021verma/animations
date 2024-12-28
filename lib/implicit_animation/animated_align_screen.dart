import 'package:flutter/material.dart';

class AniamtedAlignScreen extends StatefulWidget {
  const AniamtedAlignScreen({super.key});
  @override
  State<AniamtedAlignScreen> createState() => _AnimatedAlignScreenState();
}

class _AnimatedAlignScreenState extends State<AniamtedAlignScreen> {
  AlignmentGeometry boxAlignment = Alignment.topLeft;
  int speed = 2;
  double height = 5;
  double width = 50;
  Color containerColor = Colors.red;
  List<Color> containerColors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.tealAccent,
    Colors.yellowAccent
  ];

  List<AlignmentGeometry> alignments = [
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
    Alignment.topLeft
  ];
  _start() async {
    for (var alignment in alignments) {
      setState(() {
        boxAlignment = alignment;
        containerColor = containerColors[alignments.indexOf(alignment)];
        if (boxAlignment == Alignment.topRight ||
            boxAlignment == Alignment.bottomLeft) {
          height = 5;
          width = 50;
        } else {
          height = 50;
          width = 5;
        }
      });

      await Future.delayed(Duration(seconds: speed), () {});
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      while (true) {
        await _start();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          color: containerColor,
          duration: Duration(seconds: speed),
          child: AnimatedAlign(
            alignment: boxAlignment,
            duration: Duration(seconds: speed),
            child: AnimatedContainer(
              width: width,
              height: height,
              color: Colors.red,
              duration: const Duration(milliseconds: 0),
            ),
          ),
        ),
      ),
    );
  }
}
