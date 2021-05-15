import 'package:controle_viagens/ui/TelaCadastro.dart';
import 'package:flutter/material.dart';
import 'package:controle_viagens/ui/TelaLogin.dart';

import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset("images/tela_base_inicio.jpg",
              fit: BoxFit.cover, height: 1500),
          Padding(
              padding: EdgeInsets.only(
            top: 100,
          )),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Column(
              children: [
                Image.asset(
                  "images/logo_branco.jpg",
                  width: 240,
                  height: 230,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 220, left: 50),
            child: Column(
              children: [
                Image.asset(
                  "images/logo_empresa.jpeg",
                  width: 300,
                  height: 300,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 530, left: 20),
            child: Column(
              children: [
                ButtonTheme(
                  height: 60,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TelaLogin()));
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text("   > Entrar                           ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                Divider(color: Colors.transparent),
                ButtonTheme(
                  height: 60,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaCadastro()));
                    },
                    color: Colors.redAccent[700],
                    textColor: Colors.white,
                    child: Text("  + Registrar                      ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
