import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:teachme/data/models/unversal_data.dart';
import 'package:teachme/data/news_model.dart';
import 'package:teachme/utils/constants.dart';

class ApiService {
  final _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {"Content-Type": "application/json"},
      connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
      receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
      sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
    ),
  );

  ApiService() {
    init();
  }

  init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          debugPrint('On Error: ${error.message}');

          return handler.next(error);
        },
        onRequest: (requestOptions, handler) async {
          debugPrint('On Request: ${requestOptions.data}');
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) async {
          debugPrint('On Response: ${response.statusCode}');
          debugPrint('PATH: ${response.requestOptions.path}');
          return handler.next(response);
        },
      ),
    );
  }

  Future<UniversalData> getAllArticles() async {
    Response response;
    try {
      response = await _dio.get(
          "/top-headlines?sources=techcrunch&apiKey=fcfbd7f01f22482ba467c47dd84a3a85");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print("object  Articles");
        return UniversalData(
          data: NewsModel.fromJson(response.data)
        );
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }

  Future<UniversalData> getArticleById(int id) async {
    Response response;
    try {
      response = await _dio.get("/api/article/get/$id");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return UniversalData(
            data: NewsModel.fromJson(response.data['data']));
      }
      return UniversalData(error: 'ERROR');
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data['message']);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (e) {
      debugPrint("Caught: $e");
      return UniversalData(error: e.toString());
    }
  }
}
