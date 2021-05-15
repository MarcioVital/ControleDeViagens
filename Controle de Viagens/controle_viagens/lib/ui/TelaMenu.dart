import 'package:controle_viagens/ui/HomePage.dart';
import 'package:controle_viagens/ui/TelaAdtViagem.dart';

import 'package:controle_viagens/ui/TelaCadDesembarque.dart';
import 'package:controle_viagens/ui/TelaCadEmbarque.dart';
import 'package:controle_viagens/ui/TelaContatos.dart';
import 'package:controle_viagens/ui/TelaListaAbastecimento.dart';
import 'package:flutter/material.dart';

class TelaMenu extends StatefulWidget {
  @override
  _TelaMenuState createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/tela_base.jpg",
            fit: BoxFit.cover,
            height: 1400,
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
            padding: EdgeInsets.only(top: 180, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bem Vindo,",
                  style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Text("Nome do Usuário",
                    style: TextStyle(
                        color: Colors.amber[600],
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(top: 270, left: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            builder: (context) => TelaListaAbastecimento()),
                      );
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text("   > Abastecimento           ",
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
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaCadEmbarque()));
                    },
                    color: Colors.indigo[900],
                    textColor: Colors.white,
                    child: Text("   > Embarque                    ",
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
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaCadDesembarque()));
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text("   > Desembarque             ",
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
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaAdtViagem()));
                    },
                    color: Colors.indigo[900],
                    textColor: Colors.white,
                    child: Text("   > Adt. para Viagem       ",
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
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaContatos()));
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text("   > Contatos                      ",
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
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    color: Colors.indigo[900],
                    textColor: Colors.white,
                    child: Text("   << Sair                             ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
