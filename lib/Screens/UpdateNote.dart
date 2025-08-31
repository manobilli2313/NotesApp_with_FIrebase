import 'package:flutter/material.dart';
import 'package:notes_app/Constants/Button.dart';
import 'package:notes_app/Constants/Textformfiled.dart';
import 'package:notes_app/Providers/AuthProvider.dart';
import 'package:notes_app/Providers/NoteProvider.dart';
import 'package:provider/provider.dart';

class UpdateNotes extends StatefulWidget {

  String iid,titles,descriptionss;
   UpdateNotes({super.key,required this.iid,required this.titles,required this.descriptionss});

  @override
  State<UpdateNotes> createState() => _UpdateNotesState();
}

class _UpdateNotesState extends State<UpdateNotes> {

  @override
  void initState(){
    super.initState();
    title.text=widget.titles;
    description.text=widget.descriptionss;


  }



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

            MyButton(title: 'Update', onTap: ()async{

              await authprovider.updatenote(title.text, description.text.toString(),widget.iid.toString());
              Navigator.pop(context);
            

            }),

            
          ],
        ),
      ),
    );
  }
}