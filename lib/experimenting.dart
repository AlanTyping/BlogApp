class Food {
  String name;
  int price;

  Food(this.name, this.price);
}

class Collection<T> {
  String name;
  List<T> data;

  Collection(this.name, this.data);

  T randomItem() {
    data.shuffle();

    return data[0];
  }
}

Food pizza = Food("Pizza", 20);
Food chicken = Food("Chicken", 110);
Food snak = Food("Snak", 50);

var comidas = Collection<Food>("Comidas", [pizza, chicken, snak]);

Food randomFood = comidas.randomItem();

void jaja() {
  print(randomFood.name);
}

// void funcion() {
//   print(randomFood);
// }
