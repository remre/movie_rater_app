import 'package:chatgpt_movierater_app/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'moviescreen.dart';
// import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:chatgpt_movierater_app/constants.dart';
import 'package:chatgpt_movierater_app/roundedbutton.dart';


class RegistrationScreen extends StatefulWidget {
  static String id = '/registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String  email;
  late String   password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(tag: 'logo',
                  child: Container(
                    height: 250.0,
                    // child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {

                },
                decoration:kTextFieldDecoration,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 10.0,
              ),
              RoundedButton(colour: Colors.blueAccent, bTitle: 'Register', NextScreen:() async {
                setState(() {
                  showSpinner = true;
                });

                // Navigator.pushNamed(context, LoginScreen.id);
                // print(email);
                // print(password);
                try{
                  final newUser= await _auth.createUserWithEmailAndPassword(
                    email: email!, password: password!,);
                  if (newUser != null) {
                    Navigator.pushNamed(context, MovieScreen.id);
                  }
                  setState(() {
                    showSpinner = false;
                  });

                }
                catch (e){
                  Navigator.pushNamed(context, MovieScreen.id);
                  print(e);
                }
              },),
            ],
          ),
        ),
      ),
    );
  }
}
