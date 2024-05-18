import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/settings_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/shared_preferences.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitiateStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentPosition = 0;

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: const Icon(
          Icons.business_sharp,
        ),
        label: tabsName[0]),
    BottomNavigationBarItem(
        icon: const Icon(
          Icons.sports,
        ),
        label: tabsName[1]),
    BottomNavigationBarItem(
        icon: const Icon(
          Icons.science,
        ),
        label: tabsName[2]),
  ];

  void changeBottomNavigationTab(currentPosition) {
    this.currentPosition = currentPosition;
    emit(AppBottomNavigationStates());
  }

  List<dynamic> businessArticles = [];
  List<dynamic> scienceArticles = [];
  List<dynamic> sportArticles = [];

  void getBusinessData() {
    emit(AppLoadingBusinessStates());
    DioHelper.getArticlesByCategoryData(businessCategory).then((value) {
      businessArticles = value.data["articles"];
      print(businessArticles.toString());
      emit(AppSuccessBusinessStates());
    }).catchError((error) {
      print(error.toString());
      emit(AppFailureBusinessStates(error.toString()));
    });
  }

  void getSciencesData() {
    emit(AppLoadingScienceStates());
    DioHelper.getArticlesByCategoryData(scienceCategory).then((value) {
      scienceArticles = value.data["articles"];
      print(scienceArticles.toString());
      emit(AppSuccessScienceStates());
    }).catchError((error) {
      print(error.toString());
      emit(AppFailureScienceStates(error.toString()));
    });
  }

  void getSportsData() {
    emit(AppLoadingSportsStates());
    DioHelper.getArticlesByCategoryData(sportsCategory).then((value) {
      sportArticles = value.data["articles"];
      print(sportArticles.toString());
      emit(AppSuccessSportsStates());
    }).catchError((error) {
      print(error.toString());
      emit(AppFailureSportsStates(error.toString()));
    });
  }

  var isDarkMode = false;

  void changeThemeMode({bool? isDarkFromShared}) {
    if (isDarkFromShared != null) {
      isDarkMode = isDarkFromShared;
      emit(AppChangeThemeModeStates());
    } else {
      isDarkMode = !isDarkMode;
      CacheHelper.setBool(key: "isDark", value: isDarkMode).then(
        (value) {
          emit(AppChangeThemeModeStates());
        },
      );
    }
  }
}
