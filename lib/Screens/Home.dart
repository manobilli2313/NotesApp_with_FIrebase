import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Providers/NoteProvider.dart';
import 'package:notes_app/Screens/Addnotes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notes_app/Screens/UpdateNote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? userid;
  @override
void initState() {
  super.initState();
  getuserid();
  print(userid);
  print('uhhjhh');
}

getuserid() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  setState(() {
    userid = pref.getString('userid');
  });
}

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context,listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddNotes();
          }));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('My Notes'),
      ),
      body: userid == null
    ? Center(child: CircularProgressIndicator())
    : Container(
      margin: EdgeInsets.only(top: 30),
      child: StreamBuilder<QuerySnapshot>(
          stream: noteProvider.getallnotes(userid!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No notes found"));
            }
            var notes = snapshot.data!.docs;
      
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 25),
                  elevation: 3,
                  child: 

                  
      
      
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Title'),
                            Text(notes[index]['title']),
                    
                          ],
                        ),
                        SizedBox(height: 10,),
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Description'),
                            Text(notes[index]['description']),
                    
                          ],
                        ),
                    
                        SizedBox(height: 20,),
                    
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector
                              (onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return
                                  UpdateNotes(iid:notes[index]['id'],titles: notes[index]['title'],descriptionss: notes[index]['description'],);

                                }));
                              },
                                child: Icon(Icons.edit,color: Colors.blue,)
                                ),
                            
                              
                              SizedBox(width: 5,),
                              GestureDetector(
                                onTap: (){
                                  noteProvider.deletenote(notes[index]['id']);
                                },
                                child: Icon(Icons.delete,color: Colors.red,)),
                            ],
                          ),
                        ),

                        SizedBox(height: 20,),
                    
                      ],
                    ),
                  ),
                );

                
              },
            );
          },
        ),
    ),

    );
  }
}
