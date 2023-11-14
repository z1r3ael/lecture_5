import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:lecture_5/data/observer/my_bloc_observer.dart';
import 'package:lecture_5/features/hero_stats/hero_stats_screen.dart';

void main() => runZonedGuarded(
      () {
        runApp(const MyApp());
        Bloc.observer = MyBlocObserver();
        Bloc.transformer = sequential();
      },
      (error, stack) {
        print(error.toString());
      },
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeroStats',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HeroStats(),
    );
  }
}
