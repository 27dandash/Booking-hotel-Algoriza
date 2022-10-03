import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/shared/components/constants.dart';

import '../../layout/cubit/states.dart';
import '../hotel_discrpition/hotel_discription.dart';

class home_screen extends StatelessWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context).hotelModel;
        return Scaffold(
            body: SingleChildScrollView(

              child: Column(
          children: [
              const Image(
                image: AssetImage('assets/images/onboarding1.jpg'),
              ),
              Text(appTranslation(context).pophotel),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const hotel_description();
                  }));
                },
                child: SizedBox(
                  height: 240,
                  child: ListView.separated(
                    //   physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            height: 150,
                            width: 180,
                            child: Image(
                                image: NetworkImage(
                                    'http://api.mahmoudtaha.com/images/${cubit!.data![index].images[index]}'))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 270,
                              child: Text(
                                cubit.data![index].name,
                                maxLines: 1,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            SizedBox(
                                width: 250,
                                child: Text(
                                  cubit.data![index].address,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 15),
                                )),
                            Row(
                              children: [
                                Text('Price : '),
                                Text(
                                  cubit.data![index].price,
                                  style: TextStyle(color: Colors.blue),
                                ),
                                Text(' per night')
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rate_sharp,
                                  color: Colors.blue,
                                ),
                                Icon(
                                  Icons.star_rate_sharp,
                                  color: Colors.blue,
                                ),
                                Icon(
                                  Icons.star_rate_sharp,
                                  color: Colors.blue,
                                ),
                                Icon(
                                  Icons.star_rate_sharp,
                                  color: Colors.blue,
                                ),
                                Icon(
                                  Icons.star_half_sharp,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  cubit.data![index].rate,
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 5,
                    ),
                    itemCount: 3,
                  ),
                ),
              ),
              Text(appTranslation(context).allhotel),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan[100],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                    height: 100,
                                    width: 150,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image(
                                          image: NetworkImage(
                                              'http://api.mahmoudtaha.com/images/${cubit!.data![index].images[index]}')),
                                    )),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 170,
                                    child: Text(
                                      cubit.data![index].name,
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  SizedBox(
                                      width: 170,
                                      child: Text(
                                        cubit.data![index].address,
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      Text('Price : '),
                                      Text(
                                        cubit.data![index].price,
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      Text(' per night')
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rate_sharp,
                                        color: Colors.blue,
                                      ),
                                      Icon(
                                        Icons.star_rate_sharp,
                                        color: Colors.blue,
                                      ),
                                      Icon(
                                        Icons.star_rate_sharp,
                                        color: Colors.blue,
                                      ),
                                      Icon(
                                        Icons.star_rate_sharp,
                                        color: Colors.blue,
                                      ),
                                      Icon(
                                        Icons.star_half_sharp,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        cubit.data![index].rate,
                                        style: TextStyle(color: Colors.blue),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            width: 300,
                            child: MaterialButton(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {},
                                child: const Text('Book Now')),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: cubit!.data!.length - 2,
              ),
          ],
        ),
            ));
      },
    );
  }
}
