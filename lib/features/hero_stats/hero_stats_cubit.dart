import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture_5/domain/service/hero_stats_service.dart';
import 'package:lecture_5/features/hero_stats/hero_stats_state.dart';

class HeroStatsCubit extends Cubit<HeroStatsState> {
  HeroStatsCubit() : super(HeroStatsInitial());

  final _service = HeroStatsService();

  Future<void> getData() async {
    try {
      emit(HeroStatsLoading());
      final heroStats = await _service.getHeroStats();
      emit(
        HeroStatsData(heroStats: heroStats),
      );
    } catch (e) {
      emit(
        HeroStatsError(error: e.toString()),
      );
    }
  }
}
