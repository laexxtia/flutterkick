import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/mentor_user.dart';

class ListViewHome extends StatefulWidget {
  final Function() clearData;
  final Function() setData;
  const ListViewHome({Key? key, required this.clearData, required this.setData}) : super(key: key);

  @override
  State<ListViewHome> createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  List<String> passedNames = [];

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      passedNames = prefs.getStringList('passedNames')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("Matches"),
        ),
        backgroundColor: const Color(0xfff3e3fb),
        body: Container (
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
                      itemCount: passedNames?.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (passedNames != null) {
                          Map<String,dynamic> jsonDetails = jsonDecode(passedNames[index]);
                          User user = User.fromJson(jsonDetails);
                          if (user.status.toString() == "Not accepted") {
                            return ListTile(
                                tileColor: Colors.white,
                                title: Text(user.name.toString()),
                                subtitle: Text(user.industry.toString()),
                                leading: CircleAvatar(backgroundImage: NetworkImage(user.profilePic.toString())),
                                trailing: Text("Sent"));
                          }
                        }
                        return Text("");
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  widget.clearData();
                  widget.setData();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, elevation: 0),
                child: Text(
                  "Clear".toUpperCase(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
