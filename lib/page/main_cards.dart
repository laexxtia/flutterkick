import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/page/past_matches.dart';
import 'package:flutter_project/page/profile_screen.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import '../model/mentor_user.dart';
import 'card_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'curr_user_profile_screen.dart';


class MainPage extends StatefulWidget {

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<String> namesList = [];

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namesList = prefs.getStringList('passedNames')!;
    });
  }

  clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  setData(User user) async {
    String newJson = jsonEncode(user);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namesList.add(newJson);
      prefs.setStringList("passedNames", namesList);
    });
  }

  setEmptyData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namesList = [];
    setState(() {
      prefs.setStringList("passedNames", namesList);
    });
  }



  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xfff3e3fb),
            Colors.black,
          ]
      ),
    ),
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("MENTORME"),
        leading: buildLogo(),
        actions: [
          profileLogo(),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: Column(
            children:[
              const SizedBox(height: 16),
              Expanded(child: buildCards()),
              const SizedBox(height: 16),
              buildButtons(),
            ],
          ),
        ),
      ),
    ),
  );

  Widget buildLogo() => IconButton(
    icon: Icon(Icons.message, size: 30),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListViewHome(clearData: () {
          clearData();
        }, setData: () {
          setEmptyData();
        },)),
      );
    },
  );

  Widget profileLogo() => IconButton(
    icon: Icon(Icons.account_circle, size: 30),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CurrProfileScreen()),
      );
    },
  );

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
        duration: Duration(seconds: 1),
        context: context);
  }

  Widget buildButtons() {
    final provider = Provider.of<CardProvider>(context);
    final userDetails = provider.userDetails;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          child: Icon(Icons.clear, color: Colors.red, size: 32),
          onPressed: () {
            final provider = Provider.of<CardProvider>(context, listen: false);
            provider.dislike();
            customToast("DISLIKE", context);
          },
        ),
        ElevatedButton(
          child: Icon(Icons.star, color: Colors.blue, size: 32),
          onPressed: () {
            final provider = Provider.of<CardProvider>(context, listen: false);
            for(var i = 0; i < userDetails.length; i++) {
              if (i == userDetails.length - 1) {
                setData(userDetails[i]);
                provider.superLike();
                customToast("SUPER\nLIKE", context);
              }
            }
          },
        ),
        ElevatedButton(
          child: Icon(Icons.favorite, color: Colors.teal, size: 32),
          onPressed: () {
            final provider = Provider.of<CardProvider>(context, listen: false);
            for(var i = 0; i < userDetails.length; i++) {
              if (i == userDetails.length - 1) {
                setData(userDetails[i]);
                provider.like();
                customToast("LIKE", context);
              }
            }
          },
        ),
      ],
    );
  }

  Widget buildCards() {
    final provider = Provider.of<CardProvider>(context);
    final userDetails = provider.userDetails;

    return userDetails.isEmpty
        ? Center(
        child: ElevatedButton(
          child: const Text('Restart', style: TextStyle(
            color: Colors.black,
          )),
          onPressed: () {
            final provider = Provider.of<CardProvider>(context, listen: false);

            provider.resetUsers();
          },
        ))

        : Stack(
      children: userDetails
          .map((user) =>
          MentorCard(
            id: user.id.toString(),
            name: user.name.toString(),
            position: user.position.toString(),
            status: user.status.toString(),
            urlImage: user.profilePic.toString(),
            gender: user.gender.toString(),
            isFront: userDetails.last == user,
            setData: setData,
            namesList: [],
          ))
          .toList(),
    );
  }
}

class MentorCard extends StatefulWidget {
  final String id;
  final String urlImage;
  final String name;
  final String gender;
  final String position;
  final String status;
  final bool isFront;
  final Function(User user) setData;
  final List<String> namesList;
  const MentorCard({
    Key? key,
    required this.id,
    required this.urlImage,
    required this.name,
    required this.gender,
    required this.position,
    required this.status,
    required this.isFront,
    required this.setData,
    required this.namesList,
  }) : super(key: key);

  @override
  State<MentorCard> createState() => _MentorCardState(namesList);
}

class _MentorCardState extends State<MentorCard> {

  List<String> namesList = [];

  _MentorCardState(namesList);

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

  Widget buildFrontCard() {
    final provider = Provider.of<CardProvider>(context);
    final userDetails = provider.userDetails;

    return GestureDetector(
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
            child: Stack(
              children: [
                buildCard(),
                buildStamps(),
              ],
            ),
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
      onPanEnd: (details) async {
        final provider = Provider.of<CardProvider>(context, listen: false);
        if (provider.endPosition(context)) {
          for (var i = 0; i < userDetails.length; i++) {
            if (i == userDetails.length - 1) {
              widget.setData(userDetails[i]);
            }
          }
        }
      },
    );
  }

  Widget buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.urlImage.toString()),
            fit: BoxFit.cover,
            alignment: Alignment(-0.3, 0),
          ),
        ),
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.7, 1],
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Spacer(),
                    buildName(),
                    const SizedBox(height: 8),
                    buildStatus(),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
  Widget buildName() => Row(
    children: [
      Text(
        '${widget.name.toString()} -',
        style: const TextStyle(
          fontSize: 32,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(width: 16),
      Text(
          '${widget.position.toString()}',
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ],
    );

  Widget buildStatus() => Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              width: 12,
              height: 12,
            ),
            const SizedBox(width: 8),
            const Text (
              "Recently Active",
              style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          );

  Widget buildStamps() {
    final provider = Provider.of<CardProvider>(context);
    final status = provider.getStatus();
    final opacity = provider.getStatusOpacity();

    switch (status) {
      case CardStatus.like:
        final child = buildStamp(
            angle: -0.5,
            color: Colors.green,
            text: "YES",
            opacity: opacity,
          );
        return Positioned(top: 64, left: 50, child: child);

      case CardStatus.dislike:
        final child = buildStamp(
            angle: 0.5,
            color: Colors.red,
            text: "NOPE",
            opacity: opacity,
          );
        return Positioned(top: 64, right: 50, child: child);

      case CardStatus.superLike:
        final child = buildStamp(
            color: Colors.blue,
            text: "SUPER\nLIKE",
            opacity: opacity,
          );
        return Positioned(bottom: 128, right: 0, left: 0, child: child);
      default:
        return Container();
    }
  }

  Widget buildStamp({
    double angle = 0,
    required Color color,
    required String text,
    required double opacity,
  }) {
    return Opacity(
      opacity: opacity,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color, width: 4),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
