import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/components/constants.dart';

import '../../shared/components/components.dart';

class update_profile extends StatelessWidget {
   update_profile({Key? key}) : super(key: key);
   var formKey = GlobalKey<FormState>();

   var nameController = TextEditingController();
  var emailController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
      title: Text(appTranslation(context).edit_profile),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsDirectional.all(20.0),
          child: Column(
            children: [

              // if (state is UpdateLoadingState)
              //   LinearProgressIndicator(),
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


              // ------------------------- check data is empty or no .
              defaultButton(
                  background: HexColor('FACE7F'),
                  function: () {
                    // if (formKey.currentState!.validate()) {
                    //   ShopCubit.get(context).updateProfileData(
                    //       email: emailController.text,
                    //       phone: phoneController.text,
                    //       name: nameController.text);
                    // }
                  },
                  text:appTranslation(context).updatebutton),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
