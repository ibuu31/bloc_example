import 'package:bloc_example/presentation/second_screen.dart';
import 'package:bloc_example/presentation/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/counter_cubit.dart';
import '../logic/cubit/counter_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: const Icon(Icons.remove)),
                FloatingActionButton(
                    heroTag: 'b',
                    tooltip: 'decrease',
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.redAccent)),
                onPressed: () {
                  // wrapping with bloc provider was necessary because with that only, SecondScreen class will get access to the CounterCubit, basically we are trying to give an instance of CounterCubit to SecondScreen.
                  Navigator.of(context).push(MaterialPageRoute(
                    // context here is being replaced by underscore(_) because its of no use. Also, if you use context word, the context present in value will use this BuildContext instead of build tree BuildContext.
                    builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<CounterCubit>(context),
                        child: const SecondScreen()),
                  ));
                },
                child: const Text('Second Page')),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.greenAccent)),
                onPressed: () {
                  // wrapping with bloc provider was necessary because with that only, SecondScreen class will get access to the CounterCubit, basically we are trying to give an instance of CounterCubit to SecondScreen.
                  Navigator.of(context).push(MaterialPageRoute(
                    // context here is being replaced by underscore(_) because its of no use. Also, if you use context word, the context present in value will use this BuildContext instead of build tree BuildContext.
                    builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<CounterCubit>(context),
                        child: const ThirdScreen()),
                  ));
                },
                child: const Text('Thid Page')),
          ],
        )),
      ),
    );
  }
}
