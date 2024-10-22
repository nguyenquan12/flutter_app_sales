import 'package:app_sales/data/models/order_model.dart';
import 'package:app_sales/data/repositories/order_repository.dart';
import 'package:app_sales/presertation/features/home/home_event.dart';
import 'package:app_sales/presertation/features/home/home_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeOrderBloc extends Bloc<HomeEventBase, HomeStateBase> {
  late OrderRepository _cartRepository;

  HomeOrderBloc(OrderRepository cartRepository) : super(HomeStateInit()) {
    _cartRepository = cartRepository;

    on<FetchTotalCart>((event, emit) async {
      try {
        emit(HomeStateLoading());
        Response response = await _cartRepository.fetchTotalCart();
        if (response.statusCode == 200) {
          OrderModel cartModel = OrderModel.fromJson(response.data['data']);
          emit(FetchTotalSuccess(cartModel: cartModel));
        }
      } on DioException catch (dioError) {
        if (dioError.response != null) {
          if (dioError.response!.statusCode == 401) {
            emit(FetchTotalError(dioError.response!.data["message"], 401));
          } else if (dioError.response!.statusCode == 404) {
            emit(FetchTotalError("", 404));
          } else {
            emit(FetchTotalError(dioError.response!.data["message"],
                dioError.response!.statusCode!));
          }
        }
      } catch (e) {
        emit(FetchTotalError(e.toString(), 0));
      }
    });

    on<AddToCart>((event, emit) async {
      try {
        emit(HomeStateLoading());
        Response response = await _cartRepository.addToCart(event.foodId);
        if (response.statusCode == 200) {
          OrderModel cartModel = OrderModel.fromJson(response.data['data']);
          emit(FetchTotalSuccess(cartModel: cartModel));
        }
      } on DioException catch (dioError) {
        if (dioError.response != null) {
          if (dioError.response!.statusCode == 401) {
            emit(FetchTotalError(dioError.response!.data["message"], 401));
          } else if (dioError.response!.statusCode == 404) {
            emit(FetchTotalError("", 404));
          } else {
            emit(FetchTotalError(dioError.response!.data["message"],
                dioError.response!.statusCode!));
          }
        }
      } catch (e) {
        emit(FetchTotalError(e.toString(), 0));
      }
    });
  }
}
