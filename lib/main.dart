import 'dart:math';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'card_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Mentor App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider (
    create: (context) => CardProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: MainPage(),
    ),
  );
}


class MentorCard extends StatefulWidget {
  final String urlImage;
  final bool isFront;
  const MentorCard({
    Key? key,
    required this.urlImage,
    required this.isFront,
  }) : super(key: key);

  @override
  State<MentorCard> createState() => _MentorCardState();
}

class _MentorCardState extends State<MentorCard> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: widget.isFront ? buildFrontCard() : buildCard(),
  );

  Widget buildFrontCard() => GestureDetector(
    child: LayoutBuilder(
      builder: (context, constraints) {
        final provider = Provider.of<CardProvider>(context);
        final position = provider.position;
        final milliseconds = provider.isDragging ? 0 : 400;

        final center = constraints.smallest.center(Offset.zero);
        final angle = provider.angle * pi / 180;
        final rotatedMatrix = Matrix4.identity()
          ..translate(center.dx, center.dy)
          ..rotateZ(angle)
          ..translate(-center.dx, -center.dy);

        return AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: milliseconds),
          transform: rotatedMatrix..translate(position.dx, position.dy),
          child: buildCard(),
        );
      },
    ),
    onPanStart: (details) {
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.startPosition(details);
    },
    onPanUpdate: (details) {
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.updatePosition(details);
    },
    onPanEnd: (details) {
      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.endPosition();
    },
  );

  Widget buildCard() => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(widget.urlImage),
        fit: BoxFit.cover,
      ),
    ),
  ),
  );
}


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: buildCards(),
      ),
    ),
  );

  Widget buildCards() {
    final provider = Provider.of<CardProvider>(context);
    final urlImages = provider.urlImages;

    return urlImages.isEmpty
      ? Center(
          child: ElevatedButton(
          child: Text('Restart'),
          onPressed: () {
            final provider = Provider.of<CardProvider>(context, listen: false);

            provider.resetUsers();
          },
          ))

      : Stack(
          children: urlImages
              .map((urlImage) => MentorCard(
                    urlImage: urlImage,
                    isFront: urlImages.last == urlImage,
                ))
              .toList(),
        );
  }
  
}



