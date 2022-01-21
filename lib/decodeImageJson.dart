class User {
  String name;
  String id;



  User(this.name, this.id);

  factory User.fromJson(dynamic json) {
    return User(json['name'] as String, json['id'] as String);
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.id} }';
  }
}