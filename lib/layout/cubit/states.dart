import 'package:shop_app/models/loginModel.dart';
import 'package:shop_app/models/profile_model.dart';

abstract class AppState  {}

class ShopInitialState extends AppState {}


class LoginChangePasswordState extends AppState {}



class ShopChangeState extends AppState {}


class ShopLoadingState extends AppState {}
class ShowMoreState extends AppState {}
//-------------------------------------------updateprofilestate
class UpdateProfileLoadingDataState extends AppState {}
class UpdateProfileSuccessDataState extends AppState {
}
class UpdateProfileErrorDataState extends AppState {
  final String? error;
  UpdateProfileErrorDataState(this.error);
}
//-------------------------------------------getprofilestate

class ProfileLoadingDataState extends AppState {}
class ProfileSuccessDataState extends AppState {
}
class ProfileErrorDataState extends AppState {
  final String? error;
  ProfileErrorDataState(this.error);
}
//-------------------------------------------getsearch
class SearchFilterLoadingState extends AppState {}
class SearchFilterSuccessState extends AppState {}
class SearchFilterErrorState extends AppState {
  String error;
  SearchFilterErrorState(this.error);
}
//----------------------------------------gethotelstates
class GetHotelDataLoading extends AppState {}
class GetHotelDataSuccess extends AppState {
  // HotelModel? hotelModel;
  //
  // GetHotelDataSuccess(this.hotelModel);
}
class GetHotelDataError extends AppState {
  String ? error;

  GetHotelDataError(this.error);
}

//------------------------mode
class ChangeThemeloadState extends AppState {}
class ChangeThemeSuccessState extends AppState {}
// -------------------- Translation

class ChangeLanguageState extends AppState {}

class LanguageLoaded extends AppState {}

// -------------------- no internet

class InternetState extends AppState {}




