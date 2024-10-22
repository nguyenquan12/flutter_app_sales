import 'package:app_sales/data/models/food_model.dart';

class CartModel {
  int? total;
  List<FoodModel>? items;

  CartModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    items = (json['items'] as List).map((e) => FoodModel.fromJson(e)).toList();
  }
}
