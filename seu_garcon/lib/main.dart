import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:seu_garcon/home/home.dart';
import 'package:seu_garcon/login/UserGmail.dart';
import 'package:seu_garcon/login/sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login/sign_in.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Login> {
  String _information = "Informe os dados";

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void _resetFields() {
    setState(() {
      userController.text = "";
      passController.text = "";
    });
  }

  void _calcImc() {
    setState(() {
      double wheigh = double.parse(userController.text.toString());
      double heigh = double.parse(userController.text.toString()) / 100;
      debugPrint(heigh.toString());
      double result = wheigh / (heigh * heigh);
      debugPrint(result.toStringAsPrecision(4));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seu moço"),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(40.0),
                child: Icon(Icons.person_outline,
                    size: 120.0, color: Colors.green)),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: userController,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Usuário",
                    labelStyle: TextStyle(color: Colors.green, fontSize: 18.0)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: passController,
                keyboardType: TextInputType.visiblePassword,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.green, fontSize: 18.0)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
                color: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: GoogleSignInButton(onPressed: () {
                signInWithGoogle().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        UserGmail userGmail = new UserGmail();
                        debugPrint(userGmail.hashCode.toString());
                      },
                    ),
                  );
                });
              }),
            )
          ],
        ),
      ),
    );
  }
}
