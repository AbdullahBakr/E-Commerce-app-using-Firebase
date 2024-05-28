import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'color.dart';
class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade100,
      child: Container(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 67, 139),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset('images/IMG_3066.JPG',fit: BoxFit.cover, )),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: Text("Abdallah Bakr",style: TextStyle(
                        color: Colors.white
                    ),),
                  ),Text('abdullahbakr2001@gmail.com',style: TextStyle(
                      color: Colors.white.withOpacity(.8)
                  ),),


                  // Expanded(child:
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: ListTile(
                  //     title: Text("Abdallah Bakr"),
                  //     subtitle: Text('abdullahbakr2001@gmail.com',textAlign: TextAlign.start,),
                  //   ),
                  // ))
                ],
              ),
            ),
            ListTile(
              title:  Text('Home',style: TextStyle(
                fontSize: 18,
              ),),
              leading: Icon(Icons.home,color: appBarColor,),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/Home');
              },
            ),
            ListTile(
              title:  Text('Products',style: TextStyle(
                fontSize: 18,
              ),),
              leading: Icon(Icons.add_shopping_cart_rounded,color: appBarColor,),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/checkout');
              },
            ),
            ListTile(
              title: const Text('About',style: TextStyle(
                fontSize: 18,
              ),),
              leading: Icon(Icons.contact_support,color: appBarColor,),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text('Logout',style: TextStyle(
                fontSize: 18,
              ),),
              leading: Icon(Icons.logout,color: appBarColor,),
              onTap: ()  {
                 FirebaseAuth.instance.signOut();
              },
            ),

          ],
        ),
      ),
    );
  }
}
