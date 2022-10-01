import 'package:flutter/material.dart';
import 'package:flutter_project/page/edit_profile_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'mentor_page.dart';

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
              "MentorMe",
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Mentor_Page(acceptStatus: false);
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