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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // height: 150,
              child: Image.network(
                 'http://api.mahmoudtaha.com/images/${data.images[0]}'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 15.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Price : ${data.price}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      // Text(
                      //   '${cubit!.data!.price} EGP',
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .bodyText1!
                      //       .copyWith(
                      //     color: Colors.blue,
                      //   ),
                      //   maxLines: ShopCubit.get(context).maxLines,
                      // ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 8.0,),
            Divider(),

            Column(children: [
              const SizedBox(
                height: 30,
              ),
              Text(
              ' text: item.name.toUpperCase(),',
                maxLines: 3,

              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child:  Text(
                        ' text: item.address.toUpperCase(),',
                        maxLines: 3,

                      ),
                    ),

                  ],
                ),
              ),

            Text(
              ' text: item.dessription.toUpperCase(),',
              maxLines: 3,

            ),




            ]
            )
          ],
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
}
