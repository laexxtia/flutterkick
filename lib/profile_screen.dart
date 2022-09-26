import 'package:flutter/material.dart';

import 'calendar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Profile"),
        actions: [
          calendarLogo(),
        ],
      ),
      backgroundColor: const Color(0xff3a4738),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    margin: const EdgeInsets.only(
                      top: 100,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(70),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          // blurRadius: 10,
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1600",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text(
                    "Nicole",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "Senior Software Engineer, Mentor",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 24,
                  right: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                child: Scrollbar(
                  thumbVisibility: true, //always show scrollbar
                  thickness: 10, //width of scrollbar
                  radius: Radius.circular(20), //corner radius of scrollbar
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "PROFILE",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        listProfile(Icons.person, "Full Name", "Nicole Lee"),
                        listProfile(Icons.domain, "Company", "Google"),
                        listProfile(Icons.female, "Gender", "Female"),
                        listProfile(Icons.phone, "About",
                            "Being a software engineer with 6 \nyears of extensive experience, "
                                "I want \nto reach out to help incoming batches \nof aspiring "
                                "software engineers to pursue \ntheir passions."),
                        listProfile(Icons.edit_note_rounded, "Experiences",
                            "- Worked with... \n -Had..."),
                        listProfile(Icons.group, "LinkedIn", "www.linkedin.com/in/nicole-lee/"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget calendarLogo() => IconButton(
    icon: Icon(Icons.calendar_month, size: 30),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Calendar()),
      );
    },
  );

  Widget listProfile(IconData icon, String text1, String text2) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(width: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }}
