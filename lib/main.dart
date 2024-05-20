import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_layout.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/cubit_observer.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/shared_preferences.dart';
import 'package:news_app/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark= CacheHelper.getBool(key: "isDark");
  bool? isEnglish= CacheHelper.getBool(key: "isEnglish");
  Bloc.observer = AppBlocObserver();
  runApp(MyApp(isDark,isEnglish));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  bool? isEnglish;
  MyApp(this.isDark,this.isEnglish, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusinessData()..changeThemeMode(isDarkFromShared: isDark)..changeLanguage(isEnglishShared: isEnglish),
        child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
    builder: (context, state) {
      var cubit = AppCubit.get(context);
     return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: AppCubit.get(context).isDarkMode ? ThemeMode.dark :  ThemeMode.light ,
          darkTheme: darkTheme(),
          theme: lightTheme(),
          home: Directionality(
              textDirection: cubit.isEnglish ? TextDirection.ltr:TextDirection.rtl,
              child: NewsLayout()),
        );}
      ),
    );
  }
}
