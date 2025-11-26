import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryCard extends StatelessWidget{
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "/details", arguments: category);
      },
      child: Card(
        shape: BeveledRectangleBorder(
          side:BorderSide(color:Colors.teal, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child:Padding(padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(child: Image.network(category.image)),
            Text(category.name, style:TextStyle(fontSize: 20)),
            Text(
              category.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        ),
      )
    );
  }
}