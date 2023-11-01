import 'package:lecture_5/domain/model/hero_stats_model.dart';

abstract class HeroStatsState {}

abstract class HeroStatsBuildState extends HeroStatsState {}

abstract class HeroStatsListenState extends HeroStatsState {}

class HeroStatsInitial extends HeroStatsBuildState {}

class HeroStatsLoading extends HeroStatsBuildState {}

class HeroStatsError extends HeroStatsListenState {
  final String error;

  HeroStatsError({required this.error});
}

class HeroStatsData extends HeroStatsBuildState {
  final List<HeroStatsModel> heroStats;

  HeroStatsData({required this.heroStats});
}
