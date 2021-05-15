import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:controle_viagens/ui/TelaMenu.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/tela_base_inicio.jpg",
            fit: BoxFit.cover,
            height: 1450,
            width: 2000,
          ),
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
            padding: EdgeInsets.only(top: 300),
            child: Container(
              color: Colors.red,
              width: 450,
              height: 300,
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 70, right: 70),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LOGIN:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Divider(color: Colors.transparent),
                      Padding(
                        padding: EdgeInsets.only(right: 22),
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Digite seu CPF",
                            labelStyle: TextStyle(color: Colors.indigo[800]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: TextStyle(color: Colors.indigo[900]),
                          keyboardType: TextInputType.numberWithOptions(),
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
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TelaMenu()));
                          },
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          child: Text("   > Entrar                           ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
