class Recipes {
  final String ingredients;
  final String name;
  final String instructions;
  final String time;
  Recipes({
    required this.ingredients,
    required this.name,
    required this.instructions,
    required this.time,
  });

  Recipes copyWith({
    String? ingredients,
    String? name,
    String? instructions,
    String? time,
  }) {
    return Recipes(
      ingredients: ingredients ?? this.ingredients,
      name: name ?? this.name,
      instructions: instructions ?? this.instructions,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ingredients': ingredients,
      'name': name,
      'instructions': instructions,
      'time': time,
    };
  }

  factory Recipes.fromMap(Map<String, dynamic> map) {
    return Recipes(
      ingredients: map['ingredients'] as String,
      name: map['name'] as String,
      instructions: map['instructions'] as String,
      time: map['time'] as String,
    );
  }

  @override
  String toString() {
    return 'Recipes(ingredients: $ingredients, name: $name, instructions: $instructions, time: $time)';
  }

  @override
  bool operator ==(covariant Recipes other) {
    if (identical(this, other)) return true;

    return other.ingredients == ingredients &&
        other.name == name &&
        other.instructions == instructions &&
        other.time == time;
  }

  @override
  int get hashCode {
    return ingredients.hashCode ^
        name.hashCode ^
        instructions.hashCode ^
        time.hashCode;
  }
}
