import 'package:flutter/material.dart';
import 'color.dart';
// ignore_for_file: prefer_const_constructors


class textField extends StatelessWidget {
  final String hintText;
    final bool password;
    final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;
    final String? Function(String?)? validator;
  final Key? formkey;
  final TextInputType? keyboradType;
  final Widget? suffixixon;
  final Function(String)? onchanged;

  textField({super.key, required this.hintText,required this.keyboradType,this.password =true, this.controller, this.validator, this.autovalidateMode, this.formkey, this.suffixixon, this.onchanged,});

  final bool _isSecured = false;

  // late final Widget suffixixon;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        onChanged: onchanged,
        validator: validator,
        controller: controller ,
        autovalidateMode: autovalidateMode,
        obscureText: password,
        keyboardType: keyboradType,
        decoration: InputDecoration(
          suffixIcon: suffixixon,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFA91414)),
          ),
          filled: true,
          fillColor: lightPurple,
        ),
      ),
    );
  }
}

// void password_visibilty(){
//   IconButton(
//     onPressed: (){
//       setState(() {
//
//       });
//     }, icon: passwordObsecure? Icon(Icons.visibility): Icon(Icons.visibility_off) ,
//   ),
// }