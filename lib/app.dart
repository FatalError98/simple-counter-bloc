import 'package:flutter/material.dart';

import 'features/counter/presentation/counter.dart';

class CounterApp extends MaterialApp {
  CounterApp({super.key})
      : super(
          home: const CounterPage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xffF3F2F2),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff333233),
              primary: const Color(0xff333233),
              secondary: const Color(0xff333233),
            ),
          ),
        );
}
