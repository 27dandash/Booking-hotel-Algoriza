import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';

import '../../layout/cubit/states.dart';

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
          body: ListView.separated(
            //    physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
             Row(
               children: [
                 Container(
                     height: 150,
                     width: 150,
                     child: Image(image: AssetImage('assets/images/onboarding1.jpg'))),

               ],
             ),
                  // Image(image: NetworkImage(cubit!.data[index].images[index])),
                  Text( cubit!.data[index].name),
                  Text( cubit.data[index].price),
                ],
              ),
            ),

            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
            itemCount:1,
          ),
        );
      },
    );
  }
}
