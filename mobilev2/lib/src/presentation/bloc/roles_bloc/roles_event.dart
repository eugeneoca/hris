part of 'roles_bloc.dart';

abstract class RolesEvent extends Equatable {
  const RolesEvent();

  @override
  List<Object> get props => [];
}

class GetRolesEvent extends RolesEvent {
  const GetRolesEvent();
}
