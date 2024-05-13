import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/strings.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusinessData(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, AppStates state) {  },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
         return Scaffold(
            appBar: AppBar(
              title: Text(appName),
              actions: [
                IconButton(onPressed: (){

                }, icon: Icon(Icons.search))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: cubit.bottomItems,
            currentIndex: cubit.currentPosition,
            onTap: (value) {
              cubit.changeBottomNavigationTab(value);
            },),
           body: cubit.screens[cubit.currentPosition],
          );
        }
      ),
    );
  }
}
