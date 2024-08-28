import 'package:equatable/equatable.dart';

// here we creae abstract class which is base class
// we can use funcanlity of base class in sub class
abstract class CounterEvent extends Equatable {
  const CounterEvent(); // constructer

  List<Object> get props => [];
}

// here we create sub class "increament counter" which extend baseclass "counter event"
class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

class SwitchEvent extends CounterEvent {}
