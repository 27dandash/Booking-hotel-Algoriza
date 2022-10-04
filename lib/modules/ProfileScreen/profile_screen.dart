import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shop_app/modules/ProfileScreen/cubit/cubit.dart';
import 'package:shop_app/modules/ProfileScreen/uodate_profile.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/SharedPreferences.dart';
import '../register/cubit/states.dart';

class profile_screen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit=AppCubit.get(context).userModel;
            return SafeArea(
              child: Column(
                children: [
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 100,
                      color: Colors.blue,
                      child: Center(
                          child: Text(
                            "Profile Screen",
                            style: TextStyle(fontSize: 25),
                          )),
                    ),
                  ),
           //      Text('${cubit.userModel!.data!.name}'),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                              height: 50,
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return update_profile();
                                    }));
                              },
                              child: Row(
                                children: [
                                  Text('Update Profilr')
                                ],
                              )
                          ),
                        ),

                        SizedBox(height: 15,),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                              height: 50,
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                AppCubit.get(context).onchangeappmode();
                              },
                              child: Row(
                                children: [
                                  SizedBox(width: 15,),
                                  const Text('Change App Theme'),
                                  Spacer(),
                                  IconButton(onPressed: () {},
                                      icon: Icon(Icons.switch_camera_sharp))
                                ],
                              )

                          ),
                        ),
                        SizedBox(height: 15,),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                              height: 50,
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                AppCubit.get(context).changeLanguage();
                              },
                              child: Row(
                                children: [
                                  SizedBox(width: 15,),
                                  const Text('Change Language'),
                                  Spacer(),
                                  IconButton(onPressed: () {},
                                      icon: Icon(Icons.language))
                                ],
                              )

                          ),
                        ),
                        SizedBox(height: 15,),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                              height: 50,
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                signOut(context);
                              },
                              child: Row(
                                children: [
                                  SizedBox(width: 15,),
                                  const Text('LogOut'),
                                  Spacer(),
                                  IconButton(onPressed: () {},
                                      icon: Icon(Icons.logout))
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

/*
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';

class profile_screen extends StatelessWidget {
  profile_screen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // var model = AppCubit.get(context).userModel;
        // nameController.text = model!.data!.name!;
        // emailController.text = model.data!.email!;
      //  phoneController.text = model.data!.phone!;

        return BuildCondition(
          condition:AppCubit.get(context).userModel != null,
          builder: (context) =>
              Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.all(20.0),
                    child: Column(
                      children: [
                        if (state is UpdateLoadingState)
                          LinearProgressIndicator(),
                        // ------------------------------------ name
                        defaultFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "name must not be empty";
                              }
                              return null;
                            },
                            label: "name",
                            prefix: Icons.person_pin_rounded),

                        // ------------------------------------ email
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "email must not be empty";
                              }
                              return null;
                            },
                            label: "email",
                            prefix: Icons.email_rounded),
                        // ------------------------------------ phone

                        defaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "phone must not be empty";
                              }
                              return null;
                            },
                            label: "phone",
                            prefix: Icons.phone_iphone_rounded),
                        // ------------------------- check data is empty or no .
                        defaultButton(
                            background: HexColor('FACE7F'),
                            function: () {
                              if (formKey.currentState!.validate()) {
                                ShopCubit.get(context).updateProfileData(
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    name: nameController.text);
                              }
                            },
                            text: "Update"),
                        SizedBox(height: 10,),
                        defaultButton(
                            function: () {
                              signOut(context);
                            },
                            text: "log out"),
                      ],
                    ),
                  ),
                ),
              ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
 */
