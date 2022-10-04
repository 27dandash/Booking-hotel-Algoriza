import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/SharedPreferences.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../../layout/Home.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/constants.dart';
import '../../shared/components/constants.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var ConfiemPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, ProfileStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
            showToast(
                message:'Register Done',
                toastStates: ToastStates.SUCCESS);
            CacheHelper.saveData(
                key: 'user_id', value: state.registerModel!.data!.id);
            CacheHelper.saveData(
                key: 'token', value: state.registerModel!.data!.token)
                .then((value) {
              token = state.registerModel!.data!.token;
              navigateFinish(context, const Home());
            });

        }
        if (state is RegisterErrorState) {
          showToast(
              message:'Error While Register',
              toastStates: ToastStates.ERROR);

        }

      },
      builder: (context, states) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Register',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: colorDefault, fontSize: 33),
                      ),
                      // ------------------------------------ name
                      const SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'isEmpty';
                            }
                          },
                          label: 'name',
                          prefix: Icons.person),
                      // ------------------------------------ email
                      const SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'isEmpty';
                            }
                          },
                          label: 'email',
                          prefix: Icons.email),
                      // ------------------------------------ phone
                      const SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                          controller: ConfiemPasswordController,
                          type: TextInputType.visiblePassword,
                          isPassword: RegisterCubit.get(context).isPasswordShow,
                          suffixPressed: () {
                            RegisterCubit.get(context).changePassword();
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'isEmpty';
                            }
                          },
                          label: 'label',

                          suffix: RegisterCubit.get(context).suffix,
                          prefix: Icons.lock_outline_rounded),
                      // ------------------------------------ password
                      const SizedBox(
                        height: 10,
                      ),
                      defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          isPassword: RegisterCubit.get(context).isPasswordShow,
                          suffixPressed: () {
                            RegisterCubit.get(context).changePassword();
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'isEmpty';
                            }
                          },
                          label: 'label',
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).userRegister(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  confirmPassword: ConfiemPasswordController.text,
                                  name: nameController.text);
                            }
                          },
                          suffix: RegisterCubit.get(context).suffix,
                          prefix: Icons.lock_outline_rounded),
                      // ------------------------------------ button login .
                      SizedBox(
                        height: 20,
                      ),
                      BuildCondition(
                        condition: states is! RegisterLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).userRegister(
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: ConfiemPasswordController.text,
                                name: nameController.text,
                              );
                            }
                          },
                          text: 'Sign Up',
                          isUpperCase: true,
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
