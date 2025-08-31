import 'package:flutter/material.dart';
import 'package:notes_app/AuthticationScreens/Login.dart';
import 'package:notes_app/Constants/Button.dart';

class SplashSCreen extends StatelessWidget {
  const SplashSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyButton(title: 'Get Started',
             onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
                return Login();
        
              }));
        
            })
          ],
        
        
        ),
      ),
    );
  }
}