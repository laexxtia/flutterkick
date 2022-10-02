import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import '../../mentormentee.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerEmail = TextEditingController(text: "john.doe@gmail.com");
    final TextEditingController _controllerPwd = TextEditingController(text: "********");

    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            controller: _controllerEmail,
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: _controllerPwd,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
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
              child: Text(
                "Login".toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
