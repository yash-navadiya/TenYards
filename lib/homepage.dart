import 'package:flutter/material.dart';
import 'chatscreen.dart';
class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("TenYard"),
      ),
      body: new chatscreen());

  }
}
