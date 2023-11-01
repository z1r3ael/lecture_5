import 'package:lecture_5/data/repository/hero_stats_repository.dart';
import 'package:lecture_5/domain/model/hero_stats_model.dart';

class HeroStatsService {
  final _repository = HeroStatsRepository();

  Future<List<HeroStatsModel>> getHeroStats() async {
    final list = await _repository.getHeroStats();
    if (list == null) return [];
    return list.map((e) => HeroStatsModel.fromDto(e)).toList();
  }
}
