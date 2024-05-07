import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../counter.dart';
import '../functions/open_animated_dialog.dart';
import '../widgets/outline_icon_button.dart';
import '../widgets/top_option_button.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TopOptionButton(
                      function: () => openAnimatedDialog(context),
                      icon: Icons.info_outline_rounded,
                    ),
                    TopOptionButton(
                      function: () {},
                      icon: Icons.settings,
                    ),
                    TopOptionButton(
                      function: () =>
                          context.read<CounterBloc>().add(ResetEvent()),
                      icon: Icons.refresh_rounded,
                    ),
                  ],
                ),
                Gap(MediaQuery.of(context).size.width * 0.4),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    _controller.forward();
                    return Text(
                      '${state.countValue}',
                      style: const TextStyle(
                        fontSize: 116,
                        color: Color(0xff333233),
                      ),
                    )
                        .animate(
                            controller: _controller,
                            onComplete: (_) => _controller.reverse())
                        .scaleXY(
                            end: 1.1,
                            duration: const Duration(milliseconds: 150));
                  },
                ),
                Gap(MediaQuery.of(context).size.width * 0.3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state) => OutlineIconButton(
                        function: () => state.countValue > 0
                            ? context.read<CounterBloc>().add(DecrementEvent())
                            : null,
                        icon: Icons.remove,
                      )
                          .animate(
                            target: state.countValue > 0 ? 1 : 0,
                          )
                          .fadeIn(
                            duration: const Duration(milliseconds: 200),
                          ),
                    ),
                    OutlineIconButton(
                      function: () =>
                          context.read<CounterBloc>().add(IncrementEvent()),
                      icon: Icons.add,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
