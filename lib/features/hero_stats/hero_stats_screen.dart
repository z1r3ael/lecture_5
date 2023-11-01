import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture_5/domain/model/hero_stats_model.dart';
import 'package:lecture_5/features/hero_stats/hero_stats_bloc.dart';
import 'package:lecture_5/features/hero_stats/hero_stats_event.dart';
import 'package:lecture_5/features/hero_stats/hero_stats_state.dart';

class HeroStats extends StatefulWidget {
  const HeroStats({super.key});

  @override
  State<HeroStats> createState() => _HeroStatsState();
}

class _HeroStatsState extends State<HeroStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('HeroStats'),
      ),
      body: BlocProvider(
        create: (context) => HeroStatsBloc(),
        child: BlocBuilder<HeroStatsBloc, HeroStatsState>(
          builder: (context, state) {
            if (state is HeroStatsData) {
              return HeroStatsWidget(
                heroes: state.heroStats,
              );
            }
            return const HeroStatInitWidget();
          },
        ),
      ),
    );
  }
}

class HeroStatInitWidget extends StatelessWidget {
  const HeroStatInitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Справочник героев',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<HeroStatsBloc>().add(GetDataEvent());
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text(
              'Загрузить информацию',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeroStatsWidget extends StatelessWidget {
  final List<HeroStatsModel> heroes;

  const HeroStatsWidget({super.key, required this.heroes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.5,
        ),
        itemCount: heroes.length,
        itemBuilder: (context, index) {
          return SingleHeroWidget(
            hero: heroes[index],
          );
        },
      ),
    );
  }
}

class SingleHeroWidget extends StatelessWidget {
  final HeroStatsModel hero;

  const SingleHeroWidget({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(hero.localizedName),
                  Image.network(hero.icon),
                ],
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    hero.img,
                    height: 80,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Primary attr: ${hero.primaryAttr}',
                textAlign: TextAlign.start,
              ),
              Text('Attack type: ${hero.attackType}'),
              Text('Roles: ${hero.roles.toString()}'),
              Text('Base health: ${hero.baseHealth}'),
              Text('Base health regen: ${hero.baseHealthRegen}'),
              Text('Base mana: ${hero.baseMana}'),
              Text('Base mana regen: ${hero.baseManaRegen}'),
              Text('Base armor: ${hero.baseArmor}'),
            ],
          ),
        ),
      ),
    );
  }
}
