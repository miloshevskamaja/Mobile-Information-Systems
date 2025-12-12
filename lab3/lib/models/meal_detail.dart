class MealDetailModel {
  final int id;
  final String name;
  final String image;
  final String instructions;
  final String youtube;
  final List<String> ingredients;

  MealDetailModel({
    required this.id,
    required this.name,
    required this.image,
    required this.instructions,
    required this.youtube,
    required this.ingredients,
  });

  factory MealDetailModel.fromJson(Map<String, dynamic> data) {
    List<String> ingr = [];

    for (int i = 1; i <= 20; i++) {
      final ing = data['strIngredient$i'];
      if (ing != null &&
          ing
              .toString()
              .trim()
              .isNotEmpty &&
          ing.toString().trim() != "") {
        ingr.add(ing.toString());
      }
    }

    return MealDetailModel(
      id: int.parse(data['idMeal']),
      name: data['strMeal'] ?? "",
      image: data['strMealThumb'] ?? "",
      instructions: data['strInstructions'] ?? "",
      youtube: data['strYoutube'] ?? "",
      ingredients: ingr,
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "idMeal": id,
        "strMeal": name,
        "strMealThumb": image,
        "strInstructions": instructions,
        "strYoutube": youtube,
        "ingredients": ingredients,
      };
}