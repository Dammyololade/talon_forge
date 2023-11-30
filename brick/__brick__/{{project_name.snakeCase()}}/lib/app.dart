import 'package:{{project_name.snakeCase()}}/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/counter/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: const AppBuilder(),
    );
  }
}

class AppBuilder extends StatelessWidget {
  const AppBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.select((ThemeCubit cubit) => cubit.state.getThemeData()),
      home: const CounterPage(),
    );
  }
}
