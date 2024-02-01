import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc.dart';

class IncLogic extends StatelessWidget {
  const IncLogic({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Increment by another screen"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                counterBloc.add(CounterIncrementedEvent());
                // counterCubit.increment();
              },
              child: const Text("Increment"),
            ),
            ElevatedButton(
              onPressed: () {
                counterBloc.add(CounterDecrementEvent());
              },
              child: const Text("Decrement"),
            ),
          ],
        ),
      ),
    );
  }
}
