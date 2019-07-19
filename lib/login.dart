import 'package:flutter/material.dart';
import 'package:pokemon_dex/pokemon-list.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final getEmailText = TextEditingController();
  final getPasswordText = TextEditingController();
  bool isCredentialsRight = false;

  @override
  void dispose() {
    getEmailText.dispose();
    getPasswordText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: getEmailText,
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );

    final password = TextField(
      controller: getPasswordText,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: Colors.red,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () => shouldLogin(getEmailText.text, getPasswordText.text),
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final warningMessage = Visibility(
      visible: isCredentialsRight,
      child: Text(
        'Email or Password are wrong',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );

    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: EdgeInsets.all(36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pokémon_logo.svg/640px-International_Pokémon_logo.svg.png'),
                    ),
                    emailField,
                    password,
                    warningMessage,
                    loginButton,
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  shouldLogin(String email, String password) {
    if (email == 'mestrepokemon@poke.com' && password == 'pokemon') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PokeList()));
    } else {
      setState(() {
        isCredentialsRight = true;
      });
    }
  }
}
