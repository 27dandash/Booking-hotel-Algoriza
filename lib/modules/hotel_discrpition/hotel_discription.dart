import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/network/endPoints.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/hoelTest.dart';
import '../../models/hoelTest.dart';
import '../../shared/components/constants.dart';

class hotel_description extends StatelessWidget {
  final DataModel data;
  const hotel_description({Key? key,required this.data}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appTranslation(context).details
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                width: double.infinity,
                 // height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                     'http://api.mahmoudtaha.com/images/${data.images[0]}'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
               Text(
               'name : ${ data.name.toUpperCase()}',style: TextStyle(fontSize: 20),
                maxLines: 1,

              ),
               Text(
               'price : ${ data.price.toUpperCase()} per night',style: TextStyle(fontSize: 20),
                maxLines: 1,

              ),
               Text(
               'Description : ',style: TextStyle(fontSize: 20),
                maxLines: 5,

              ),
               Container(
                 decoration: BoxDecoration(
                     color: Colors.grey,
                   borderRadius: BorderRadius.circular(20)
                 ),

                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                     data.description ,style: TextStyle(fontSize: 20),
                    maxLines: 5,

              ),
                 ),
               ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'See More ',style: TextStyle(fontSize: 20,color: Colors.blue),
                    maxLines: 5,

                  ),
                ],
              ),
              // SizedBox(
              //   child: ListView.separated(
              //       scrollDirection: Axis.vertical,
              //       itemBuilder: (context, index) =>padding(),
              //       separatorBuilder: (context, index) => SizedBox(
              //         width: 7,
              //       ),
              //       itemCount: 1),
              // )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {},
              elevation: 5,
              backgroundColor: HexColor('#EFEEEE'),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              child: const Icon(
                Icons.favorite_border_rounded,
                color: Colors.black,
              ),
            ),
        Container(
          height: 40,
          width: 190,
          child: MaterialButton(
            child: Text(appTranslation(context).booknow),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              //  cubit.createBooking(hotelId: item.id);
            },
          ),
        ),

          ],
        ),
      ),
    );
  },
);
  }
  Widget padding()=>  Column(
    children: [
      Container(
        height: 200,
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            'http://api.mahmoudtaha.com/images/${data.images[1]}',fit: BoxFit.fill,),
        ),
      ),
      Container(
        height: 200,
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            'http://api.mahmoudtaha.com/images/${data.images[2]}',fit: BoxFit.fill,),
        ),
      ),
      Container(
        height: 200,
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            'http://api.mahmoudtaha.com/images/${data.images[3]}',fit: BoxFit.fill,),
        ),
      ),
    ],
  );
}
