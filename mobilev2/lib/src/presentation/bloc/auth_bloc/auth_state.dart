part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class LoadingAuthState extends AuthState {
  const LoadingAuthState();
}

class AuthenticatedState extends AuthState {
  const AuthenticatedState();
}

class UnauthenticatedState extends AuthState {
  const UnauthenticatedState();
}
