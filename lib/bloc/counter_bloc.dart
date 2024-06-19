import 'package:bloccounterapp/bloc/counter_events.dart';
import 'package:bloccounterapp/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<AddCounterEvent>((event, emit) {
      int newCount = state.count + 1;
      emit(CounterState(count: newCount));
    });
  }
}
