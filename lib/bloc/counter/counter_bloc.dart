import 'package:bloc/bloc.dart';
import 'package:bloc_management/bloc/counter/counter_event.dart';
import 'package:bloc_management/bloc/counter/counter_state.dart';

// simply cratecounterbloc class and exten with bloc
class CounterBloc extends Bloc<CounterEvent,
    CounterState> // here we pass counter event and counter state which we created

{
  // here we pass counterstate in super , states are added in it like counter or other if we create , we can also change the value or also use by default
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
    // on<SwitchEvent>(_changeSwitchButton);
  }
// here we add incrementcounter from counterevent
  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    // emit work like set state
    //state.copywith come from counter state
    // then we add "counter " and add counter value
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));

    void _changeSwitchButton(SwitchEvent event, Emitter<CounterState> emit) {
      emit(
        state.copyWith(isSwitchOn: !state.isSwitchOn),
      );
    }
  }
}
