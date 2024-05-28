import 'package:flutter/cupertino.dart';
import 'item.dart';

class cart with ChangeNotifier{
List <Item> selectedProducts =[
];
double price=0 ;
delete(Item product){
  selectedProducts.remove(product);
  price-= product.price!;
  notifyListeners();
}
add(Item product){
  selectedProducts.add(product);
  price += product.price!;
  notifyListeners();

}
}
