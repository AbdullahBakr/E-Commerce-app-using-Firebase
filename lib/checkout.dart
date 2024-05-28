import 'package:e_commerce2/appbar.dart';
import 'package:e_commerce2/item.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:provider/provider.dart';
class checkOut extends StatelessWidget {
  const checkOut({super.key});

  @override
  Widget build(BuildContext context) {
    final checkout  = Provider.of<cart>(context);
    return Scaffold(
      appBar: myAppBar(text: "Check Out",),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: checkout.selectedProducts.length,
                itemBuilder: (BuildContext context,index){
                  return Card(
                    child: ListTile(
                      title: Text('Product $index'),
                      subtitle: Text("${checkout.selectedProducts[index].price}"),
                      leading: CircleAvatar(backgroundImage:AssetImage('${checkout.selectedProducts[index].imagePath}') ,child:Text('') ),
                      trailing: IconButton(
                        onPressed: (){
                          checkout.delete(checkout.selectedProducts[index]);
                        },icon: Icon(Icons.remove),

                      ),
                    ),
                  ) ;
                }
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){},
            child: Text('Pay ${checkout.price.toStringAsFixed(2)}'),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ))
            ),
          )
        ],
      ),
    );
  }
}
