part of 'divisions_bloc.dart';

abstract class DivisionsState extends Equatable {
  const DivisionsState();

  @override
  List<Object> get props => [];
}

class DivisionsInitial extends DivisionsState {
  const DivisionsInitial();
}

class LoadingDivisionsState extends DivisionsState {
  const LoadingDivisionsState();
}

class SuccessGetDivisionsState extends DivisionsState {
  final List<DivisionsModel> listDivisionsModel;
  const SuccessGetDivisionsState(this.listDivisionsModel);
}

class ErrorGetDivisionsState extends DivisionsState {
  const ErrorGetDivisionsState();
}
