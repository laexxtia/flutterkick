import 'package:flutter/material.dart';
import 'card_provider.dart';
import 'package:provider/provider.dart';
import 'main_cards.dart';
import 'profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Mentor App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider (
    create: (context) => CardProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.pink,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            backgroundColor: Colors.white,
            shape: CircleBorder(),
            minimumSize: Size.square(70),
          ),
        ),
      ),
      home: MainPage(),
    ),
  );
}



