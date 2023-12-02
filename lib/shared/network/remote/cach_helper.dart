import  'package:dio/dio.dart';
class CachHelper {

    late Dio dio;
    void InitDio()
    {
        dio=Dio(BaseOptions(
            baseUrl: 'adafa',
        ));
    }
}