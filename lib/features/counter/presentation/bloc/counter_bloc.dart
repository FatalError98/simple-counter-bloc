import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementEvent>(
      (event, emit) => emit(
        CounterUpdate(countValue: state.countValue + 1),
      ),
    );

    on<DecrementEvent>(
      (event, emit) => emit(
        CounterUpdate(countValue: state.countValue - 1),
      ),
    );

    on<ResetEvent>(
      (event, emit) => emit(
        CounterUpdate(countValue: state.countValue),
      ),
    );
  }
}
