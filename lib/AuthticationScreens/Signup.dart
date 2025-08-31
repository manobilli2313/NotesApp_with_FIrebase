import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/AuthticationScreens/Forgotpassword.dart';
import 'package:notes_app/AuthticationScreens/Login.dart';
import 'package:notes_app/Constants/Button.dart';
import 'package:notes_app/Constants/Textformfiled.dart';
import 'package:notes_app/Providers/AuthProvider.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController username= TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<MyAuthProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

             Textform(controller: username,
             keyboarinpput: TextInputType.emailAddress, 
             hinttext: 'Enter Youe UserName', 
             labeltext: 'User Name',
             prefixicon: Icon(Icons.person),
            ),

            const SizedBox(height: 20,),

            Textform(controller: email,
             keyboarinpput: TextInputType.emailAddress, 
             hinttext: 'Enter Youe Email', 
             labeltext: 'Email',
             prefixicon: Icon(Icons.email),
            ),

            const SizedBox(height: 20,),

            Textform(controller: password,
             keyboarinpput: TextInputType.number, 
             hinttext: 'Enter Your Password', 
             labeltext: 'Password',
             obscuretext: true,
             prefixicon: Icon(Icons.password),
            ),

            const SizedBox(
              height: 40,
            ),

            MyButton(title: 'Sign Up', onTap: ()async{
              await authProvider.signup(email.text, password.text, username.text);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Login();

                  }));

            }),

            const SizedBox(height: 30,),


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Forgotpassword();

                  }));
                 
                }, child: Text('Forgot Password?'))

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Login();

                  }));
                 
                }, child: Text('Already have account?Login',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue),))

              ],
            )


            
        
          ],
        ),
      ),
    );
  }
}