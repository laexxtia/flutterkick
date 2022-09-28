import 'package:flutter/material.dart';

import 'mentormentee.dart';
class LoginSignup extends StatefulWidget {
  const LoginSignup({Key? key}) : super(key: key);

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter LoginSignup'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: FloatingActionButton(
                child: Text('SignUp', style: TextStyle(fontSize: 15.0),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MoM()),
                  );
                },
              ),


            ),
            Container(
              margin: EdgeInsets.all(5),
              child: FloatingActionButton(
                child: Text('LogIn', style: TextStyle(fontSize: 15.0),),
                // color: Colors.blueAccent,
                // textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          ]
          ))
      ),
    );
  }
}