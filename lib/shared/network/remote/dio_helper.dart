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

  static Future<Response> getBusinessData() async {
    return
        await getData(path: topHeadLineApi, queryParameters: {
          'country':'eg',
          'category':'business',
          'apiKey':apiKey,
        }
        );

  }
}