import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/layout/Home.dart';
import 'package:shop_app/modules/login/loginScreen.dart';
import 'package:shop_app/modules/register/cubit/cubit.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/myBlocObserver.dart';
import 'package:shop_app/shared/network/SharedPreferences.dart';
import 'package:shop_app/shared/network/dio.dart';
import 'package:shop_app/shared/styles/theme/app_theme.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'modules/login/cubit/cubit.dart';
import 'modules/on_boarding/onBoarding.dart';
import 'shared/components/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  SharedPreferences.getInstance();
  Widget widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  token = CacheHelper.getData(key: 'token');
  bool? isdark = CacheHelper.getData(key: 'Isdark');
  isRtl = CacheHelper.getData(key: 'isRtl') == null
      ? false
      : CacheHelper.getData(key: 'isRtl');

  String translation = await rootBundle
      .loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');
  if (onBoarding == true) {
    if (token != null) {
      widget = const Home();
      print(token);
    } else
      widget = LoginScreen();
  } else
    widget = OnBoardingScreen();
  print(onBoarding);

  runApp(MyApp(
    startWidget: widget,
    isRtl: isRtl,
    translation: translation,
    isdark: isdark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isdark;
  final Widget startWidget;
  final bool isRtl;
  final String translation;

  MyApp(
      {required this.startWidget,
      this.isdark,
      required this.isRtl,
      required this.translation});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider<AppCubit>(
            create: (BuildContext context) => AppCubit()
              ..checkConnectivity()
              ..setTranslation(translation: translation)
              ..onchangeappmode(formShared: isdark)
              ..gethotels()
              ..getSearch()
              ..getProfileData()
              // ..getUpdateProfileData(name:'عبدالرحمن دندش',email: 'ww@gmail.com')
              ),
        BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit())
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme().lightTheme,
            darkTheme: AppTheme().darkTheme,
            themeMode: cubit.isappmode ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
