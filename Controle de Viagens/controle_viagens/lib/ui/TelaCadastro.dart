import 'package:controle_viagens/models/usuario.dart';
import 'package:controle_viagens/ui/TelaLogin.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  final Usuario usuario;
  TelaCadastro({this.usuario});

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _nomeFocus = FocusNode();

  Usuario _editaUsuario;

  @override
  void initState() {
    super.initState();
    if (widget.usuario == null) {
      _editaUsuario = Usuario(0, '', '');
    } else {
      _editaUsuario = Usuario.fronMap(widget.usuario.toMap());

      _nomeController.text = _editaUsuario.nome;
      _cpfController.text = _editaUsuario.cpf;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/tela_base_inicio.jpg",
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
            padding: EdgeInsets.only(top: 300),
            child: Container(
              color: Colors.red,
              width: 450,
              height: 350,
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 70, right: 70),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cadastre-se",
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
                          controller: _nomeController,
                          onChanged: (text) {},
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Nome Completo",
                            labelStyle: TextStyle(color: Colors.indigo[300]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: TextStyle(color: Colors.indigo[900]),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Divider(color: Colors.transparent),
                      Padding(
                        padding: EdgeInsets.only(right: 22),
                        child: TextField(
                          controller: _cpfController,
                          onChanged: (text) {},
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Digite seu CPF",
                            labelStyle: TextStyle(color: Colors.indigo[300]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: TextStyle(color: Colors.indigo[900]),
                          keyboardType: TextInputType.number,
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
                            if (_editaUsuario.nome != null &&
                                _editaUsuario.nome.isNotEmpty) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaLogin()));
                            } else {
                              _exibeAviso();
                              FocusScope.of(context).requestFocus(_nomeFocus);
                            }
                          },
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          child: Text("   + Registrar                      ",
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

  void _exibeAviso() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Nome"),
          content: new Text("Informe o nome do Usuario"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
