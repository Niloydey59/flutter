import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changebutton=false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username"
                    ),
                    onChanged: (value){
                        name=value;
                        setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password"
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  /*ElevatedButton(
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(140, 40),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                    onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.HomeRoute);
                    } ,
                  ),*/
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changebutton=true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.HomeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changebutton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,

                          /*shape: changebutton ?
                          BoxShape.circle :
                              BoxShape.rectangle,*/

                          borderRadius:
                          BorderRadius.circular(changebutton ? 50 : 8)
                      ),
                      child: changebutton ? Icon(
                        Icons.done,
                        color: Colors.white,
                      ):Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
