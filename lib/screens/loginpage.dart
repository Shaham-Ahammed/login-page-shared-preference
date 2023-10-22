import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task4_login_page/screens/SplashScreen.dart';
import 'package:task4_login_page/screens/homepage.dart';


class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  //fixed passsword and username
  final username = "shaham";
  final password = "sha7";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
            child: Text(
          "LOGIN",
          style: TextStyle(fontFamily: "Oswlad"),
        )),
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.white, fontFamily: "SourceCodePro"),
                decoration: const InputDecoration(
                  hintText: "Enter User Name",
                  hintStyle: TextStyle(
                      color: Colors.white, fontFamily: "SourceCodePro"),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                validator: (value) {
                  if (value == username) {
                    return null;
                  } else if (value == "") {
                    return "please enter your username";
                  } else {
                    return "username doesnt exist";
                  }
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: TextFormField(
                style: const TextStyle(
                    color: Colors.white, fontFamily: "SourceCodePro"),
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                  hintStyle: TextStyle(
                      color: Colors.white, fontFamily: "SourceCodePro"),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                validator: (value) {
                  if (value == password) {
                    return null;
                  } else if (value == "") {
                    return "please enter your password";
                  } else {
                    return "incorrect password";
                  }
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                /*if form is filled in correct manner, it will give true value to 
                  sharedpreference key (loggedIn) and will take to homepage*/
                if (_formKey.currentState!.validate()) {
                  final sharedpre = await SharedPreferences.getInstance();
                  sharedpre.setBool(loggedIn, true);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Homepage()));
                } else {
                  return;
                }
              },
              icon: const Icon(Icons.login),
              label: const Text("LOGIN"),
              style: ElevatedButton.styleFrom(minimumSize: const Size(100, 50)),
            )
          ],
        ),
      )),
    );
  }
}
