import 'package:shop_app/models/loginModel.dart';

abstract class AppState  {}

class ShopInitialState extends AppState {}


class LoginChangePasswordState extends AppState {}



class ShopChangeState extends AppState {}


class ShopLoadingState extends AppState {}
class ShowMoreState extends AppState {}
//------------------------mode
class ChangeThemeloadState extends AppState {}
class ChangeThemeSuccessState extends AppState {}
// -------------------- Translation

class ChangeLanguageState extends AppState {}

class LanguageLoaded extends AppState {}

// -------------------- no internet

class InternetState extends AppState {}




