// ignore_for_file: must_be_immutable

import 'package:app_sales/data/datasources/remote/resource_type.dart';
import 'package:app_sales/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class SignInStateBase extends Equatable {}

class SignInStateInit extends SignInStateBase {
  @override
  List<Object?> get props => [];
}

class SignInResult extends SignInStateBase {
  late ResourceType<UserModel> result;

  SignInResult(ResourceType<UserModel> result) {
    this.result = result;
  }
  @override
  List<Object?> get props => [];
}
