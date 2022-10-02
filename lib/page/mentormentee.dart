import 'package:flutter/material.dart';
import 'package:flutter_project/page/main_cards.dart';
import 'package:flutter_project/page/edit_profile_page.dart';
import 'package:flutter_project/page/test_profile_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/background.dart';
import '../constants.dart';
import '../main.dart';
import '../responsive.dart';

// class MoM extends StatelessWidget {
//   const MoM({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Background(
  //     child: SingleChildScrollView(
  //       child: Row(
  //             children: [
  //               Expanded(
  //                 child: Column(
  //                   children: [
  //                     SizedBox(height: defaultPadding),
  //                     Row(
  //                       children: [
  //                         const Spacer(),
  //                         Expanded(
  //                           flex: 8,
  //                           child: SvgPicture.asset("assets/icons/mentee_mentor.svg"),
  //                         ),
  //                         const Spacer(),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     //         Expanded(
  //     //           child: Column(
  //     //             mainAxisAlignment: MainAxisAlignment.center,
  //     //             children: const [
  //     //               // SizedBox(
  //     //               //   width: 450,
  //     //               //   child: SignUpForm(),
  //     //               // ),
  //     //               SizedBox(height: defaultPadding / 2),
  //     //               // SocalSignUp()
  //     //             ],
  //     //           ),
  //     //         )
  //     //       ],
  //     //     ),
  //     //   ),
  //     // );
//   }
// }


class MoM extends StatefulWidget {
  const MoM({Key? key}) : super(key: key);

  @override
  State<MoM> createState() => _MoMState();
}

class _MoMState extends State<MoM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "MENTORME",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Color(0xfffa99cae),
          ),
          body:
          Center(child: Column(children: <Widget>[
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/mentee_mentor.svg"),
            ),
            Text("Are you a Mentor or Mentee?", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MoM();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryLightColor, elevation: 0),
                  child: Text(
                    "Mentor".toUpperCase(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EditProfilePage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryLightColor, elevation: 0),
                  child: Text(
                    "Mentee".toUpperCase(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                // OutlinedButton(
                //   style: OutlinedButton.styleFrom(
                //     shape: StadiumBorder(),
                //     side: BorderSide(
                //         width: 2,
                //         color: Colors.black
                //     ),
                //   ),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) =>  EditProfilePage()),
                //     );
                //   },
                //   child: Text(' Mentor'),
                // ),
                //
                // OutlinedButton(
                //   style: OutlinedButton.styleFrom(
                //     shape: StadiumBorder(),
                //     side: BorderSide(
                //         width: 2,
                //         color: Colors.black
                //     ),
                //   ),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => EditProfilePage()),
                //     );
                //   },
                //   child: Text('Mentee'),
                // ),
              ],
            ),
            SizedBox(height: 400),
            // const Spacer(),
          ]
          )
        ),
      );
  }
}