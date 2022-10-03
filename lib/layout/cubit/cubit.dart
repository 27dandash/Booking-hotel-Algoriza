import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/models/hoelTest.dart';
import 'package:shop_app/models/profile_screen.dart';
import 'package:shop_app/models/search_model.dart';

import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/SharedPreferences.dart';
import 'package:shop_app/shared/network/dio.dart';
import 'package:shop_app/shared/network/endPoints.dart';

import '../../modules/ExploarScreen/exploar_screen.dart';
import '../../modules/HomeScreen/home_screen.dart';
import '../../modules/ProfileScreen/profile_screen.dart';
import '../../translation.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(ShopInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_rounded;
  bool isPasswordShow = true;
  int currentIndex = 0;

  int? maxLines;
  bool seeMore = true;

  List<Widget> bottomScreen = [
    home_screen(),
    exploar_screen(),
    profile_screen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeState());
  }

  void changePassword() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow
        ? Icons.visibility_rounded
        : Icons.visibility_off_rounded;
    emit(LoginChangePasswordState());
  }
//-------------------------------------------------getsearch
  HoelTest ? searchModel;

  void getSearch(
      {
        String address='',
        int? maxPrice=90000,
        int? minPrice=0,
        int? count= 0,
        int? page=0,
        int? facilities=0,
        double? latitude=0.0,
        double? longitude=0.0,
        int? distance=0,
        String? name='',
      }
      ) {
    emit(SearchFilterLoadingState());

    DioHelper.getData(url: searchEndPoint, query: {
      'name': name,
      'count': count,
      'address': address,
      'page': page,
      'max_price': maxPrice,
      'min_price': minPrice,
      'latitude': latitude,
      'longitude': longitude,
      'distance': distance,
      'facilities[0]': facilities == 0 ? [] : facilities,
    }).then((value) {
      searchModel = HoelTest.fromJson(value.data['data']);

      print("========Search============${searchModel!.data!.length}");

      print("========Search============$searchModel");
      emit(SearchFilterSuccessState());
    }).catchError((onError) {
      print('#################errorSearch##########');
      print(onError.toString());
      emit(SearchFilterErrorState(onError.toString()));
    });
  }
  //----------------------------------------------gethotel
  HoelTest? hotelModel;

  void gethotels() {
    emit(GetHotelDataLoading());
    DioHelper.getData(url: homeEndPoint, query: {
      'count': 10,
      'page': 1,
    }).then((value) {
      // value.for
      hotelModel = HoelTest.fromJson(value.data['data']);
      print('###########################');
      // print(hotelModel!.data[2].name);
      // print(hotelModel!.data[2].images[0]);
      emit(GetHotelDataSuccess());

    }).catchError((error) {
      print('#################error##########');

      print(error.toString());
      emit(GetHotelDataError(error.toString()));
    });
  }

// ---------------------------------------- get profile data

  ProfileModel? userModel;

  void getSettingData() {
    emit(ShopLoadingGetSettingDataState());
    print('name is error ');
    DioHelper.getData(url: profileEndPoint, token: token).then((value) {
      userModel = ProfileModel.fromJson(value.data);
      emit(ShopSuccessGetSettingDataState(userModel!));
    }).catchError((onError) {
      print(onError.toString());
      print('name is error ');
      emit(ShopErrorGetSettingDataState(onError.toString()));
    });
  }

// ---------------------------------------- change mode
  bool isappmode = false;

  void onchangeappmode({bool? formShared}) {
    emit(ChangeThemeloadState());
    if (formShared != null) {
      isappmode = formShared;
      emit(ChangeThemeSuccessState());
    } else {
      isappmode = !isappmode;
      CacheHelper.saveData(key: 'Isdark', value: isappmode).then((value) {
        emit(ChangeThemeSuccessState());
      });
    }
  }

// ---------------------------------------- Translation
  void changeLanguage() async {
    isRtl = !isRtl;

    CacheHelper.saveData(key: 'isRtl', value: isRtl);
    String translation = await rootBundle
        .loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');
    setTranslation(
      translation: translation,
    );

    emit(ChangeLanguageState());
  }

  late TranslationModel translationModel;

  void setTranslation({
    required String translation,
  }) {
    translationModel = TranslationModel.fromJson(json.decode(
      translation,
    ));
    emit(LanguageLoaded());
  }

  // ------------------------------------ no internet

  bool noInternetConnection = false;

  void checkConnectivity() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      debugPrint('Internet Connection ------------------------');
      debugPrint('${result.index}');
      debugPrint(result.toString());
      if (result.index == 0 || result.index == 1) {
        noInternetConnection = false;
      } else if (result.index == 2) {
        noInternetConnection = true;
      }

      emit(InternetState());
    });
  }

  void checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      noInternetConnection = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      noInternetConnection = false;
    } else {
      noInternetConnection = true;
    }
    emit(InternetState());
  }
}
