import 'package:flutter/material.dart';
import 'package:navigation_example/controller/category_item.dart';
import 'package:navigation_example/controller/const.dart';
import 'package:navigation_example/controller/dummy_data.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments=ModalRoute.of(context)!.settings.arguments as Map;
    final id=arguments["id"];
    final title=arguments["title"];
    final color=arguments["color"];
    final categoryBooks=dummyNews.where((book){
      return book.categories.contains(id);
    } ).toList();
    
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        children: DUMMY_CATEGORIES.map((e) {
          return CategoryItem(
            id: e.id,
            title: e.title,
            color:  e.color,
          );
        }).toList(),
      ),
    );
  }
}
