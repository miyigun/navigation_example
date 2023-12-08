import 'package:flutter/material.dart';
import 'package:navigation_example/controller/category_item.dart';
import 'package:navigation_example/controller/dummy_data.dart';
import 'package:navigation_example/view/category_news_screen.dart';
import 'package:navigation_example/view/news_detail_screen.dart';
import 'package:navigation_example/view/tabs_view.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => const TabsView(),
        CategoryNewsScreen.routeName: (ctx) => const CategoryNewsScreen(),
        NewsDetailScreen.routeName: (ctx) => const NewsDetailScreen(),
      },

      /// onGenerateRoute works as a fallback if any navigation fails
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },

      /// if onGenerateRoute isn't dfined as a fallback onUnknownRoute
      /// takes its place and works fine if any navigation fails

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(),
        );
      },
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),

        /// the first page displays CategoryItem controller
        children: dummyCategories
            .map(
              (catData) => CategoryItem(
            id: catData.id,
            title: catData.title,
            color: catData.color,
          ),
        )
            .toList(),
      ),
    );
  }
}