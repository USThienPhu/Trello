import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/app_config.dart';
import '../auth/token_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(milliseconds: AppConfig.connectTimeout),
      receiveTimeout: const Duration(milliseconds: AppConfig.receiveTimeout),
      headers: {'Content-Type': 'application/json'},
    ),
  );
  dio.interceptors.add(AuthInterceptor(ref));
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  return dio;
});

class AuthInterceptor extends Interceptor {
  final Ref ref;

  AuthInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final tokenStorage = ref.read(tokenStorageProvider);
    final token = await tokenStorage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}