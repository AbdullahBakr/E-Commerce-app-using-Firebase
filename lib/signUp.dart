import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Widgets/TextField.dart';
import 'Widgets/Buttons.dart';
import 'Widgets/color.dart';
import 'package:email_validator/email_validator.dart';
import 'Shared Folders/snackbar.dart';
import 'Shared Folders/checkPassword.dart';
import 'appbar.dart';
// ignore_for_file: prefer_const_constructors

class signUp extends StatefulWidget {

  signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  showSnackBar1 c1=showSnackBar1();
  RegExp isVlidEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final emailController = TextEditingController();
  bool is_loading = false;
  final passwordController = TextEditingController();
  final  _formKey = GlobalKey<FormState>();
  checkPassword check1=checkPassword();
   bool password = true;
  bool is_password= false;
  bool is_hasSpecialCharacters = false;
  bool is_hasLowercase = false;
  bool is_hasDigits = false;
  bool is_hasUppercase = false;
  onChangePassword(String password1){
    is_password= false;
    is_hasSpecialCharacters = false;
    is_hasLowercase = false;
    is_hasDigits = false;
    is_hasUppercase = false;
    bool hasUppercase = password1.contains( RegExp(r'[A-Z]') );
    bool hasDigits = password1.contains( RegExp(r'[0-9]') );
    bool hasLowercase = password1.contains( RegExp(r'[a-z]') );
    bool hasSpecialCharacters = password1.contains( RegExp(r'[!@#$%^&*(),.?":{}|<>]') );
    bool hasMin8Characters = password1.contains( RegExp(r'.{8,}') );
    setState(() {
      if (hasSpecialCharacters){
        is_hasSpecialCharacters = true;
      }
      if (hasMin8Characters){
        is_password =! is_password;
      }
      if (hasDigits){
        is_hasDigits = true;
      }
      if (hasLowercase){
        is_hasLowercase = true;
      }
      if (hasUppercase){
        is_hasUppercase = true;
      }
    });
  }
  register() async{
    setState(() {
      is_loading=true;
    });
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        c1.showSnackBar(context, 'The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        c1.showSnackBar(context, 'The email is already used ');
      } else {
        c1.showSnackBar(context, 'Erro please Try again later');
      }
    } catch (e) {
      c1.showSnackBar(context, '$e');
    }
    setState(() {
      is_loading=false;
    });
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    textField(hintText: 'Enter Your name:',keyboradType: TextInputType.text,password: false,),
                    textField(hintText: 'Enter Your email:',keyboradType: TextInputType.emailAddress,password: false,controller: emailController,validator: (email){
                      return email!.contains(isVlidEmail) ? null :"Enter a valid email" ;
                    },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    textField(hintText: 'Enter Your Password:',keyboradType: TextInputType.visiblePassword,password: password? true : false,controller: passwordController,
                      onchanged: (password){
                        onChangePassword(password);
                        // check(password);
                      },
                      validator: (value){
                        return value!.length < 8 ? "Enter at least 6 characters": null;
                      },

                      suffixixon: IconButton(
                        onPressed: (){
                          setState(() {
                            password =!password;
                            passwordController.text;
                          });
                        },
                        icon: password? Icon(Icons.visibility_off):Icon(Icons.visibility),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    MaterialButton(
                        color: is_loading? null:Colors.blue,
                        textColor: Colors.white,
                        onPressed: () async{
                          if(_formKey.currentState!.validate()){
                            await register();
                            if(!mounted) return;
                            Navigator.pop(context);
                          }
                          else {
                            c1.showSnackBar(context, 'Error');
                          }
                         },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: is_loading? CircularProgressIndicator(color: Colors.blue,): Text('Sign Up'),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 7.5),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: is_password? green:white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: grey)
                          ),
                          child: Icon(Icons.check,color: Colors.white,size: 17,),
                        ),
                        Text('At least 8 characters')
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 7.5),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: is_hasSpecialCharacters? green:white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: grey)
                          ),
                          child: Icon(Icons.check,color: Colors.white,size: 17,),
                        ),
                        Text('Has a special character')
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 7.5),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: is_hasDigits ? green:white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: grey)
                          ),
                          child: Icon(Icons.check,color: Colors.white,size: 17,),
                        ),
                        Text('At least one number')
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 7.5),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: is_hasUppercase? green:white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: grey)
                          ),
                          child: Icon(Icons.check,color: Colors.white,size: 17,),
                        ),
                        Text('Has Upper case')
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 7.5),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: is_hasLowercase? green:white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: grey)
                          ),
                          child: Icon(Icons.check,color: Colors.white,size: 17,),
                        ),
                        Text('Has Lower case')
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account yet?'),
                        MaterialButton(
                          textColor: blue,
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text('Sign in'),),

                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
