import 'package:flutter/material.dart';

class TweenSunAnimationScreen extends StatefulWidget {
  const TweenSunAnimationScreen({super.key});
  @override
  State<TweenSunAnimationScreen> createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenSunAnimationScreen> {
  double _newValue = 0.4;
  Color _newColor = Colors.red;
  final Color _beginColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _newColor = Color.lerp(Colors.white, Colors.red, _newValue)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/space.jpg"), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: ColorTween(begin: _beginColor, end: _newColor),
              duration: const Duration(seconds: 1),
              builder: (_, Color? value, __) => ColorFiltered(
                colorFilter: ColorFilter.mode(value!, BlendMode.modulate),
                child: Image.asset("asset/sun.png"),
              ),
            ),
            const SizedBox(height: 60),
            Slider.adaptive(
                value: _newValue,
                onChanged: (double value) {
                  setState(() {
                    _newValue = value;
                    _newColor =
                        Color.lerp(Colors.white, Colors.red, _newValue)!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
