import 'package:dio/dio.dart';
import 'package:hackathon_app/core/utils/secret.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  Dio _dio = Dio();

  BaseOptions _options = BaseOptions(
    baseUrl: Secret.baseUrl,
  );

  Dio init() {
    _dio.options = _options;
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: false,
    ));

    return _dio;
  }

  ApiClient._internal();
}
