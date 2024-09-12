part of 'switch_bloc.dart';

// create base class
abstract class SwitchEvent extends Equatable {
  const SwitchEvent(); // constrcter

  @override
  List<Object> get props => [];
}

//create events
class EnableOrDisbaleNotification extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  double slider;
  SliderEvent({required this.slider}); // here we are getting value from events

  @override
  List<Object> get props => [slider];
}
