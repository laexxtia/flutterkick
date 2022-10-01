import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/page/Welcome/welcome_screen.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import '../model/user.dart';
import '../utils/user_preferences.dart';

class Mentor_Page extends StatefulWidget {
  final bool acceptStatus;
  const Mentor_Page({Key? key, required this.acceptStatus}) : super(key: key);

  @override
  State<Mentor_Page> createState() => _Mentor_PageState(acceptStatus);
}

class _Mentor_PageState extends State<Mentor_Page> {

  _Mentor_PageState(acceptStatus);

  @override
  Widget build(BuildContext context) {
    Mentee user = UserPreferences.myUser;

    void customToast(String message, BuildContext context) {
      showToast(
          message,
          textStyle: TextStyle(
              fontSize: 24,
              wordSpacing: 0.1,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          textPadding: EdgeInsets.all(23),
          fullWidth: false,
          toastHorizontalMargin: 5,
          borderRadius: BorderRadius.circular(15),
          backgroundColor: Colors.tealAccent,
          alignment: Alignment.bottomLeft,
          position: StyledToastPosition.top,
          animation: StyledToastAnimation.slideToBottomFade,
          duration: Duration(seconds: 2),
          context: context);
    }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Mentee's Requests"),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomeScreen();
                  },
                ),
              );
            },
          ),
        ),
      backgroundColor: const Color(0xfff3e3fb),
      body: Container(
        child: Column(
          children: [
            Scrollbar(
              thumbVisibility: true,
              thickness: 10, //width of scrollbar
              radius: Radius.circular(20), //corner radius of scrollbar
              child: SingleChildScrollView(
                child:  SizedBox(
                  height: 650,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (widget.acceptStatus == false) {
                        return ListTile(
                          tileColor: Colors.white,
                          title: Text(user.name),
                          subtitle: Text("Student"),
                          leading: CircleAvatar(backgroundImage: NetworkImage(user.imagePath)),
                          trailing: Wrap(
                            children: [
                            OutlinedButton(
                              onPressed: () {
                                customToast("It's a Match!", context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Mentor_Page(acceptStatus: true);
                                    },
                                  ),
                                );
                              },
                              child: Text("Accept")),
                            OutlinedButton(
                              onPressed: () {
                              },
                              child: Text("Decline")),
                            ],
                          )
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
