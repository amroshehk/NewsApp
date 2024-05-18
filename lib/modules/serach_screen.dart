
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  var searchController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        var list = AppCubit
            .get(context)
            .search;
        print("SearchScreen $state");
        return Scaffold(
          appBar: AppBar(),
          body: Column(children:[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: defaultTextFormField(
                controller: searchController,
                labelText: "Serach",
                prefixIcon: Icon(Icons.search),
                type: TextInputType.text,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Must enter search";
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  AppCubit.get(context).getSearch(value);
                },
              ),
            ),
            Expanded(child: newsItemBuilder(list, "no business articles",state,context))
          ] ),
        );
      },
    );
  }
}
