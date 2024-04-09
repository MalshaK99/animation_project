import 'package:flutter/material.dart';

void main() {
  runApp(Physics_based());
}

class Physics_based extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Physics_based> with TickerProviderStateMixin {
  late AnimationController _controller;
  double _height = 100.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(() {
        setState(() {
          _height = _controller.value * 200 + 100;
        });
      });
    _controller.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Physics-based Animation Example'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              _controller.animateTo(0.0);
            },
            child: Container(
              width: 100,
              height: _height,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Tap to Animate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
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
