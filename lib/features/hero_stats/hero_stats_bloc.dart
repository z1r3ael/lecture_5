import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture_5/domain/service/hero_stats_service.dart';
import 'package:lecture_5/features/hero_stats/hero_stats_event.dart';
import 'package:lecture_5/features/hero_stats/hero_stats_state.dart';

class HeroStatsBloc extends Bloc<HeroStatsEvent, HeroStatsState> {
  final _service = HeroStatsService();

  HeroStatsBloc() : super(const HeroStatsState.initial()) {
    on<GetDataEvent>(_getData);
  }

  Future<void> _getData(GetDataEvent event, Emitter<HeroStatsState> emit) async {
    final heroStats = await _service.getHeroStats();
    emit(
      HeroStatsState.processing(heroStats: heroStats),
    );
  }
}
