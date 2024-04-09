import 'package:animation_project/hero.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Heroo());
}

class Implicit extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Implicit> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Implicit Animation Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(seconds: 1),
                width: _expanded ? 200 : 100,
                height: _expanded ? 200 : 100,
                color: _expanded ? Colors.blue : Colors.red,
                child: Center(
                  child: Text(
                    'Tap to Expand/Collapse',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
