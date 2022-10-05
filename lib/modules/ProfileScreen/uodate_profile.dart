import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/shared/components/constants.dart';

import '../../layout/cubit/states.dart';
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
        child: BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    if (state is UpdateProfileSuccessDataState) {
      nameController.text = state.profileData!.name!;
      emailController.text = state.profileData!.email!;
      showToast(message: 'مبروووك', toastStates: ToastStates.SUCCESS);
    }
  },
  builder: (context, state) {
    var model = AppCubit.get(context).profileData;
    nameController.text = model!.name!;
    emailController.text = model.email!;

    var cubit=AppCubit.get(context).profileData;
    var bloc =AppCubit.get(context);
    return Padding(
          padding: EdgeInsetsDirectional.all(20.0),
          child: Column(
            children: [

              // if (state is UpdateLoadingState)
              //   LinearProgressIndicator(),

              GestureDetector(
                onTap: (){
                  bloc.pickImage();
                },
                child:  bloc.imageFile != null ?
                SizedBox(
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image(image: FileImage(File(bloc.imageFile!.path,)),fit: BoxFit.cover,height: 150,width: 150),
                        GestureDetector(
                            onTap: (){
                              bloc.removeImage();
                            },
                            child: CircleAvatar(child: Icon(Icons.delete,size: 25,))),

                      ],
                    ),
                  ),
                ) :
                SizedBox(
                  height: 150,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network('${cubit!.image}',fit: BoxFit.cover,height: 150,width: 150,)),
                ),
              ),
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
              if (state is !UpdateProfileLoadingDataState)
              defaultButton(
                  background: HexColor('FACE7F'),
                  function: () {
                    bloc.getUpdateProfileData(
                        name: nameController.text,
                        email: emailController.text,
                    );
                    },
                  text:appTranslation(context).updatebutton),

              if (state is UpdateProfileLoadingDataState)
                const Center(child: CircularProgressIndicator()),
              SizedBox(height: 10,),

            ],
          ),
        );
  },
),
      ),
    );
  }
}
