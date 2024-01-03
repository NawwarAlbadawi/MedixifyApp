import  'package:dio/dio.dart';
import 'package:medixify/shared/constans/constans.dart';
class DioHelper {

    static late   Dio dio;
   static void InitDio()
    {
        dio=Dio(BaseOptions(
            baseUrl: 'http://${ip}:8001/api/',
          connectTimeout: Duration(
            seconds: 1
          )


        ));
    }

    static Future<Response> postData({required String  path,
    Map<String,dynamic>?query,
        Map<String,dynamic>?data,
    String lang='en',
      String?token
    }) async
    {
        dio.options.headers=
        {
          'Authorization' :  'Bearer $token',
          'Content-Type':'application/json',
          'Accept':'application/json'
        };

 return await   dio.post(path,
  queryParameters: query,
  data: data);


    }
    static Future<Response> getData(
    {
        required String path,
        String? token,
      Map<String,dynamic>?data,
      Map<String,dynamic>?query


    }
        ) async
    {
      dio.options.headers={

        'Authorization' :  'Bearer $token',
        'Content-Type':'application/json',
        'Accept':'application/json'
      };
        return await dio.get(path,
          data: data,
          queryParameters: query,

        );
      }

    static Future<Response> deleteData({required String  path,
      Map<String,dynamic>?query,
      Map<String,dynamic>?data,
      String lang='en',

    }) async
    {
      dio.options.headers=
      {
        'Content-Type':'application/json',
        'Accept':'application/json'
      };

      return await   dio.delete(path,
          queryParameters: query,
          data: data);


    }

    }
