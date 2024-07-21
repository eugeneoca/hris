part of 'roles_bloc.dart';

abstract class RolesState extends Equatable {
  const RolesState();

  @override
  List<Object> get props => [];
}

class RolesInitial extends RolesState {
  const RolesInitial();
}

class LoadingRolesState extends RolesState {
  const LoadingRolesState();
}

class SuccessGetRolesState extends RolesState {
  final List<RolesModel> listRolesModel;
  const SuccessGetRolesState(this.listRolesModel);
}

class ErrorGetRolesState extends RolesState {
  const ErrorGetRolesState();
}
