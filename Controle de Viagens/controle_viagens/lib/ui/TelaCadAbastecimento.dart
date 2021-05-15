import 'package:controle_viagens/models/abastecimento.dart';

import 'package:flutter/material.dart';

class TelaCadAbastecimento extends StatefulWidget {
  final Abastecimento abastecimento;
  TelaCadAbastecimento({this.abastecimento});

  @override
  _TelaCadAbastecimentoState createState() => _TelaCadAbastecimentoState();
}

class _TelaCadAbastecimentoState extends State<TelaCadAbastecimento> {
  final _controlPosto = TextEditingController();
  final _controlCidade = TextEditingController();
  final _controlData = TextEditingController();
  final _controlHorario = TextEditingController();
  final _controlOdometros = TextEditingController();
  final _controlLitros = TextEditingController();

  //String nomePosto, cidade, data, horario, kilometros, litros;

  final _nomePostoFocus = FocusNode();

  bool dadosAbastEditato = false;

  void limpaCampos() {
    setState(() {
      _controlPosto.text = "";
      _controlCidade.text = "";
      _controlData.text = "";
      _controlHorario.text = "";
      _controlOdometros.text = "";
      _controlLitros.text = "";
    });
  }

  Abastecimento _abastecimentoEditado;

  @override
  void initState() {
    super.initState();

    if (widget.abastecimento == null) {
      _abastecimentoEditado = Abastecimento();
    } else {
      _abastecimentoEditado =
          Abastecimento.fromMap(widget.abastecimento.toMap());

      _controlPosto.text = _abastecimentoEditado.nomePostoAbt;
      _controlCidade.text = _abastecimentoEditado.cidadeAbt;
      _controlData.text = _abastecimentoEditado.dataAbt;
      _controlHorario.text = _abastecimentoEditado.horarioAbt;
      _controlOdometros.text = _abastecimentoEditado.odometroAtual;
      _controlLitros.text = _abastecimentoEditado.qntCombus;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text("Descrições do Abastecimento",
              style: TextStyle(color: Colors.white, fontSize: 18)),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.refresh_outlined,
                size: 35,
              ),
              color: Colors.blueAccent,
              onPressed: limpaCampos,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _controlPosto,
                  focusNode: _nomePostoFocus,
                  onChanged: (text) {
                    dadosAbastEditato = true;
                    _abastecimentoEditado.nomePostoAbt = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome do Posto",
                    hintText: "Qual Posto você Abasteceu?",
                  ),
                  style: TextStyle(color: Colors.indigo[700], fontSize: 20),
                ),
                Divider(),
                TextField(
                  controller: _controlCidade,
                  onChanged: (text) {
                    dadosAbastEditato = true;
                    _abastecimentoEditado.cidadeAbt = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Cidade",
                      hintText: "Qual Cidade foi?"),
                  style: TextStyle(color: Colors.indigo[700], fontSize: 20),
                ),
                Divider(color: Colors.transparent),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: TextField(
                          controller: _controlData,
                          onChanged: (text) {
                            dadosAbastEditato = true;
                            _abastecimentoEditado.dataAbt = text;
                          },
                          decoration: InputDecoration(
                            labelText: "Data",
                            hintText: "Ex. 01/01/2020",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Colors.indigo[900], fontSize: 20),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(),
                        child: TextField(
                          controller: _controlHorario,
                          onChanged: (text) {
                            dadosAbastEditato = true;
                            _abastecimentoEditado.horarioAbt = text;
                          },
                          decoration: InputDecoration(
                            labelText: "Horário",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Colors.indigo[900], fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.transparent,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: TextField(
                          controller: _controlOdometros,
                          onChanged: (text) {
                            dadosAbastEditato = true;
                            _abastecimentoEditado.odometroAtual = text;
                          },
                          decoration: InputDecoration(
                            labelText: "Odometro (Km)",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Colors.indigo[900], fontSize: 20),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(),
                        child: TextField(
                          controller: _controlLitros,
                          onChanged: (text) {
                            dadosAbastEditato = true;
                            _abastecimentoEditado.qntCombus = text;
                          },
                          decoration: InputDecoration(
                            labelText: "Qnt. Litros",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Colors.indigo[900], fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 315),
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
                            if (_abastecimentoEditado.nomePostoAbt != null &&
                                _abastecimentoEditado.nomePostoAbt.isNotEmpty) {
                              Navigator.pop(context, _abastecimentoEditado);
                            } else {
                              FocusScope.of(context)
                                  .requestFocus(_nomePostoFocus);
                            }
                          },
                          color: Colors.indigo[900],
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
                              Navigator.pop(context);
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
      ),
    );
  }
}
