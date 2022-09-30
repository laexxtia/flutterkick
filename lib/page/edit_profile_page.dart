import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/page/main_cards.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';

import '../constants.dart';
import '../model/mentor_user.dart';
import '../model/user.dart';
import '../utils/user_preferences.dart';
import '../widget/appbar_widget.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Mentee user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile Creation",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Color(0xfffa99cae),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 20),
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainPage();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryLightColor, elevation: 0),
              child: Text(
                "NEXT".toUpperCase(),
                style: TextStyle(color: Colors.black),
              ),
            ),
            // FloatingActionButton(
            //   child: Text('Next', style: TextStyle(fontSize: 15.0),),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => MainPage()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
  );
}
