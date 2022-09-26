import 'package:flutter/material.dart';
import 'package:flutter_project/main_cards.dart';
import 'main.dart';

class MoM extends StatefulWidget {
  const MoM({Key? key}) : super(key: key);

  @override
  State<MoM> createState() => _MoMState();
}

class _MoMState extends State<MoM> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter MoM Example'),
          ),
          body:
          Center(child: Column(children: <Widget>[

            Container(
               // alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              child: new Column(
                children: [
                  Text('Are you a Mentor or Mentee?'),

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
                            MaterialPageRoute(builder: (context) =>  MainPage()),
                          );
                        },
                        child: Text(' Mentor '),
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
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                        child: Text('Mentee'),
                      )

                    ],
                  )
                ],
              )




            ),
            // Container(
            //   margin: EdgeInsets.all(5),
            //
            // ),
          ]
          ))
      ),
    );
  }
}