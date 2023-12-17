
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medixify/blocs/app_cubit/common_cubit.dart';
import 'package:medixify/blocs/login_regiser_cubit/login_register_cubit.dart';
import 'package:medixify/moduels/home/home.dart';
import 'package:medixify/moduels/item/item.dart';
import 'package:medixify/moduels/login/login_screen.dart';
import 'package:medixify/moduels/on_boarding/onboarding_screen.dart';
import 'package:medixify/shared/constans/constans.dart';
import 'package:medixify/shared/network/local/shared_preferebces.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/shared/network/remote/dio_helper.dart';
import 'package:medixify/shared/style/app_theme.dart';

import 'bloc_observer.dart';
import 'blocs/app_cubit/common_states.dart';
import 'generated/l10n.dart';
import 'layout/medixify/cubit/app_cubit.dart';
import 'layout/medixify/medixify.dart';
import 'package:flutter/services.dart';






void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
    )
  );
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.InitSharedPreferences();
  DioHelper.InitDio();
  Widget screen=OnBoardingScreen();
  if(token!=null)
    {
      screen=MedixifyApp();
    }





  runApp( MyApp(
  screen: screen,));
}

class MyApp extends StatelessWidget {
  MyApp({super.key,

    required this.screen
  });

 late Widget screen;



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>MedixifyCubit()..getData(),
        ),
        BlocProvider(create: (context)=>CommonCubit()),
        BlocProvider(create: (context)=>LoginAndRegisterCubit())
      ],

      child: BlocConsumer<CommonCubit,CommonStates>(
        listener: (context,state){

        },
        builder: (context,state)
        {
              if(CachHelper.getSharedPreferences('arabic')!=null&&
                  CachHelper.getSharedPreferences('arabic')=='العربية')
                {
                  CommonCubit.get(context).isarabic=true;
                }




          return MaterialApp(
            locale: Locale(CommonCubit.get(context).isarabic?'ar':'en'),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'), // English
              Locale('ar'), // Arabic
            ],
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme,
            themeMode: ThemeMode.light,
            home:screen,
          );
        },

      )
    );
  }
}

