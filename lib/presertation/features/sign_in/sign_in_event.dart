import 'package:equatable/equatable.dart';

abstract class SignInEventBase extends Equatable {}

// ignore: must_be_immutable
class SignInEvent extends SignInEventBase {
  late String email;
  late String password;

  SignInEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
