import 'package:flutter/material.dart';
import 'package:meal_app/routes.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final String complexityText;
  final String affordabilityText;
  final Function removeItem;

  const MealItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.complexityText,
      required this.duration,
      required this.affordabilityText,
      required this.removeItem,
      Key? key})
      : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, mealDetailRoute, arguments: {'id': id})
        .then((value) {
      if (value != null) {
        removeItem(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 350,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText)
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
