import 'package:shop_app/models/loginModel.dart';

import '../../../models/register_model.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {
  // final ProfileModel? registerModel;
  // ProfileSuccessState(this.registerModel);
}

class ProfileErrorState extends ProfileStates {
  final String? error;
  ProfileErrorState(this.error);
}