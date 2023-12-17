import  'package:dio/dio.dart';
class DioHelper {

    static late   Dio dio;
   static void InitDio()
    {
        dio=Dio(BaseOptions(
            baseUrl: 'http://192.168.1.108:8001/api/',




        ));
    }

    static Future<Response> postData({required String  path,
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

 return await   dio.post(path,
  queryParameters: query,
  data: data);


    }
    static Future<Response> getData(
        String path,
        String token
        ) async
    {
      dio.options.headers={
        'Authorization' : 'Bearer $token',
        'Content-Type':'application/json',
        'Accept':'application/json'
      };
        return await dio.get(path,
        );
      }
    }
