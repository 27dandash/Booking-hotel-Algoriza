// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/loginModel.dart';
import 'package:shop_app/models/register_model.dart';
import 'package:shop_app/modules/login/cubit/states.dart';
import 'package:shop_app/modules/register/cubit/states.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/dio.dart';
import 'package:shop_app/shared/network/endPoints.dart';

import '../../../shared/components/constants.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(RegisterInitialState());
  static ProfileCubit get(context)=> BlocProvider.of(context);

  RegisterModel? registerModel;

  void userRegister({
    required String name,
    required String email,
    required String confirmPassword,
    required String password,
  }) {
    emit(RegisterLoadingState());
;
    DioHelper.postData(url:profileEndPoint, data: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    }) .then((value){
      registerModel = RegisterModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel));
    }).catchError((error) {
      print(error);
      emit(RegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_rounded;
  bool isPasswordShow = true;

  void changePassword() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow ? Icons.visibility_rounded : Icons.visibility_off_rounded;
    emit(RegisterChangePasswordState());
  }
}