import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lecture_5/features/hero_stats/hero_stats_screen.dart';

void main() => runZonedGuarded(
      () => runApp(
        const MyApp(),
      ),
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
