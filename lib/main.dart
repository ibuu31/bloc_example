import 'package:bloc_example/generatedRoutes.dart';
import 'package:bloc_example/logic/cubit/counter_cubit.dart';
import 'package:bloc_example/presentation/home_screen.dart';
import 'package:bloc_example/presentation/second_screen.dart';
import 'package:bloc_example/presentation/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final counterCubit = CounterCubit();

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // two things are there before using bloc provider, one is that in create you'll create an instance of the cubit or bloc in which you have described the logic, and in child you are accessing the class which have bloc builder.
    return BlocProvider(
      child: MaterialApp(
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
