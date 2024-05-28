import 'package:flutter/material.dart';
import 'Widgets/TextField.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Facebook'),
      ),
      body:  SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Text('Enter ur email'),
                  textField(hintText: 'Enter ur email:', keyboradType:TextInputType.emailAddress,password: false, ),
                  ElevatedButton(
                    style: ButtonStyle(

                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      foregroundColor:MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.blue)

                    ),
                    onPressed: (){

                      },

                    child: Text('Verify Email'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
