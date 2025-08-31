import 'package:flutter/material.dart';

class Textform extends StatelessWidget {
  final TextEditingController controller;
  final obscuretext;
  final keyboarinpput;
  final String hinttext;
  final String labeltext;
  final Icon? prefixicon;
  final int? maxline;


  Textform({super.key,required this.controller,this.obscuretext=false,
  required this.keyboarinpput,
  required this.hinttext,
  required this.labeltext,
  this.prefixicon,
  this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboarinpput,
      maxLines: maxline,
      

      decoration: InputDecoration(
        hintText: hinttext,
        labelText: labeltext,
        prefixIcon: prefixicon,
        

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          )
          
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          )
        )
        

      ),
      

    );
  }
}