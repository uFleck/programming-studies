class Cat {
  final name;
  final temperament;
  final origin;
  final description;
  final lifeSpan;
  final affectionLevel;
  final adaptability;
  final childFriendly;
  final dogFriendly;
  final energyLevel;
  final grooming;
  final healthIssues;
  final intelligence;
  final sheddingLevel;
  final socialNeeds;
  final strangerFriendly;
  final vocalisation;

  String get getName => this.name;
  String get getTemperament => this.temperament;
  String get getOrigin => this.origin;
  String get getDescription => this.description;
  String get getLifeSpan => this.lifeSpan;
  int get getAffectionLevel => this.affectionLevel;
  int get getAdaptability => this.adaptability;
  int get getChildFriendly => this.childFriendly;
  int get getDogFriendly => this.dogFriendly;
  int get getEnergyLevel => this.energyLevel;
  int get getGrooming => this.grooming;
  int get getHealthIssues => this.healthIssues;
  int get getIntelligence => this.intelligence;
  int get getSheddingLevel => this.sheddingLevel;
  int get getSocialNeeds => this.socialNeeds;
  int get getStrangerFriendly => this.strangerFriendly;
  int get getVocalisation => this.vocalisation;
  
  
  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      name: json['name'],
      temperament: json['temperament'],
      origin: json['origin'],
      description: json['description'],
      lifeSpan: json['life_span'],
      affectionLevel: json['affection_level'],
      adaptability: json['adaptability'],
      childFriendly: json['child_friendly'],
      dogFriendly: json['dog_friendly'],
      energyLevel: json['energy_level'],
      grooming: json['grooming'],
      healthIssues: json['health_issues'],
      intelligence: json['intelligence'],
      sheddingLevel: json['shedding_level'],
      socialNeeds: json['social_needs'],
      strangerFriendly: json['stranger_friendly'],
      vocalisation: json['vocalisation']
    );
  }

  Cat({
    this.name,
    this.temperament,
    this.origin,
    this.description,
    this.lifeSpan,
    this.affectionLevel,
    this.adaptability,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
  });

  @override
  String toString() {
    return 'Cat(name: $name, temperament: $temperament, origin: $origin, description: $description, lifeSpan: $lifeSpan, affectionLevel: $affectionLevel, adaptability: $adaptability, childFriendly: $childFriendly, dogFriendly: $dogFriendly, energyLevel: $energyLevel, grooming: $grooming, healthIssues: $healthIssues, intelligence: $intelligence, sheddingLevel: $sheddingLevel, socialNeeds: $socialNeeds, strangerFriendly: $strangerFriendly, vocalisation: $vocalisation)';
  }
}
