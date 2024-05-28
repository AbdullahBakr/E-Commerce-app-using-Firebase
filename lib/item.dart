class Item {
  final double? price;
  final String? imagePath;
  final String? productName;
 Item({required this.price,required this.imagePath, this.productName});
}


final List <Item> items=[
  Item(price: 13.99, imagePath: 'images/IMG_3066.JPG'),
  Item(price: 10.99, imagePath: 'images/lamp.jpeg'),
  Item(price: 13.99, imagePath: 'images/IMG_3066.JPG'),
  Item(price: 10.99, imagePath: 'images/lamp.jpeg'),
  Item(price: 13.99, imagePath: 'images/IMG_3066.JPG'),
  Item(price: 10.99, imagePath: 'images/lamp.jpeg'),
  Item(price: 13.99, imagePath: 'images/IMG_3066.JPG'),
  Item(price: 10.99, imagePath: 'images/lamp.jpeg'),
];