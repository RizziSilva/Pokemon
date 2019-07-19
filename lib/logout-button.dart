import 'package:flutter/material.dart';
import 'package:pokemon_dex/login.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Icon(Icons.exit_to_app),
      color: Colors.red,
      onPressed: () => {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()))},
    );
  }
}