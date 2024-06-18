import 'package:flutter/material.dart';
import 'package:loginpagexfirebase/pages/signin_page.dart';
import 'package:loginpagexfirebase/pages/signup_page.dart';

class SignInOrSignUpPage extends StatefulWidget {
  const SignInOrSignUpPage({super.key});

  @override
  State<SignInOrSignUpPage> createState() => _SignInOrSignUpPageState();
}

class _SignInOrSignUpPageState extends State<SignInOrSignUpPage> {
  @override
  //bool for page
  bool showWhichPage=true;
  // toggle pages
  void togglePages(){
    setState(() {
      showWhichPage=!showWhichPage;
    });
  }

  Widget build(BuildContext context) {
    if(showWhichPage){
      return SignInPage(onTap: togglePages);
    }
    else{
      return SignUpPage(onTap: togglePages,);
    }
  }
}
