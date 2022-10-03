import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';

import '../../layout/cubit/states.dart';
import '../../shared/components/constants.dart';

class exploar_screen extends StatelessWidget {
  exploar_screen({Key? key}) : super(key: key);
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=AppCubit.get(context).searchModel;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              appTranslation(context).search,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            actions: [
              // IconButton(onPressed: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context){
              //     return MapSample();
              //   }));
              // }, icon: const Icon(Icons.my_location))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: IconButton(
                        onPressed: () {
                          AppCubit.get(context).getSearch(
                              name: textController.text
                          );
                        },
                        icon: const Icon(Icons.search),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter your product name';
                      }
                      return null;
                    },
                    onFieldSubmitted: (String text) {
                      AppCubit.get(context).getSearch(name: text);
                    },
                  ),
                //  if (state is SearchFilterLoadingState)
                    const SizedBox(
                      height: 35,
                    ),
                //  const LinearProgressIndicator(),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state is SearchFilterSuccessState)
              Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: SizedBox(
            height: 124,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'The westin dhaka',
                          style: TextStyle(fontSize: 16),
                        ),
                        const Text(
                          'Kensington palace',
                          style: TextStyle(
                              fontSize: 12, color: Color(0XFFC1C1C1)),
                        ),
                        const Text(
                          '\$180/night',
                          style: TextStyle(
                              fontSize: 12, color: Color(0XFF060B92)),
                        ),

                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: -1,
                    child: Container(
                        child: Image.network(
                            'https://picsum.photos/250?image=9'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
