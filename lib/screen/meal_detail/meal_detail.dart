import 'package:flutter/material.dart';
import '../../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final String id;
  final Function toggleFavoriteHandler;
  final Function isFavoriteHandler;

  const MealDetailScreen(
      this.id, this.toggleFavoriteHandler, this.isFavoriteHandler,
      {Key? key})
      : super(key: key);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget buildContainer(
      {required Widget child, double height = 150, double width = 300}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: height,
      width: width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = MealModel.fetchById(id);

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Image.network(meal.imageUrl, fit: BoxFit.cover),
        ),
        buildSectionTitle(context, 'Ingredients'),
        buildContainer(
            child: ListView.builder(
          itemCount: meal.ingredients.length,
          itemBuilder: (ctx, index) => Card(
              color: Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(meal.ingredients[index]),
              )),
        )),
        buildSectionTitle(context, 'Steps'),
        buildContainer(
            height: 300,
            child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Column(children: [
                      ListTile(
                          leading: CircleAvatar(child: Text('#${index + 1}')),
                          title: Text(meal.steps[index])),
                      const Divider()
                    ]))),
      ])),
      floatingActionButton: FloatingActionButton(
        child:
            Icon(isFavoriteHandler(meal.id) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavoriteHandler(meal.id),
      ),
    );
  }
}
