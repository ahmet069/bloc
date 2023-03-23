import "package:flutter_bloc/flutter_bloc.dart";

import 'package:lrn1/src/presentation/bloc/counter_event.dart';
import 'package:lrn1/src/presentation/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(InitialState()) {
    on<NumberIncrease>(onNumberIncrease);
    on<NumberDecrease>(onNumberDecrease);
  }

  void onNumberIncrease(
      NumberIncrease event, Emitter<CounterState> emit) async {
    counter = counter + 1;
    emit(
      UpdateState(counter),
    ); // counter_state dosyasında gelir ve state'i günceller
  }

  void onNumberDecrease(
      NumberDecrease event, Emitter<CounterState> emit) async {
    counter = counter - 1;
    emit(
      UpdateState(counter),
    ); // counter_state dosyasında gelir ve state'i günceller
  }
}
