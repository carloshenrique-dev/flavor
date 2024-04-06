class Recipes {
  final String name;
  final String modeOfPreparation;
  final Map<String, String> ingredients;
  final String preparationTime;
  final String levelOfDifficulty;

  Recipes({
    required this.name,
    required this.modeOfPreparation,
    required this.ingredients,
    required this.preparationTime,
    required this.levelOfDifficulty,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) {
    return Recipes(
      name: json['name'],
      modeOfPreparation: json['modeOfPreparation'],
      ingredients: Map<String, String>.from(json['ingredients']),
      preparationTime: json['preparationTime'],
      levelOfDifficulty: json['levelOfDifficulty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'modeOfPreparation': modeOfPreparation,
      'ingredients': ingredients,
      'preparationTime': preparationTime,
      'levelOfDifficulty': levelOfDifficulty,
    };
  }

  factory Recipes.fromMap(Map<String, dynamic> map) {
    return Recipes(
      name: map['name'],
      modeOfPreparation: map['modeOfPreparation'],
      ingredients: Map<String, String>.from(map['ingredients']),
      preparationTime: map['preparationTime'],
      levelOfDifficulty: map['levelOfDifficulty'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'modeOfPreparation': modeOfPreparation,
      'ingredients': ingredients,
      'preparationTime': preparationTime,
      'levelOfDifficulty': levelOfDifficulty,
    };
  }

  Recipes copyWith({
    String? name,
    String? modeOfPreparation,
    Map<String, String>? ingredients,
    String? preparationTime,
    String? levelOfDifficulty,
  }) {
    return Recipes(
      name: name ?? this.name,
      modeOfPreparation: modeOfPreparation ?? this.modeOfPreparation,
      ingredients: ingredients ?? this.ingredients,
      preparationTime: preparationTime ?? this.preparationTime,
      levelOfDifficulty: levelOfDifficulty ?? this.levelOfDifficulty,
    );
  }
}
