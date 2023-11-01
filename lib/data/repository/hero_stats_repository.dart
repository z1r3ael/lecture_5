import 'package:dio/dio.dart';
import 'package:lecture_5/data/model/hero_stats_dto.dart';

class HeroStatsRepository {
  static const host = 'https://api.opendota.com';

  final dio = Dio();

  Future<List<HeroStatsDTO>?> getHeroStats() async {
    final response = await dio.get('$host/api/heroStats');
    final data = response.data as List<dynamic>;

    final first = data.isNotEmpty ? data.first : null;

    if (first == null) {
      return null;
    }

    if (first is Map<String, dynamic>) {
      return (data.cast<Map<String, dynamic>>()).map((e) =>HeroStatsDTO.fromJson(e)).toList();
    }

    return null;
  }
}
