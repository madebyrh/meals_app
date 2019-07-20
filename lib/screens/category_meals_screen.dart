import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    // didChangeDependensiesに移動
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;

    // // initStateは画面を作る前に動くので、contextが使えない
    // final categoryId = routeArgs['id'];
    // //final categoryTitle = routeArgs['title'];
    // categoryTitle = routeArgs['title'];

    // // final categoryMeals = DUMMY_MEALS.where((meal) {
    // //   return meal.categories.contains(categoryId);
    // // }).toList();
    // displayedMeals = DUMMY_MEALS.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      // initStateは画面を作る前に動くので、contextが使えない
      final categoryId = routeArgs['id'];
      //final categoryTitle = routeArgs['title'];
      categoryTitle = routeArgs['title'];

      // final categoryMeals = DUMMY_MEALS.where((meal) {
      //   return meal.categories.contains(categoryId);
      // }).toList();
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // pushNamedのargumentsの値を利用する
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final categoryId = routeArgs['id'];
    // final categoryTitle = routeArgs['title'];
    // final categoryMeals = DUMMY_MEALS.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          //return Text(categoryMeals[index].title);
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
