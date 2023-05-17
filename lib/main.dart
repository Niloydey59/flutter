import 'package:flutter/material.dart';
import 'package:myapp/screens/home_page.dart';
import 'package:myapp/screens/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

void main()=>runApp(myapp());

class myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: homepage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/login",
      routes: {
        //"/": (context)=> LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context)=> LoginPage(),
    },
    );
  }
}
