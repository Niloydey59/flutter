import 'package:flutter/material.dart';
import 'package:myapp/screens/home_page.dart';
import 'package:myapp/screens/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/themes.dart';

void main()=>runApp(myapp());

class myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: homepage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.HomeRoute,
      routes: {
        //"/": (context)=> LoginPage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.LoginRoute: (context)=> LoginPage(),
    },
    );
  }
}
