import 'package:bloc_example/cubit/counter_cubit.dart';
import 'package:bloc_example/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterCubit(), child: HomePage());
  }
}

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
            BlocBuilder<CounterCubit, CounterState>(
              builder: (BuildContext context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: TextStyle(fontSize: 30),
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
                    tooltip: 'increase',
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    }),
                FloatingActionButton(
                    tooltip: 'decrease',
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    }),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
