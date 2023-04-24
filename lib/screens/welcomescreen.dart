import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'registerscreen.dart';
import 'loginscreen.dart';
import 'package:chatgpt_movierater_app/roundedbutton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      // upperBound: 100.0,
      vsync: this,
    );
    // animation = CurvedAnimation(parent: controller,
    //                             curve: Curves.decelerate);

    animation = ColorTween(
      begin: Colors.red,
      end: Colors.lime,
    ).animate(controller);
    // controller.reverse(from: 1.0);
    controller.forward();
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from:1.0);
    //
    //   }
    //   else if (status==AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    // child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                // SizedBox(:),
                Flexible(
                  child: Text(
                    // '${ controller.value.toInt()} %',
                    'Movie Rater App Bitchez',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              bTitle: 'Login',
              NextScreen: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              bTitle: 'Register',
              NextScreen: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 16.0),
            //   child: Material(
            //     color: Colors.blueAccent,
            //     borderRadius: BorderRadius.circular(30.0),
            //     elevation: 5.0,
            //     child: MaterialButton(
            //       onPressed: () {
            //         //Go to registration screen.
            //         Navigator.pushNamed(context, RegistrationScreen.id,);
            //       },
            //       minWidth: 200.0,
            //       height: 42.0,
            //       child: Text(
            //         'Register',
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

