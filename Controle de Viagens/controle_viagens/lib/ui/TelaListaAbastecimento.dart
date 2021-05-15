import 'package:controle_viagens/helpers/database_abastecimento.dart';
import 'package:controle_viagens/models/abastecimento.dart';
import 'package:controle_viagens/ui/TelaCadAbastecimento.dart';
import 'package:flutter/material.dart';

class TelaListaAbastecimento extends StatefulWidget {
  @override
  _TelaListaAbastecimentoState createState() => _TelaListaAbastecimentoState();
}

class _TelaListaAbastecimentoState extends State<TelaListaAbastecimento> {
  DatabaseAbastecimento helper = DatabaseAbastecimento();

  List<Abastecimento> abastecimentos = List();

  @override
  void initState() {
    super.initState();

    _getAllAbastecimentos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Abastecimentos"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          _showAbastecimento();
        },
      ),
      body: Stack(
        children: [
          Image.asset(
            "images/tela_base.jpg",
            fit: BoxFit.cover,
            height: 1400,
            width: 500,
          ),
          ListView.builder(
            itemCount: abastecimentos.length,
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return _abastecimentoCard(context, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _abastecimentoCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset("images/combustivel.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      abastecimentos[index].nomePostoAbt ?? "",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      abastecimentos[index].cidadeAbt ?? "Qual Cidade?",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      abastecimentos[index].dataAbt ?? "Sem Data!!!",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _showAbastecimento(abastecimento: abastecimentos[index]);
                    },
                    child: Text(
                      "Editar",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                  Divider(),
                  FlatButton(
                    onPressed: () {
                      Widget cancelaButton = FlatButton(
                        child: Text("Cancelar"),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      );
                      Widget continuaButton = FlatButton(
                        child: Text("Sim"),
                        onPressed: () {
                          helper.deleteAbastecimento(abastecimentos[index].id);
                          setState(() {
                            abastecimentos.removeAt(index);
                            Navigator.pop(context);
                          });
                          Navigator.pop(context);
                        },
                      );
                      //configura o AlertDialog
                      AlertDialog alert = AlertDialog(
                        title: Text("Tem Certeza?"),
                        content: Text("Você perderá os dados após excluir!"),
                        actions: [
                          cancelaButton,
                          continuaButton,
                        ],
                      );
                      //exibe o diálogo
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    child: Text(
                      "Excluir",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showAbastecimento({Abastecimento abastecimento}) async {
    final recAbastecimento = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaCadAbastecimento(
          abastecimento: abastecimento,
        ),
      ),
    );
    if (recAbastecimento != null) {
      if (abastecimento != null) {
        await helper.updateAbastecimento(recAbastecimento);
        _getAllAbastecimentos();
      } else {
        await helper.saveAbastecimento(recAbastecimento);
      }
      _getAllAbastecimentos();
    }
  }

  showAlertDialog(BuildContext context) {
    Widget cancelaButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {},
    );
    Widget continuaButton = FlatButton(
      child: Text("Sim"),
      onPressed: () {},
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Deseja continuar aprendendo Flutter ?"),
      actions: [
        cancelaButton,
        continuaButton,
      ],
    );
    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _getAllAbastecimentos() {
    helper.getAllAbastecimentos().then((list) {
      setState(() {
        abastecimentos = list;
      });
    });
  }
}
