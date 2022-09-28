import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListViewHome extends StatefulWidget {
  const ListViewHome({Key? key}) : super(key: key);

  @override
  State<ListViewHome> createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  List<String>? passedNames;

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      passedNames = prefs.getStringList('passedNames');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade200,
          title: Text("Matches"),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: passedNames?.length,
          itemBuilder: (BuildContext context, int index) {
            if (passedNames != null) {
              return Text(passedNames![index]);
            }
          },
          // children: <Widget>[
          //   ListTile(
          //       title: Text(passedNames.toString()),
          //       subtitle: Text("The battery is full."),
          //       leading: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
          //       trailing: Icon(Icons.star)),
          //   ListTile( title: Text("Anchor"),subtitle: Text("Lower the anchor."), leading: CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.star)),
          //   ListTile( title: Text("Alarm"),subtitle: Text("This is the time."), leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.star)),
          //   ListTile( title: Text("Ballot"),subtitle: Text("Cast your vote."), leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.star))
          // ],
        // ),
        ),
      ),
    );
  }
}
