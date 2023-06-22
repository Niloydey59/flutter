class CatalogModels{
  static final item=[
    Item(
        1,
        "Iphone 12 pro",
        "Apple Iphone 12th generation",
        999,
        "#3350a",
        "https://adminapi.applegadgetsbd.com/storage/media/large/1527-30875.jpg"
    )
  ];
}

class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);
}
