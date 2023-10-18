import 'package:flutter/material.dart';

class WaslaApp extends StatelessWidget {
  //named constructor
  const WaslaApp._internal();

  //singleton instance
  static const WaslaApp _instance = WaslaApp._internal();

  factory WaslaApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
