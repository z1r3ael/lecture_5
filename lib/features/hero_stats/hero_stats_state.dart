
import 'package:lecture_5/domain/model/hero_stats_model.dart';

sealed class HeroStatsState {}

final class HeroStatsInitial extends HeroStatsState {}

final class HeroStatsData extends HeroStatsState {
  final List<HeroStatsModel> heroStats;

  HeroStatsData({required this.heroStats});
}
