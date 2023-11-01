class HeroStatsDTO {
  final int id;
  final String name;
  final String localizedName;
  final String primaryAttr;
  final String attackType;
  final List<String> roles;
  final String img;
  final String icon;
  final int baseHealth;
  final dynamic baseHealthRegen;
  final int baseMana;
  final dynamic baseManaRegen;
  final dynamic baseArmor;

  HeroStatsDTO({
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

  factory HeroStatsDTO.fromJson(Map<String, dynamic> json) => HeroStatsDTO(
        id: json['id'] as int,
        name: json['name'] as String,
        localizedName: json['localized_name'] as String,
        primaryAttr: json['primary_attr'] as String,
        attackType: json['attack_type'] as String,
        roles: (json['roles'] is List) ? (json['roles'] as List).map((e) => e as String).toList() : [],
        img: json['img'] as String,
        icon: json['icon'] as String,
        baseHealth: json['base_health'] as int,
        baseHealthRegen: json['base_health_regen'],
        baseMana: json['base_mana'] as int,
        baseManaRegen: json['base_mana_regen'],
        baseArmor: json['base_armor'],
      );
}
