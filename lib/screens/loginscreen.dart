import 'package:chatgpt_movierater_app/screens/moviescreen.dart';
import 'package:chatgpt_movierater_app/screens/welcomescreen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:chatgpt_movierater_app/models/constants.dart';
import 'package:chatgpt_movierater_app/models/roundedbutton.dart';

late User  loggedInUser;

class LoginScreen extends StatefulWidget {

  static String id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  void getCurrentUser()  async {
    try {
      final user =   _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser!.email);
      }
    }
    catch(e) {
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  final _formKey = GlobalKey<FormState>();


  late String email;
  late String password;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;

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
              Form(
                key: _formKey,
                child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      final bool isValid = EmailValidator.validate(email);
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      else if ( isValid == false) {
                        return 'please enter valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(fillColor: Colors.lightBlueAccent),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some password';
                      }
                      return null;
                    },
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password',),
                  ),
                ],
              ),),
              SizedBox(
                height: 15.0,
              ),
              RoundedButton(colour: Colors.blueAccent, bTitle: 'login', NextScreen:()  async {
                if (_formKey.currentState!.validate() == true) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
                // setState(() {
                //   showSpinner = true;
                // });
                try {
                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if(user != null) {
                    Navigator.pushNamed(context, MovieScreen.id);
                  }
                  setState(() {
                    showSpinner = false;
                  });
                }
                catch(e) {
                  print(e);
                  Navigator.pushNamed(context, WelcomeScreen.id);
                }
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
