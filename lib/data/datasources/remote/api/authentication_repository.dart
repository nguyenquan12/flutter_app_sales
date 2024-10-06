import 'package:app_sales/data/datasources/remote/api/authentication_api.dart';
import 'package:dio/dio.dart';

class AuthenticationRepository {
  late AuthenticationRepository _apiRequest;

  AuthenticationRepository(AuthenticationApi api) {
    _apiRequest = api as AuthenticationRepository;
  }

  Future<Response> signIn(String email, password) {
    return _apiRequest.signRequestApi(email, password);
  }
}
