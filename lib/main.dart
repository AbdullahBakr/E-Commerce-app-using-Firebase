import 'package:e_commerce2/ForgetPassword.dart';
import 'package:e_commerce2/cart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
import 'firebase_options.dart';
import 'signUp.dart';
import 'signIn.dart';
import 'ForgetPassword.dart';
import 'Shared Folders/snackbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Product details.dart';
import 'responsive ui.dart';
import 'checkout.dart';
// ignore_for_file: prefer_const_constructors

// void main() {
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => MyApp(), // Wrap your app
//     ),
//   );
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  showSnackBar1 c1 =showSnackBar1();
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth =MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return cart();
      },
      child: MaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            // if (snapshot.connectionState == ConnectionState.waiting) {return Center(child: CircularProgressIndicator(color: Colors.white,));}
             if (snapshot.hasError) {return c1.showSnackBar(context, "Something went wrong");}
             else if(snapshot.hasData){
              return Home();
            } else {
              return signIn();
         }
          },
        ),
        // initialRoute: '/',
        routes: {
          '/forgetpassword' : (context) =>  ForgetPassword(),
          '/signIn': (context) =>  signIn(),
          '/second': (context) =>  signUp(),
          '/Home': (context) =>  Home(),
          '/checkout': (context) =>  checkOut(),
        },
      ),
    );
  }
}


