import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpagexfirebase/components/my_text_field.dart';

class SignInPage extends StatefulWidget {
  void Function()? onTap;
  SignInPage({super.key, required this.onTap});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    //sign user in
    void signInUser()async{
      //loading screen
      showDialog(context: context, builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
      try{
        //main function
        final credentials=await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e){
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
                Text("Welcome back dear User",style: TextStyle(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text("Forgot Password?",style: TextStyle(
                        color: Colors.grey[600],
                      fontWeight: FontWeight.bold
                    ))
                  ],),
                ),
                SizedBox(height: 15,),
                MaterialButton(onPressed: signInUser,
                  child: Text("Sign In",style: TextStyle(
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
                    Text("First time?...."),
                    GestureDetector(
                        child: Text("Register Now",style: TextStyle(color: Colors.blue)),
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
