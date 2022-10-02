import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class exploar_screen extends StatelessWidget {
  const exploar_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Text(
            'This is the exploar page',
            style: TextStyle(fontSize: 24),
          ),
        )
    );
  }
}
