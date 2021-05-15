final String usuarioTable = "usuarioTable";
final String idCol = "idCol";
final String nomeCol = "nomeCol";
final String cpfCol = "cpfCol";

class Usuario {
  int id;
  String cpf;
  String nome;

  Usuario(this.id, this.nome, this.cpf);

  Map toMap() {
    Map<String, dynamic> map = {cpfCol: cpf, nomeCol: nome};
    if (id != null) {
      map[idCol] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Usuario => (Id: $id, Nome: $nome, CPF: $cpf)";
  }

  Usuario.fronMap(Map<String, dynamic> map) {
    id = map[idCol];
    nome = map[nomeCol];
    cpf = map[cpfCol];
  }
}
