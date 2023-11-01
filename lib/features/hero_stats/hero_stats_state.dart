import 'package:lecture_5/domain/model/hero_stats_model.dart';

sealed class HeroStatsState {}

final class HeroStatsBuildState extends HeroStatsState {}

final class HeroStatsListenState extends HeroStatsState {}

final class HeroStatsInitial extends HeroStatsBuildState {}

final class HeroStatsLoading extends HeroStatsBuildState {}

final class HeroStatsError extends HeroStatsListenState {
  final String error;

  HeroStatsError({required this.error});
}

final class HeroStatsData extends HeroStatsBuildState {
  final List<HeroStatsModel> heroStats;

  HeroStatsData({required this.heroStats});
}
