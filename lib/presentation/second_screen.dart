import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/counter_cubit.dart';
import '../logic/cubit/counter_state.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  CounterCubit counterCubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Number of times Counter Added',
              style: TextStyle(fontSize: 20),
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (BuildContext context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    heroTag: 'a',
                    tooltip: 'increase',
                    backgroundColor: Colors.redAccent,
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: const Icon(Icons.remove)),
                FloatingActionButton(
                    heroTag: 'b',
                    tooltip: 'decrease',
                    backgroundColor: Colors.redAccent,
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
