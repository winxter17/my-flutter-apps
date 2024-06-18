import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginpagexfirebase/components/my_text_field.dart';

class SignUpPage extends StatefulWidget {
  void Function()? onTap;
  SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController password2Controller = TextEditingController();
    //sign user in
    void signUpUser()async{
      //loading screen
      showDialog(context: context, builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
      try{
        if(passwordController.text==password2Controller.text){
          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );}
        else{
          Navigator.pop(context);
          showDialog(context: context, builder: (context){
            return Center(
              child: AlertDialog(title: Text("Enter Correct Passwords"),),
            );
          });
        }
      }on FirebaseAuthException catch (e) {
          Navigator.pop(context);
          showDialog(context: context, builder: (context){
            return Center(
              child: AlertDialog(title: Text(e.code),),
            );
          });
        }

    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(Icons.lock, color: Colors.grey[700],size: 100,),
                Text("Make new Account right now",style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16,color: Colors.grey[800]
                )),
                SizedBox(height: 25,),
                MyTextField(
                  hidden: false,
                  text: "Email",
                  controller: emailController,
                ),
                MyTextField(
                  text: "Password",
                  hidden: true,
                  controller: passwordController,
                ),
                MyTextField(
                  text: "Confirm Password",
                  hidden: true,
                  controller: password2Controller,
                ),
                SizedBox(height: 15,),
                MaterialButton(onPressed: signUpUser,
                  child: Text("Sign Up",style: TextStyle(
                      color: Colors.white
                  ),),
                  color: Colors.black,
                  height: 60,
                  minWidth: 250,
                ),
                SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account?...."),
                    GestureDetector(
                      child: Text("Sign In",style: TextStyle(color: Colors.blue)),
                      onTap: widget.onTap,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ) ;
  }
}