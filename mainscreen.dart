import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../model/user.dart';
import 'package:homestayraya1/view/shared/mainmenu.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({super.key, required this.user});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('HOMESTAY RAYA'),
            actions: [
              IconButton(onPressed: _logout, icon: const Icon(Icons.logout))
            ],
          ),
          drawer: MainMenuWidget(user: widget.user),
          body: Center(),
        ));
  }

  User user = User(
      id: "0",
      email: "unregistered",
      name: "unregistered",
      phone: "0123456789");

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Log out?",
            style: TextStyle(),
          ),
          content: const Text("Are you sure?", style: TextStyle()),
          actions: <Widget>[
            TextButton(
                onPressed: _yesButton,
                child: const Text(
                  "Yes",
                  style: TextStyle(),
                )),
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _yesButton() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (content) => MainScreen(
                  user: user,
                )));
    Fluttertoast.showToast(
        msg: "Logout Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 14.0);
  }
}
