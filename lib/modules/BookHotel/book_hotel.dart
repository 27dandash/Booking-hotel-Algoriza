import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class book_hotel extends StatelessWidget {
  const book_hotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: NetworkImage('https://th.bing.com/th/id/R.0e7b760375395d292b2c7bcb98fa3790?rik=ctIDN2khEvWmlA&riu=http%3a%2f%2f1.bp.blogspot.com%2f-_rxw_REYYg0%2fUJA4e2Yye2I%2fAAAAAAAAD8o%2fRijg8xOF48I%2fs1600%2fwallpaper15.jpg&ehk=kLA1ROX%2fuJHDWaPjLMkCGM60nInn4KzTnG6WIM1y4Ak%3d&risl=&pid=ImgRaw&r=0'),
          // ),
        ),
        child: Center(

          child:Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child:const Image(
                  image: AssetImage('assets/images/onboarding1.jpg'),
                ),
              ),
SizedBox(height: 20,),
Row(
  children: [
    Text('Your Booking Id Is : ',style: TextStyle(fontSize: 29)),
    Text('1834',style: TextStyle(fontSize: 29)),

  ],
),
              SizedBox(height: 20,),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.done,size: 150,),
                  Text('Booking done Successfuly',style: TextStyle(fontSize: 29),)
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}
