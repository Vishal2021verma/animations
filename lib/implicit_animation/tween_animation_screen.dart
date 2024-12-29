import 'package:flutter/material.dart';
import 'dart:math' as math;

class TweenAnimationScreen extends StatelessWidget {
  TweenAnimationScreen({super.key});
  final Tween<double> earthTween = Tween<double>(begin: 0, end: 100 * math.pi);
  final int earthRotationDuration = 4800;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                scale: 2,
                repeat: ImageRepeat.repeat,
                image: AssetImage("asset/space.jpg"),
                fit: BoxFit.fill),
          ),
          child: SizedBox(
              width: 500,
              height: 500,
              child: TweenAnimationBuilder(
                  tween: earthTween,
                  duration: Duration(seconds: earthRotationDuration),
                  builder:
                      (BuildContext context, double value, Widget? child) =>
                          Transform.rotate(
                            angle: value,
                            child: child,
                          ),
                  child: Image.asset('asset/earth.png'))),
        ));
  }
}
