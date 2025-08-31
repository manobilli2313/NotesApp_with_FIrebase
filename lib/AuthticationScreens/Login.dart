import 'package:flutter/material.dart';
import 'package:notes_app/AuthticationScreens/Forgotpassword.dart';
import 'package:notes_app/AuthticationScreens/Signup.dart';
import 'package:notes_app/Constants/Button.dart';
import 'package:notes_app/Constants/Textformfiled.dart';
import 'package:notes_app/Providers/AuthProvider.dart';
import 'package:notes_app/Screens/Home.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();
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
            Textform(controller: email,
             keyboarinpput: TextInputType.emailAddress, 
             hinttext: 'Enter Your Email', 
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

            MyButton(title: 'Login', onTap: ()async{

              await authProvider.login(email.text, password.text).then((value) {
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                    return HomeScreen();

                  }));
                
              });
             

            }),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Signup();

                  }));
                 
                }, child: Text('Dont have account?Sign Up'))

              ],
            )


            
        
          ],
        ),
      ),
    );
  }
}