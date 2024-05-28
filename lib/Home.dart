import 'package:e_commerce2/cart.dart';
import 'package:flutter/material.dart';
import 'Widgets/drawer.dart';
import 'appbar.dart';
import 'item.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: myAppBar(text: 'Home'),
      drawer: drawer(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.builder(
              shrinkWrap:true ,
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length ,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 240,
                ),
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.only(topLeft:Radius.circular(10) ,topRight: Radius.circular(10) ),
                              child: Image.asset(
                                  items[index].imagePath!,
                                height: 170,
                                // width: ,
                                fit: BoxFit.cover,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //TODO : Change the textTheme
                                Text('\$${items[index].price}'
                                ),

                                Consumer<cart>(builder: (context,product,child){
                                  return  IconButton(
                                      onPressed: (){
                                        product.add(items[index]);
                                      },
                                      icon: Icon(Icons.add,color: Colors.green,size: 35,)
                                  );
                                }),

                              ],
                            ),
                          ),


                        ],
                      ),


                    ),
                  );
                }
            ),
          ),
        ),
      )
    );
  }
}
