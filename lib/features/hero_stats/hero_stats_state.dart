
import 'package:lecture_5/domain/model/hero_stats_model.dart';

sealed class HeroStatsState {
  const HeroStatsState();

  const factory HeroStatsState.initial() = HeroStatsInitial;

  const factory HeroStatsState.processing({required List<HeroStatsModel> heroStats}) = HeroStatsData;
}

final class HeroStatsInitial extends HeroStatsState {
  const HeroStatsInitial();
}

final class HeroStatsData extends HeroStatsState {
  final List<HeroStatsModel> heroStats;

  const HeroStatsData({required this.heroStats});
}
