import 'package:flutter/material.dart';
import 'package:learning_app/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashSreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new MyHomePage(),

        title: new Text('Welcome In Learning App',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            color: Colors.white

          ),),
        image: new Image.asset('assets/logo.png'),
        backgroundColor: Colors.indigo[900],
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.white
    );
  }
}
