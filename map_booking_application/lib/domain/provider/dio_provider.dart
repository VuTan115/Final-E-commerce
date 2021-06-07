import 'package:dio/dio.dart' hide Response;
import 'package:dio/src/response.dart' as http;

import 'package:logging/logging.dart';

class DioProvider {
  static Dio instance() {
    final dio = Dio();

    // dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(HttpLogInterceptor());

    return dio;
  }
}

class HttpLogInterceptor extends InterceptorsWrapper {
  final Logger _logger = Logger('HttpLogInterceptor');
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(http.Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
  // @override
  // Future onRequest(RequestOptions options) async {
  //   _logger.info({
  //     'onRequest': options.uri,
  //     'data': options.data,
  //     'method': options.method,
  //     'headers': options.headers,
  //     'queryParameters': options.queryParameters,
  //   });
  //   return options;
  // }

  // @override
  // Future onResponse(Response response) {
  //   _logger.info({'onResponse': response});
  //   return super.onResponse(response);
  // }

  // @override
  // Future onError(DioError err) {
  //   _logger.info({
  //     'onError': err,
  //     'response': err.response,
  //   });
  //   return super.onError(err);
  // }

}
