import 'const/images_path.dart';
import 'package:flutter/material.dart';

import 'const/colors.dart';
import 'entity/person_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryDark),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PersonChat> personChats = [];

  void fillPersonChats() {
    personChats = [
      PersonChat(
          name: "Jono",
          message: "Woi malem mabar kuyy",
          time: "Fri",
          totalUnread: 0,
          image: '${personImgPathPrefix}person_two.png'),
      PersonChat(
          name: "Jono",
          message: "Woi malem mabar kuyy",
          time: "Fri",
          totalUnread: 1,
          image: '${personImgPathPrefix}person.png'),
      PersonChat(
          name: "Jono",
          message: "Woi malem mabar kuyy",
          time: "Fri",
          totalUnread: 1,
          image: '${personImgPathPrefix}person_three.png'),
      PersonChat(
          name: "Jono",
          message: "Woi malem mabar kuyy",
          time: "Fri",
          totalUnread: 2,
          image: '${personImgPathPrefix}person_two.png'),
      PersonChat(
          name: "Jono",
          message: "Woi malem mabar kuyy",
          time: "Fri",
          totalUnread: 3,
          image: '${personImgPathPrefix}person_two.png'),
      PersonChat(
          name: "Jono",
          message: "Woi malem mabar kuyy",
          time: "Fri",
          totalUnread: 1,
          image: '${personImgPathPrefix}person_two.png'),
      PersonChat(
          name: "Jono",
          message: "Woi Gass",
          time: "Fri",
          totalUnread: 1,
          image: '${personImgPathPrefix}person_two.png'),
      PersonChat(
          name: "Jono",
          message: "Woi malem mabar kuyy",
          time: "Fri",
          totalUnread: 1,
          image: '${personImgPathPrefix}person_two.png'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDark,
      appBar: AppBar(
        backgroundColor: darkAccent,
        title: const Text(
          'Messaging',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: buildBody(),
      floatingActionButton: buildFab(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: buildPersonList(),
      ),
    );
  }

  Widget buildPersonList() {
    fillPersonChats();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: personChats
          .map((personChat) => buildPersonChatItem(personChat))
          .toList(),
    );
  }

  Widget buildPersonChatItem(PersonChat personChat) {
    return ListTile(
      title: Text(
        personChat.name,
      ),
      titleTextStyle: const TextStyle(color: Colors.white),
      subtitle: Text(personChat.message),
      subtitleTextStyle: TextStyle(
          color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w500),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            personChat.time,
            style: const TextStyle(
                color: lightBGHome, fontWeight: FontWeight.w300),
          ),
          buildUnreadChat(personChat.totalUnread)
        ],
      ),
      leading: Image.asset(personChat.image),
    );
  }

  Widget buildUnreadChat(int unreadChatSize) {
    return Visibility(
      visible: unreadChatSize > 0,
      maintainState: true,
      maintainAnimation: true,
      maintainSize: true,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: lightThemeBlue,
        ),
        padding: const EdgeInsets.all(6),
        child: Text(
          unreadChatSize.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 9),
        ),
      ),
    );
  }

  Widget buildFab() {
    return FloatingActionButton(
      onPressed: () {},
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
