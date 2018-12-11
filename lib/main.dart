import 'package:flutter/material.dart';
import './toasty_animation/toasty_animation.dart';

void main() => runApp(ToastyApp());

class ToastyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toasty Mortal Kombat Animation',
      home: Toasty(),
    );
  }
}

class Toasty extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toasty Mortal Kombat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Flutter Animation Example'),
            )
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: ToastyAnimation(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
