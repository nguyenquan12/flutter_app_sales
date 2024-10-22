import 'package:app_sales/common/app_constant.dart';
import 'package:app_sales/data/datasources/local/share_pref.dart';
import 'package:app_sales/data/models/user_model.dart';
import 'package:app_sales/data/repositories/authentication_repository.dart';
import 'package:app_sales/presertation/features/sign_up/sign_up_event.dart';
import 'package:app_sales/presertation/features/sign_up/sign_up_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEventBase, SignUpStateBase> {
  late AuthenticationRepository _repository;

  SignUpBloc(AuthenticationRepository repository) : super(SignUpStateInit()) {
    _repository = repository;

    on<SignUpEvent>((event, emit) async {
      try {
        emit(SignUpLoading());
        Response response = await _repository.signUp(event.email,
            event.password, event.address, event.phone, event.name);
        if (response.statusCode == 200) {
          UserModel model = UserModel.fromJson(response.data["data"]);
          await SharePref.instance.set(AppConstant.token, model.token);
          emit(SignUpSuccess("Dang ky thanh cong"));
        }
      } on DioException catch (dioError) {
        emit(SignUpError(dioError.response!.data["message"]));
      } catch (e) {
        emit(SignUpError(e.toString()));
      }
    });
  }
}
