import 'package:flutter/material.dart';
import 'Widgets/color.dart';
import 'Widgets/drawer.dart';
import 'appbar.dart';
class productDetails extends StatelessWidget {
  const productDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(text: 'Product Details',),
      drawer: drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Image.asset('images/lamp.jpeg'),
          ),
          Card(
            color: Colors.grey.shade200,
            child: ListTile(
              title: Text('Product title'),
              trailing: Text('13\$'),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Review:'
                        '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    Icon(Icons.star,color: Colors.yellow.shade600,),
                    Icon(Icons.star,color: Colors.yellow.shade600,),
                    Icon(Icons.star,color: Colors.yellow.shade600,),
                    Icon(Icons.star,color: Colors.yellow.shade600,),
                    Icon(Icons.star,color: grey,),
                  ],
                ),
                SizedBox(height: 20,),
                Text('Details',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
