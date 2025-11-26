class Category{
  int id;
  String name;
  String image;
  String description;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.description
});

  Category.fromJson(Map<String, dynamic> data)
        : id=data['idCategory'] is int ? data['idCategory'] : int.parse(data['idCategory'].toString()),
        name=data['strCategory'] ?? '' ,
        image = data['strCategoryThumb'] ?? '',
        description = data['strCategoryDescription'] ?? '';

  Map<String, dynamic> toJson() =>{
    'idCategory': id,
    'strCategory': name,
    'strCategoryThumb': image,
    'strCategoryDescription': description
  };

}