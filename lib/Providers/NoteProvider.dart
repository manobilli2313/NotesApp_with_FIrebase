import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Constants/ToastMessage.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool loading = false;

  void _setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

 

Future<void> addnotes(String title,String description)async{

  try{
    _setLoading(true);
    String id= randomAlphaNumeric(10);

  await firestore.collection('notes').doc(id).set({

    'id':id,
    'userid':auth.currentUser!.uid,
    'title':title,
    'description':description,
    'Date':DateTime.now().toString(),

    


  }
    
  );

  showSuccessToast('Your Notes added Successfully');

  }catch(e){
    showErrorToast(e.toString());


  }finally{
    _setLoading(false);

  }

  

}


//updatenote

Future<void> updatenote(String title,String description,String noteid)async{

  try{
    _setLoading(true);
    String id= randomAlphaNumeric(10);

  await firestore.collection('notes').doc(noteid).update({

    
   
    'title':title,
    'description':description,
    'Date':DateTime.now().toString(),

    


  }
    
  );

  showSuccessToast('Your Notes updated Successfully');

  }catch(e){
    showErrorToast(e.toString());


  }finally{
    _setLoading(false);

  }

  

}
Stream<QuerySnapshot> getallnotes(String uid) {
  try {

   // _setLoading(true);
    return firestore
        .collection('notes')
        .where('userid', isEqualTo: uid)
        .snapshots();
  } catch (e) {
    showSuccessToast(e.toString());
    // Return an empty stream to satisfy return type
    return const Stream.empty();
  }
}



Future<void> deletenote(String noteid)async{

  try{
    _setLoading(true);
    

  await firestore.collection('notes').doc(noteid).delete();

  showSuccessToast('Your Notes updated Successfully');

  }catch(e){
    showErrorToast(e.toString());


  }finally{
    _setLoading(false);

  }




}}
