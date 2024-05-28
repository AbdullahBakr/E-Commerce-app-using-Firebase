import 'package:flutter/material.dart';
import 'package:e_commerce2/Widgets/color.dart';
class checkPassword extends StatefulWidget {

  const checkPassword({super.key});

  @override
  State<checkPassword> createState() => _checkPasswordState();
}

class _checkPasswordState extends State<checkPassword> {
  bool is_password= false;
  bool is_hasSpecialCharacters = false;
  bool is_hasLowercase = false;
  bool is_hasDigits = false;
  bool is_hasUppercase = false;
  onChangePassword2(String password1){
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
