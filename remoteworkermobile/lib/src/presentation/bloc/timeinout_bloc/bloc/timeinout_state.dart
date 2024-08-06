part of 'timeinout_bloc.dart';

abstract class TimeinoutState extends Equatable {
  const TimeinoutState();

  @override
  List<Object> get props => [];
}

class TimeinoutInitial extends TimeinoutState {
  const TimeinoutInitial();
}

class LoadingTimeinoutState extends TimeinoutState {
  const LoadingTimeinoutState();
}

class SuccessTimeinoutState extends TimeinoutState {
  const SuccessTimeinoutState();
}

class ErrorTimeinoutState extends TimeinoutState {
  const ErrorTimeinoutState();
}
