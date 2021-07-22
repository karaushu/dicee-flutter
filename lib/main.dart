import 'dart:math';
import 'package:flutter/material.dart';

int randomInteger(int max) {
  Random random = new Random();

  return random.nextInt(max) + 1;
}

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dices(),
    );
  }
}

class Dices extends StatefulWidget {
  @override
  _DicesState createState() => _DicesState();
}

class _DicesState extends State<Dices> {
  int firstDice = randomInteger(6);
  int secondDice = randomInteger(6);

  void _changeDices() {
    setState(() {
      firstDice = randomInteger(6);
      secondDice = randomInteger(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeDices,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('images/dice$firstDice.png'),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('images/dice$secondDice.png'),
            ),
          ),
        ],
      ),
    );
  }
}
