import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'counter_observer.dart';
import 'app.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(CounterApp());
}
