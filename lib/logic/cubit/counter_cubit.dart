import 'package:bloc/bloc.dart';
import 'package:bloc_example/logic/cubit/counter_state.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  //initialize the state of CounterCubit instance.
  CounterCubit() : super(CounterState(counterValue: 0));
  void increment() => emit(CounterState(counterValue: state.counterValue + 1));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
}
