class Meal{
  int id;
  String name;
  String image;

  Meal({required this.id, required this.name, required this.image});

  Meal.fromJson(Map<String, dynamic> data)
      : id = data['idMeal'] is int
      ? data['idMeal']
      : int.parse(data['idMeal'].toString()),
        name = data['strMeal'] ?? '',
        image = data['strMealThumb'] ?? '';

  Map<String, dynamic> toJson() => {
    'idMeal': id,
    'strMeal': name,
    'strMealThumb': image,
  };
}