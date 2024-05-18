import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/cubit/states.dart';


Widget defaultButton({
  required String title,
  Color color = Colors.indigoAccent,
  double radius = 10.0,
  required VoidCallback function,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      height: 46,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          "$title",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultTextFormField(
    {required TextEditingController controller,
      required String labelText,
      required Icon prefixIcon,
      IconButton? suffixIcon = null,
      bool obscureText = false,
      bool isReadOnly = false,
      required TextInputType type,
      required FormFieldValidator validator,
      GestureTapCallback? onTab,
      ValueChanged<String>? onChanged
}
) =>
    TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
      keyboardType: type,
      onTap: onTab,
      readOnly: isReadOnly,
      onChanged: onChanged ,
    );

Widget taskItem(Map article, BuildContext context) {
  return Dismissible(
    key: Key(article['author'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(article['urlToImage'].toString()),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: Text(
                      "${article["title"]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                  ],
                ),
                Container(
                    width: double.infinity,
                    child: Text("${article["publishedAt"]}",
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis)))
              ],
            ),
          )
        ],
      ),
    ),
    onDismissed: (direction) {},
  );
}

Widget newsItemBuilder(List<dynamic> article, String messageNoArticle,
    AppStates state, BuildContext context) {
  return ConditionalBuilder(
      condition: article.isNotEmpty,
      fallback: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.orange,
          ),
        );
      },
      builder: (context) {
        return ConditionalBuilder(
          condition: state != AppLoadingBusinessStates ||
              state != AppLoadingScienceStates ||
              state != AppLoadingSportsStates,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return taskItem(article[index], context);
              },
              separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20.0),
                    child: Container(
                      color: Colors.grey,
                      child: const SizedBox(
                        width: double.infinity,
                        height: 1,
                      ),
                    ),
                  ),
              itemCount: article.length),
          fallback: (context) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.menu,
                  size: 100,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    messageNoArticle,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

void pushTo(context, Widget screen) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));