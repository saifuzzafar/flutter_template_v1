import 'package:dio/dio.dart';

class ApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers.putIfAbsent('Content-Type', () => "application/json");
    options.headers.putIfAbsent(
        'Authorization',
        () =>
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMDUwZjExOTRmYmVkZTE4NGY4ZGMxYjk4ZmQxNDE2MCIsInN1YiI6IjVlNGZiOTcyYTc2YWM1MDAxNjlmY2FlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VbvoOcY3K_ijrs7O8C8tg9-q1_7s5ynuRt2416ZibaI");
    options.headers.putIfAbsent('accept', () => "application/json");

    super.onRequest(options, handler);
  }
}
