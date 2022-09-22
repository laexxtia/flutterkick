import 'package:flutter/material.dart';
import 'card_provider.dart';
import 'package:provider/provider.dart';
import 'main_cards.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Mentor App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider (
    create: (context) => CardProvider(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: MainPage(),
    ),
  );
}



