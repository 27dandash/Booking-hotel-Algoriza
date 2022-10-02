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