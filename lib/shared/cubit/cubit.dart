

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/settings_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/components/constants.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitiateStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentPosition = 0;

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen()
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
    BottomNavigationBarItem(
        icon: const Icon(
          Icons.settings,
        ),
        label: tabsName[3]),
  ];

  void changeBottomNavigationTab(currentPosition) {
    this.currentPosition = currentPosition;
    emit(AppBottomNavigationStates());
  }

}