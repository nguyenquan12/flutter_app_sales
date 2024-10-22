import 'package:app_sales/data/datasources/remote/api/food_api.dart';
import 'package:dio/dio.dart';

class FoodRepository {
  late FoodApi _apiRequest;

  FoodRepository(FoodApi api) {
    _apiRequest = api;
  }

  Future<Response> fetchListFoods() {
    return _apiRequest.fetchListFoods();
  }
}
