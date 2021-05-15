import 'package:flutter/material.dart';
import 'TelaMenu.dart';

class TelaAdtViagem extends StatefulWidget {
  @override
  _TelaAdtViagemState createState() => _TelaAdtViagemState();
}

class _TelaAdtViagemState extends State<TelaAdtViagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "\$ Adiantamento em Reais\$",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Valor Recebido",
                        hintText: "Valor em Reais",
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Colors.indigo[900], fontSize: 15),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Recibo",
                          hintText: "Número do Recibo ",
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                              color: Colors.indigo[900], fontSize: 15),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.transparent),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Localidade",
                        hintText: "Onde Recebeu?",
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Colors.indigo[900], fontSize: 15),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ButtonTheme(
                        height: 60,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {},
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          child: Text(
                            "Câmera",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.indigo[100],
                    child: Padding(
                      padding: EdgeInsets.all(150),
                      child: Text(
                        "Onde Ficará a foto",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                            child: Text("        Salvar        ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ButtonTheme(
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
                              child: Text("      Cancelar      ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
