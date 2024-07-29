
import 'package:dio/dio.dart';
import 'package:get_list/core/network/api_provider.dart';
import 'package:get_list/service_locator.dart';
class ApiProviderImp implements ApiProvider {

  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://moviesapi.ir/api/v1/',
      headers: {
        
  'Content-Type': 'application/json',
  'omax-apikey': '00000000-0000-0000-0000-000000000000',
      }
    )
  );

  ApiProviderImp(){
    dio.interceptors.add(LogInterceptor(responseBody: true, requestHeader: true));
  }

   @override
  Future<Response> post(String path,
      {Map<String, dynamic>? headerParametr,
      Map<String, dynamic>? queryParameter,
      bodyParameter}) async {
          final dio = await serviceLocator<Dio>();  
 if (headerParametr?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParametr!);
    }
    return await dio.post(
      path,
      data: bodyParameter,
      queryParameters: queryParameter,
    );
  }


  @override
  Future<Response> delete(String path,
      {Map<String, dynamic>? headerParameter,
      Map<String, dynamic>? queryParameter,
      bodyParameter}) async {
    if (headerParameter?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameter!);
    }
    return await dio.delete(path,
        data: bodyParameter, queryParameters: queryParameter);
  }

  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? headerParameter,
      Map<String, dynamic>? queryParameter}) async {
    if (headerParameter?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameter!);
    }
    return await dio.get(
      path,
      queryParameters: queryParameter,
    );
  }


  @override
  Future<Response> put(String path,
      {Map<String, dynamic>? headerParameter,
      Map<String, dynamic>? queryParameter,
      bodyParametr}) async {
    if (headerParameter?.isNotEmpty == true) {
      dio.options.headers.addAll(headerParameter!);
    }
    return await dio.post(path,
        data: bodyParametr, queryParameters: queryParameter);
  }
  
}