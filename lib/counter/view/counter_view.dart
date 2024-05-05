import 'package:bloc_counter/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.info_outline_rounded,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () => context.read<CounterCubit>().reset(),
                      icon: const Icon(
                        Icons.refresh_rounded,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                BlocBuilder<CounterCubit, int>(
                  builder: (context, state) {
                    return Text(
                      '$state',
                      style: const TextStyle(
                        fontSize: 150,
                        color: Color(0xff333233),
                      ),
                    );
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton.outlined(
                      onPressed: () => context.read<CounterCubit>().decrement(),
                      icon: const Icon(
                        Icons.remove,
                        size: 40,
                      ),
                    ),
                    IconButton.outlined(
                      onPressed: () => context.read<CounterCubit>().increment(),
                      icon: const Icon(
                        Icons.add,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45,
                )
              ],
            ),
          ),
        ),
        // floatingActionButton: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     FloatingActionButton(
        //       key: const Key('counterView_increment_floatingActionButton'),
        //       child: const Icon(Icons.add),
        //       onPressed: () => context.read<CounterCubit>().increment(),
        //     ),
        //     const SizedBox(
        //       height: 8,
        //     ),
        //     FloatingActionButton(
        //       key: const Key('counterView_decrement_floatingActionButton'),
        //       child: const Icon(Icons.remove),
        //       onPressed: () => context.read<CounterCubit>().decrement(),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
