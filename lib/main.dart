import 'package:flutter/material.dart';
import 'package:braincheck/Page/Homepage.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Brain-Check', home: Homepage());
  }
}
