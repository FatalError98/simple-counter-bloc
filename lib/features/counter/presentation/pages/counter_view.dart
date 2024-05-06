import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/colors/colors.dart';
import '../counter.dart';
import '../functions/open_animated_dialog.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    IconButton(
                      onPressed: () => openAnimatedDialog(context),
                      icon: const Icon(
                        Icons.info_outline_rounded,
                        size: 32,
                        color: kPrimaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        size: 32,
                        color: kPrimaryColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          context.read<CounterBloc>().add(ResetEvent()),
                      icon: const Icon(
                        Icons.refresh_rounded,
                        size: 32,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                Gap(MediaQuery.of(context).size.width * 0.4),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text(
                      '${state.countValue}',
                      style: const TextStyle(
                        fontSize: 116,
                        color: Color(0xff333233),
                      ),
                    );
                  },
                ),
                Gap(MediaQuery.of(context).size.width * 0.3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state) {
                        return IconButton.outlined(
                          onPressed: () => state.countValue > 0
                              ? context
                                  .read<CounterBloc>()
                                  .add(DecrementEvent())
                              : null,
                          icon: const Icon(
                            Icons.remove,
                            size: 40,
                          ),
                        )
                            .animate(
                              target: state.countValue > 0 ? 1 : 0,
                            )
                            .fadeIn(
                                duration: const Duration(milliseconds: 200));
                      },
                    ),
                    IconButton.outlined(
                      onPressed: () =>
                          context.read<CounterBloc>().add(IncrementEvent()),
                      icon: const Icon(
                        Icons.add,
                        size: 40,
                      ),
                    ),
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
