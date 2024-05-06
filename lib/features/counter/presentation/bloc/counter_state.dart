part of 'counter_bloc.dart';

sealed class CounterState {
  final int countValue;

  const CounterState({required this.countValue});
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(countValue: 0);
}

final class CounterUpdate extends CounterState {
  const CounterUpdate({required super.countValue});
}
