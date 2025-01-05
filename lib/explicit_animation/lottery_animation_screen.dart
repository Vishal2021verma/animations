import 'package:flutter/material.dart';

class LotteryAnimationScreen extends StatefulWidget {
  const LotteryAnimationScreen({super.key});

  @override
  State<LotteryAnimationScreen> createState() => _LotteryAnimationScreenState();
}

class _LotteryAnimationScreenState extends State<LotteryAnimationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  final double accountBalance = 2000000;
  @override
  initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController!.addListener(() {
      setState(() {});
    });
    _animation = Tween<double>(begin: 0.0, end: accountBalance)
        .animate(_animationController!);
    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              "\$${_animation!.value.toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.black87, fontSize: 36),
            )),
        TextButton(
          onPressed: () {
            switch (_animationController!.status) {
              case AnimationStatus.completed:
                _animationController!.reverse();
              default:
                _animationController!.forward();
            }
          },
          child: Text(switch (_animationController!.status) {
            AnimationStatus.completed => 'Buy a Car',
            AnimationStatus.forward => 'Accuruing...',
            AnimationStatus.reverse => "Buying a Car...",
            _ => 'Win a Lottery'
          }),
        )
      ],
    )));
  }
}
