import 'package:flutter/material.dart';

import 'core/theme/colors/colors.dart';
import 'features/counter/presentation/counter.dart';

class CounterApp extends MaterialApp {
  CounterApp({super.key})
      : super(
          home: const CounterPage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: kScaffoldBackGroundColor,
          ),
        );
}
