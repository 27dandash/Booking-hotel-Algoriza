import 'package:shop_app/models/hotelModel.dart';
import 'package:shop_app/models/loginModel.dart';
import 'package:shop_app/models/profile_screen.dart';

abstract class AppState  {}

class ShopInitialState extends AppState {}


class LoginChangePasswordState extends AppState {}



class ShopChangeState extends AppState {}


class ShopLoadingState extends AppState {}
class ShowMoreState extends AppState {}
//----------------------------------------gethotelstates
class GetHotelDataLoading extends AppState {}
class GetHotelDataSuccess extends AppState {
  HotelModel? hotelModel;

  GetHotelDataSuccess(this.hotelModel);
}
class GetHotelDataError extends AppState {
  String ? error;

  GetHotelDataError(this.error);
}

//-----------------------------------------profile
class ShopLoadingGetSettingDataState extends AppState {}
class ShopSuccessGetSettingDataState extends AppState {
  final ProfileModel model;
  ShopSuccessGetSettingDataState(this.model);
}
class ShopErrorGetSettingDataState extends AppState {
  final String? error;
  ShopErrorGetSettingDataState(this.error);
}
//------------------------mode
class ChangeThemeloadState extends AppState {}
class ChangeThemeSuccessState extends AppState {}
// -------------------- Translation

class ChangeLanguageState extends AppState {}

class LanguageLoaded extends AppState {}

// -------------------- no internet

class InternetState extends AppState {}




