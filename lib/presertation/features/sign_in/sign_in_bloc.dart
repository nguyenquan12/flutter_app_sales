import 'package:app_sales/common/app_constant.dart';
import 'package:app_sales/data/datasources/local/share_pref.dart';
import 'package:app_sales/data/models/user_model.dart';
import 'package:app_sales/data/repositories/authentication_repository.dart';
import 'package:app_sales/presertation/features/sign_in/sign_in_event.dart';
import 'package:app_sales/presertation/features/sign_in/sign_in_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEventBase, SignInStateBase> {
  late AuthenticationRepository _repository;

  SignInBloc(AuthenticationRepository repository) : super(SignInStateInit()) {
    _repository = repository;

    on<SignInEvent>((event, emit) async {
      try {
        emit(SignInLoading());
        Response response =
            await _repository.signIn(event.email, event.password);
        if (response.statusCode == 200) {
          UserModel model = UserModel.fromJson(response.data["data"]);
          await SharePref.instance.set(AppConstant.token, model.token);
          emit(SignInSuccess("Dang nhap thanh cong"));
        }
      } on DioException catch (dioError) {
        emit(SignInSuccess(dioError.response!.data["message"]));
      } catch (e) {
        emit(SignInSuccess(e.toString()));
      }
    });
  }
}
