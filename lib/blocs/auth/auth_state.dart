import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{

  @override
  List<Object> get props => [];
}

class LoginInitial extends AuthState{}

class LoginLoading extends AuthState{}

class LoginSuccess extends AuthState{

  @override
  List<Object> get props => [];
}

class LoginFailed extends AuthState{
  final String message;

  LoginFailed({required this.message});

  @override
  List<Object> get props => [message];
}