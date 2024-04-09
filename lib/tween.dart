import 'package:flutter/material.dart';

void main() {
  runApp(Tweenn());
}

class Tweenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TweenAnimation(),
    );
  }
}

class TweenAnimation extends StatefulWidget {
  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // Update the UI
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation'),
      ),
      body: Center(
        child: Container(
          height: _animation.value,
          width: _animation.value,
          color: Colors.blue,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
