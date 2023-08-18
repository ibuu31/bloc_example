import 'package:bloc_example/logic/cubit/counter_cubit.dart';
import 'package:bloc_example/presentation/home_screen.dart';
import 'package:bloc_example/presentation/second_screen.dart';
import 'package:bloc_example/presentation/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final counterCubit = CounterCubit();
  @override
  void dispose() {
    counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // two things are there before using bloc provider, one is that in create youll create an instance of the cubit or bloc in which you have described the logic, and in child you are accessing the class which have bloc builder.
    return MaterialApp(
      routes: {
        '/': (context) =>
            BlocProvider.value(value: counterCubit, child: const HomePage()),
        '/secondPage': (context) => BlocProvider.value(
            value: counterCubit, child: const SecondScreen()),
        'thirdPage': (context) =>
            BlocProvider.value(value: counterCubit, child: const ThirdScreen()),
      },
    );
  }
}
