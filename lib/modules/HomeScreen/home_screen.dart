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
            appBar: AppBar(
              title: Text(appTranslation(context).fihotel),
            ),
            body: cubit == null ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/onboarding1.jpg'),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        appTranslation(context).pophotel,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 240,
                    width: 500,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return hotel_description(data: cubit!.data![index],);
                          }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                          decoration: BoxDecoration(
                              color: Colors.cyan[100],
                            borderRadius: BorderRadius.circular(30)
                          ),
                            child: Column(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(

                                    height: 150,
                                    width: 300,
                                    child: ClipRRect(

                                        borderRadius: BorderRadius.circular(30),
                                        child: Image(
                                            fit: BoxFit.fitWidth,
                                            image: NetworkImage(
                                                'http://api.mahmoudtaha.com/images/${cubit!.data![index].images[index]}')
                                        )
                                    )
                                )
                                ,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 250,
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
                                        const Icon(
                                          Icons.star_rounded,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        const Icon(
                                          Icons.star_rounded,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        const Icon(
                                          Icons.star_rounded,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        const Icon(
                                          Icons.star_rounded,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        const Icon(
                                          Icons.star_half_sharp,
                                          color: Colors.yellow,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          cubit.data![index].rate,
                                          style: const TextStyle(
                                              color: Colors.blue, fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 5,
                      ),
                      itemCount: 3,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        appTranslation(context).allhotel,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image(
                                              image: NetworkImage(
                                                  'http://api.mahmoudtaha.com/images/${cubit!.data![index].images[index]}')),
                                        )),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            style:
                                                TextStyle(color: Colors.blue),
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
                                            style:
                                                TextStyle(color: Colors.blue),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return hotel_description(data: cubit!.data![index],);
                                          }));
                                    },
                                    child:  Text(appTranslation(context).booknow)),
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
