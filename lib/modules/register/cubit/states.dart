import 'package:shop_app/models/loginModel.dart';

import '../../../models/register_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final RegisterModel? registerModel;
  RegisterSuccessState(this.registerModel);
}

class RegisterChangePasswordState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String? error;
  RegisterErrorState(this.error);
}