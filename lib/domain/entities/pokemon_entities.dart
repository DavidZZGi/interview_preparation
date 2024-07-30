class PokemonEntity {
  final int id;
  final String name;
  final int baseExperience;
  final double height;
  final double weight;
  final List<String> abilities;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.abilities,
  });

  factory PokemonEntity.fromJson(Map<String, dynamic> json) {
    return PokemonEntity(
      id: json['id'],
      name: json['name'],
      baseExperience: json['base_experience'],
      height: json['height'].toDouble(),
      weight: json['weight'].toDouble(),
      abilities: (json['abilities'] as List)
          .map((a) => a['ability']['name'])
          .toList() as List<String>,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'base_experience': baseExperience,
      'height': height,
      'weight': weight,
      'abilities': abilities,
    };
  }
}
