import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Fill extends StatelessWidget {
  const Fill({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: IconButton(
        onPressed: () {
          Navigator.popAndPushNamed(context,'/');
        },
        icon: Icon(Icons.arrow_back),
      ),
    )));
  }
}
