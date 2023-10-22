import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task4_login_page/screens/SplashScreen.dart';
import 'package:task4_login_page/screens/loginpage.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:const Center(child: Text("WE CHAT")),
          leading: IconButton(
              onPressed: () {
                alertScreen(context);
              },
              icon:const Icon(Icons.logout))),

      //LIST VIEW        
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                bool isCircle = index % 2 == 0;
                Widget amPm;
                if (index <= 11) {
                  amPm = Text("${index + 1} pm");
                } else {
                  amPm = Text("${index - 11} am");
                }
                return ListTile(
                    title: Text("Person ${index + 1}"),
                    subtitle:const Text("recent conversation"),
                    leading: isCircle
                        ?const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/boy2.jpg'),
                            radius: 21,
                          )
                        : Container(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              "assets/images/girl.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                    trailing: amPm);
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: 15)),
    );
  }
  
  //LOGOUT ALERT
  void alertScreen(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:const Text("LOGOUT !"),
            content:const Text("are you sure you need to logout ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child:const Text("NO")),
              TextButton(
                  onPressed: () async {
                    final sharedpre =
                        await SharedPreferences.getInstance();
                    sharedpre.setBool(loggedIn, false);

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Loginpage()),
                        (route) => false);
                  },
                  child:const Text("YES"))
            ],
          );
        });
  }
}
