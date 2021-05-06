class Client {
  int id;
  String name;
  String cpf;

  Client(this.name, this.cpf);

  Client.fromMap(Map map) {
    id = map['id_column'];
    name = map['name_column'];
    cpf = map['cpf_column'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'name_column': name,
      'cpf_column': cpf
    };

    if(id != null) {
      map['id_column'] = id;
    }
    return map;
  }

  @override
  String toString() => 'Client(id: $id, name: $name, cpf: $cpf)';
}
