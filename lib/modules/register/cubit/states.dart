import 'package:shop_app/models/loginModel.dart';

import '../../../models/register_model.dart';

abstract class ProfileStates {}

class RegisterInitialState extends ProfileStates {}

class RegisterLoadingState extends ProfileStates {}

class RegisterSuccessState extends ProfileStates {
  final RegisterModel? registerModel;
  RegisterSuccessState(this.registerModel);
}

class RegisterChangePasswordState extends ProfileStates {}

class RegisterErrorState extends ProfileStates {
  final String? error;
  RegisterErrorState(this.error);
}