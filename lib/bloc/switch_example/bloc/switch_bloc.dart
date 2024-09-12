import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisbaleNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  //1st widget
  void _enableOrDisableNotification(
      EnableOrDisbaleNotification events, Emitter<SwitchState> emit) {
    emit(state.copyWith(
        isSwitch: !state
            .isSwitch)); //! this sign use to convert true into false and vice vers
  }

// 2nd widget

  void _slider(SliderEvent events, Emitter<SwitchState> emit) {
    emit(state.copyWith(
        slider: events
            .slider)); // here we add events.slider instead of state.slider bcz right now we are getting value from events not states
  }
}
