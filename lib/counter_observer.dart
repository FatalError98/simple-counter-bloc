import 'package:bloc/bloc.dart';

class CounterObserver extends BlocObserver {
  const CounterObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} $change');
    if (change.nextState < 0) {
      print('Error');
    }
    super.onChange(bloc, change);
  }
}
