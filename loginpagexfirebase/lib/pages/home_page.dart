import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //userid
    final user = FirebaseAuth.instance.currentUser!;
    //logout
    void logout()async{
      FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),backgroundColor: Colors.blue,
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      
      ),
      body: Center(child: Text("User logged in as : "+user.email.toString())),
    );
  }
}
