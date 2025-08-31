import 'package:flutter/material.dart';
import 'package:notes_app/Constants/Button.dart';
import 'package:notes_app/Constants/Textformfiled.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Textform(controller: email,
             keyboarinpput: TextInputType.numberWithOptions(), 
             hinttext: 'Enter Youe Email', 
             labeltext: 'Email',
             prefixicon: Icon(Icons.email),
            ),

            const SizedBox(height: 20,),


            MyButton(title: 'Forgot Password', onTap: (){

            }),


            
        
          ],
        ),
      ),
    );
  }
}