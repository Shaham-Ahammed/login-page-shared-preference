import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task4_login_page/screens/homepage.dart';
import 'package:task4_login_page/screens/loginpage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

const String loggedIn = "loggedin"; //key of sharedpreference
bool? alreadyLogged; //variable to check wether key value is true

class _SplashScreenState extends State<SplashScreen> {
  @override
  //checking wether user is already signed in or not
  void initState() {
    decideScreen().whenComplete(() async {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                alreadyLogged == true ? const Homepage() : Loginpage()));
      });
    });
    super.initState();
  }

  /*Checking the value of sharedprefernce to decide 
  wether to go to login page or home page*/
  Future<void> decideScreen() async {
    final sharedpre = await SharedPreferences.getInstance();
    alreadyLogged = sharedpre.getBool(loggedIn);
  }

  //Designing of splash screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/chat.png',
              width: 150,
              height: 150,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 90),
            child: const Text(
              "WE CHAT",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'Oswald'),
            ),
          ),
        ],
      ),
    );
  }
}
