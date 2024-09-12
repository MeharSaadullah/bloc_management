part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  bool isSwitch; // initilize variable
  double slider;
  SwitchState({this.isSwitch = false, this.slider = 1.0});

// copy with create the new instance of class " "
  SwitchState copyWith({bool? isSwitch, double? slider}) {
    return SwitchState(
        isSwitch: isSwitch ?? // if null then move to by default

            this.isSwitch, // by default which we add

        slider: slider ?? // if null then move to by default

            this.slider // by default which we add
        );
  }

  @override
  List<Object> get props => [isSwitch, slider];
}
