import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home_screen extends StatelessWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Text(
            'This is the home Screen',
            style: TextStyle(fontSize: 24),
          ),
        )
    );
  }
}
