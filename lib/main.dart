import 'package:flutter/material.dart';
import 'package:myapp/screens/home_page.dart';
import 'package:myapp/screens/loginpage.dart';

void main()=>runApp(myapp());

class myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: homepage(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/home",
      routes: {
        //"/": (context)=> LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context)=> LoginPage(),
    },
    );
  }
}
