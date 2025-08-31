import 'package:flutter/material.dart';
import 'package:notes_app/Constants/Button.dart';
import 'package:notes_app/Constants/Textformfiled.dart';
import 'package:notes_app/Providers/AuthProvider.dart';
import 'package:notes_app/Providers/NoteProvider.dart';
import 'package:provider/provider.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {

  TextEditingController title=TextEditingController();
  TextEditingController description=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authprovider=Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Add Notes'),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Textform(controller: title,
             keyboarinpput: TextInputType.emailAddress, 
             hinttext: 'Enter Your Title', 
             labeltext: 'Title',
             prefixicon: Icon(Icons.email),
            ),

            const SizedBox(height: 20,),

            Textform(controller: description,
            
             keyboarinpput: TextInputType.emailAddress, 
             hinttext: 'Enter Your Description ...', 
             labeltext: 'Description',
             
             prefixicon: Icon(Icons.description),
            ),

            const SizedBox(
              height: 40,
            ),

            MyButton(title: 'Add', onTap: ()async{

              await authprovider.addnotes(title.text, description.text.toString());
              Navigator.pop(context);
            

            }),

            
          ],
        ),
      ),
    );
  }
}