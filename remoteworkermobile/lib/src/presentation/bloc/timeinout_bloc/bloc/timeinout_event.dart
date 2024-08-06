part of 'timeinout_bloc.dart';

abstract class TimeinoutEvent extends Equatable {
  const TimeinoutEvent();

  @override
  List<Object> get props => [];
}

class InitializeTimeinoutEvent extends TimeinoutEvent {
  const InitializeTimeinoutEvent();
}

class ProdTimeinoutEvent extends TimeinoutEvent {
  final String type;
  final String geolocation;
  final XFile image;
  const ProdTimeinoutEvent(this.type, this.geolocation, this.image);
}
