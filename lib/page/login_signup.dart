import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "MentorMe",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontWeight: FontWeight.bold)
              ),
            ),
            backgroundColor: const Color(0xfff07d33),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
                child: new Column(
                  children: [
                    Text(
                    "Welcome to MentorMe, \nThe best mentor finder app",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(),
                      ),
                    ),
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            side: BorderSide(
                                width: 2,
                                color: Colors.black
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  MoM()),
                            );
                          },
                          child: Text(
                              ' Sign Up ',
                              style: GoogleFonts.roboto(
                              textStyle: TextStyle(),
                            ),
                          ),
                        ),

                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            side: BorderSide(
                                width: 2,
                                color: Colors.black
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MoM()),
                            );
                          },
                          child: Text(
                            ' Login ',
                            style: GoogleFonts.roboto(
                            textStyle: TextStyle(),
                            ),
                          ),
                        )

                      ],
                    )
                  ],
                )
            ),
          ]
          ))
      ),
    );
  }
}