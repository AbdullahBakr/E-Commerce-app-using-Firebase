import 'package:firebase_auth/firebase_auth.dart';
import 'Shared Folders/snackbar.dart';
import 'Widgets/color.dart';
import 'package:flutter/material.dart';
import 'Widgets/TextField.dart';
import 'Widgets/Buttons.dart';
import 'Widgets/drawer.dart';
import 'appbar.dart';
// ignore_for_file: prefer_const_constructors

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}
class _signInState extends State<signIn> {
  showSnackBar1 c1=showSnackBar1();
  bool password = true;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool isloading=false;

  logIn() async {
    setState(() {
      isloading=true;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {

        c1.showSnackBar(context, "Errro: ${e.code} ");


    }
    setState(() {
      isloading=false;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  late final PreferredSizeWidget? coo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false
        ,
        title: Text('Sign in',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  textField(hintText: 'Enter Your Email::',keyboradType: TextInputType.emailAddress,
                    suffixixon: Icon(Icons.email),password: false,controller: emailController,),
                  textField(hintText: 'Enter Your Password:',keyboradType: TextInputType.visiblePassword,
                    controller: passwordController,
                    password: password? true:false,
                    suffixixon: IconButton(
                      onPressed: (){
                        setState(() {
                          password =!password;
                          passwordController.text;
                        });
                      },
                      icon: password? Icon(Icons.visibility_off):Icon(Icons.visibility),
                    ),
                  ),
                  MaterialButton(
                    color: isloading?null: blue,
                    textColor: white,
                    onPressed: () async{
                      if(!mounted) return;
                      await logIn();
                  },
                    child: isloading? CircularProgressIndicator(color: blue,) :Text('Sign in'),
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/forgetpassword');
                      },
                      child: Text('Forget Password',style: TextStyle(decoration: TextDecoration.underline,fontSize: 15))
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account yet?'),
                      MaterialButton(
                        textColor: blue,
                        onPressed: (){
                          Navigator.pushNamed(context, '/second');
                        },
                        child: Text('Sign Up'),),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

