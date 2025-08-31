import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Constants/ToastMessage.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAuthProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool loading = false;

  void _setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> signup(String email, String password, String username) async {
    try {
      _setLoading(true);

      // ✅ create user in FirebaseAuth
      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ✅ generate random ID (if you really want it)
      var id = randomAlphaNumeric(10);

      // ✅ save user details in Firestore
      await firestore.collection('users').doc(id).set({
        'userid': result.user!.uid,   // Firebase Auth UID
        'id': id,                     // Your random id
        'email': email,
        'username': username,
        'createdDate': DateTime.now().toIso8601String(),
      });

      showSuccessToast("Signup successful ✅");
    } on FirebaseAuthException catch (e) {
      showErrorToast(e.message ?? "Signup failed");
    } catch (ex) {
      showErrorToast(ex.toString());
    } finally {
      _setLoading(false);
    }
  }


  // login fucntion

 Future<void> login(String email, String password) async {
  try {
    _setLoading(true);

    // 🔹 Sign in with FirebaseAuth
    final user = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = user.user!.uid;

    // 🔹 Fetch user document from Firestore where userid == uid
    final querySnapshot = await firestore
        .collection('users')
        .where('userid', isEqualTo: uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final userData = querySnapshot.docs.first.data();

      // 🔹 Save required fields in SharedPreferences
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("userid", userData['userid']);
      await pref.setString("email", userData['email']);
      await pref.setString("username", userData['username']);

      showSuccessToast("Login successful ✅");
    } else {
      showErrorToast("No user record found in Firestore ❌");
    }
  } on FirebaseAuthException catch (e) {
    showErrorToast(e.message ?? "Login failed");
  } catch (e) {
    showErrorToast(e.toString());
  } finally {
    _setLoading(false);
  }
}

Future<void> addnotes(String title,String description)async{

  try{
    _setLoading(true);
    String id= randomAlphaNumeric(10);

  await firestore.collection('notes').doc(id).set({

    'id':id,
    'userid':auth.currentUser!.uid,
    'title':title,
    'description':'description',
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

}
