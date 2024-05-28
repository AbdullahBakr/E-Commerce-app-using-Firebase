import 'package:e_commerce2/cart.dart';
import 'package:e_commerce2/item.dart';
import 'package:flutter/material.dart';
import 'Widgets/color.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

 class myAppBar extends StatelessWidget implements PreferredSizeWidget
 {

   final String text;
   final bool centerTitle;
   Size get preferredSize => const Size.fromHeight(60);
   const myAppBar({super.key, required this.text, this.centerTitle = false});

   @override
   Widget build(BuildContext context) {
     return PreferredSize(
       preferredSize: Size.fromHeight(55),
       child: AppBar(
         backgroundColor: appBarColor,
         title: Text(text),
         centerTitle: centerTitle,
         actions: [
           Consumer<cart>(builder: (context,cartInstance,child){
             return Row(
               // mainAxisAlignment: MainAxisAlignment.,
               children: [
                 badges.Badge(
                   position:badges.BadgePosition.topEnd(end:1),
                   badgeContent: Text('${cartInstance.selectedProducts.length}'),
                   child:  IconButton(
                       onPressed: () {
                         Navigator.pushNamed(context, '/checkout');
                       },
                       icon: Icon(Icons.add_shopping_cart_outlined, size: 30,)),
                 )
                 ,
                 Text('\$ ${cartInstance.price.toStringAsFixed(2)}',
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

               ],
             );
           })


         ],
       ),
     );
   }

 }