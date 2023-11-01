import 'package:lecture_5/data/model/hero_stats_dto.dart';
import 'package:lecture_5/data/repository/hero_stats_repository.dart';

class HeroStatsModel {
  final int id;
  final String name;
  final String localizedName;
  final String primaryAttr;
  final String attackType;
  final List<String> roles;
  final String img;
  final String icon;
  final int baseHealth;
  final double baseHealthRegen;
  final int baseMana;
  final double baseManaRegen;
  final double baseArmor;

  HeroStatsModel({
    required this.id,
    required this.name,
    required this.localizedName,
    required this.primaryAttr,
    required this.attackType,
    required this.roles,
    required this.img,
    required this.icon,
    required this.baseHealth,
    required this.baseHealthRegen,
    required this.baseMana,
    required this.baseManaRegen,
    required this.baseArmor,
  });

  factory HeroStatsModel.fromDto(HeroStatsDTO dto) => HeroStatsModel(
        id: dto.id,
        name: dto.name,
        localizedName: dto.localizedName,
        primaryAttr: dto.primaryAttr,
        attackType: dto.attackType,
        roles: dto.roles,
        img: '${HeroStatsRepository.host}${dto.img}',
        icon: '${HeroStatsRepository.host}${dto.icon}',
        baseHealth: dto.baseHealth,
        baseHealthRegen: (dto.baseHealthRegen is int) ? (dto.baseHealthRegen as int).toDouble() : dto.baseHealthRegen,
        baseMana: dto.baseMana,
        baseManaRegen: (dto.baseManaRegen is int) ? (dto.baseManaRegen as int).toDouble() : dto.baseManaRegen,
        baseArmor: (dto.baseArmor is int) ? (dto.baseArmor as int).toDouble() : dto.baseArmor,
      );
}
