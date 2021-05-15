final String abastecimentoTable = "abastecimentoTable";
final String idCol = "idCol";
final String nomePostoCol = "nomePostoCol";
final String cidadeCol = "cidadeCol";
final String dataAbtCol = "dataAbtCol";
final String horarioAbtCol = "horarioAbtCol";
final String odometroAbtCol = "odometroAbtCol";
final String qntCombusCol = "qntCombusCol";

class Abastecimento {
  int id;
  String nomePostoAbt;
  String cidadeAbt;
  String dataAbt;
  String horarioAbt;
  String odometroAtual;
  String qntCombus;

  Abastecimento();

  Abastecimento.fromMap(Map map) {
    id = map[idCol];
    nomePostoAbt = map[nomePostoCol];
    cidadeAbt = map[cidadeCol];
    dataAbt = map[dataAbtCol];
    horarioAbt = map[horarioAbtCol];
    odometroAtual = map[odometroAbtCol];
    qntCombus = map[qntCombusCol];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nomePostoCol: nomePostoAbt,
      cidadeCol: cidadeAbt,
      dataAbtCol: dataAbt,
      horarioAbtCol: horarioAbt,
      odometroAbtCol: odometroAtual,
      qntCombusCol: qntCombus
    };
    return map;
  }

  @override
  String toString() {
    return "Abastecimento Info: id: $id, Nome do Posto: $nomePostoAbt, Nome da Cidade: $cidadeAbt, Data do Abastecimento: $dataAbt, Horário do Abastecimento: $horarioAbt, Odometro: $odometroAtual, Quantindade de Combustível: $qntCombus ";
  }
}
