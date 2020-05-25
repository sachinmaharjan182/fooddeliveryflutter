
import 'package:flutter_challenge/models/food_item.dart';

List<FoodItem> getpopularFood() {
  List<FoodItem> popularItems = List();
  popularItems.add(FoodItem(
    foodImage: 'images/breast.jpeg',
    foodName: "Chicken Breast",
    location: "Maratine Star Restaurant",
    foodRating: 3.0,
    foodPrice: 60
  ));

  popularItems.add(FoodItem(
      foodImage: 'images/wings.jpg',
      foodName: "Lamb Ribs",
      location: "Rio Cafe",
      foodRating: 4.0,
      foodPrice: 90
  ));

  return popularItems;
}

List<FoodItem> getTopFood() {
  List<FoodItem> popularItems = List();
  popularItems.add(FoodItem(
      foodImage: 'images/pizza.jpg',
      foodName: "Pizza",
      location: "Maratine Star Restaurant",
      foodRating: 3.0,
      foodPrice: 60
  ));

  popularItems.add(FoodItem(
      foodImage: 'images/nuggets.jpeg',
      foodName: "Nuggets",
      location: "Maratine Star Restaurant",
      foodRating: 3.0,
      foodPrice: 60
  ));

  popularItems.add(FoodItem(
      foodImage: 'images/salad.jpeg',
      foodName: "Salad",
      location: "Maratine Star Restaurant",
      foodRating: 3.0,
      foodPrice: 60
  ));
  return popularItems;
}