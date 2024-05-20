import 'package:dio/dio.dart';
import 'package:news_app/shared/components/constants.dart';

class DioHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true
      )
    );
  }

  static Future<Response> getData({required path , required Map<String, dynamic> queryParameters }) async {
    return await dio.get(path ,queryParameters:queryParameters);
  }

  static Future<Response> getArticlesByCategoryData(category,isEnglish) async {
    return
        await getData(path: topHeadLineApi, queryParameters: {
          'country':isEnglish?'us':'eg',
          'category':category,
          'apiKey':apiKey,
        }
        );

  }

  static Future<Response> getSearchData(value) async {
    return
      await getData(path: topHeadLineApi, queryParameters: {
        'q':value,
        'apiKey':apiKey,
      }
      );
  }
}