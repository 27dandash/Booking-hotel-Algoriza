import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Text(
            'This is the profile page',
            style: TextStyle(fontSize: 24),
          ),
        )
    );
  }
}
