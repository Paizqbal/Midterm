import 'package:flutter/material.dart';
import 'package:homestayraya1/view/MyScreen/loginscreen.dart';
import '../../../../model/user.dart';
// import 'package:homestayraya1/view/MyScreen/splashscreen.dart';
import '../MyScreen/mainscreen.dart';
import '../MyScreen/sellerscreen.dart';

class MainMenuWidget extends StatefulWidget {
  final User user;
  const MainMenuWidget({super.key, required this.user});

  @override
  State<MainMenuWidget> createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      elevation: 10,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text(widget.user.email.toString()),
            accountName: Text(widget.user.name.toString()),
            currentAccountPicture: const CircleAvatar(
              radius: 30.0,
            ),
          ),
          ListTile(
            title: const Text('Buyer Homepage'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => MainScreen(user: widget.user)));
            },
          ),
          // ListTile(
          //   title: const Text('Login / Register'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (content) => const LoginScreen()));
          //   },
          // ),
          ListTile(
            title: const Text('Seller'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (content) => SellerScreen(
                            user: widget.user,
                          )));
            },
          ),
        ],
      ),
    );
  }
}
