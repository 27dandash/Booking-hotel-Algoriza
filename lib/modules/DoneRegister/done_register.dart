import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class done_register extends StatelessWidget {
  const done_register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Icon(Icons.done,size: 30,),
          Text('Registertion Done Successfuly',style: TextStyle(fontSize: 25),),
        Spacer(),
        Container(
          width: double.infinity,
          child: Row(
            children: [
              TextButton(onPressed: (){}, child: Row(children: [
                Text('Call Us'),
                Icon(Icons.call)],), )
            ],
          ),
        )
        ],
      ),
    );
  }
}
