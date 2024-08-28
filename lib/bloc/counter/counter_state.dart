import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter; // initilize variable
  final bool isSwitchOn;
// constructer
  const CounterState({this.counter = 0, this.isSwitchOn = false});

// copywith function comes from Equitable
  CounterState copyWith({int? counter, bool? isSwitchOn}) {
    return CounterState(
      counter:
          counter ?? // value inside () if it is null then move to by default
              this.counter, // buy default value
      isSwitchOn: isSwitchOn ?? this.isSwitchOn,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter, isSwitchOn];
}
