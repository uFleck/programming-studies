
class Client {

  int id;
  String name;
  String email;

  Client(this.name, this.email);

  Client.fromMap(Map map) {
    id = map['id_column'];
    name = map['name_column'];
    email = map['email_column'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "name_column": name,
      "email_column": email
    };
    if(id != null) {
      map['id_column'] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Client{id: $id, name: $name, email: $email}';
  }

}