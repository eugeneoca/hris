part of 'divisions_bloc.dart';

abstract class DivisionsEvent extends Equatable {
  const DivisionsEvent();

  @override
  List<Object> get props => [];
}

class GetDivisionsEvent extends DivisionsEvent {
  const GetDivisionsEvent();
}

class CreateDivisionsEvent extends DivisionsEvent {
  final String divisionName;
  const CreateDivisionsEvent(this.divisionName);
}
