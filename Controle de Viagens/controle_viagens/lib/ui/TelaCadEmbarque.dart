import 'package:flutter/material.dart';
import 'TelaMenu.dart';

class TelaCadEmbarque extends StatefulWidget {
  @override
  _TelaCadEmbarqueState createState() => _TelaCadEmbarqueState();
}

class _TelaCadEmbarqueState extends State<TelaCadEmbarque> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Row(
          children: [
            Text(
              "                Embarque                     ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.import_export,
              color: Colors.indigo[900],
              size: 35,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Local de Origem",
                  hintText: "Local que saiu a Carga",
                  border: OutlineInputBorder(),
                  labelStyle:
                      TextStyle(color: Colors.indigo[900], fontSize: 15),
                ),
              ),
              Divider(color: Colors.transparent),
              TextField(
                decoration: InputDecoration(
                  labelText: "Cidade de Origem",
                  hintText: "Cidade que saiu a Carga",
                  border: OutlineInputBorder(),
                  labelStyle:
                      TextStyle(color: Colors.indigo[900], fontSize: 15),
                ),
              ),
              Divider(color: Colors.transparent),
              TextField(
                decoration: InputDecoration(
                  labelText: "Local de Destino",
                  hintText: "Local onde a Carga está chegando",
                  border: OutlineInputBorder(),
                  labelStyle:
                      TextStyle(color: Colors.indigo[900], fontSize: 15),
                ),
              ),
              Divider(color: Colors.transparent),
              TextField(
                decoration: InputDecoration(
                  labelText: "Cidade de Destino",
                  hintText: "Cidade do descarregamento",
                  border: OutlineInputBorder(),
                  labelStyle:
                      TextStyle(color: Colors.indigo[900], fontSize: 15),
                ),
              ),
              Divider(color: Colors.transparent),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Km do Veículo",
                        hintText: "Km atual ",
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Colors.indigo[900], fontSize: 15),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Peso",
                          hintText: "Peso em Kg",
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                              color: Colors.indigo[900], fontSize: 15),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Tipo da Carga",
                        hintText: "Ex: A Granel...",
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Colors.indigo[900], fontSize: 15),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.transparent),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "CTE",
                          hintText: "Número do CTE",
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                              color: Colors.indigo[900], fontSize: 15),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Nota Fiscal",
                        hintText: "Número da NF",
                        border: OutlineInputBorder(),
                        labelStyle:
                            TextStyle(color: Colors.indigo[900], fontSize: 15),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(top: 170),
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
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
