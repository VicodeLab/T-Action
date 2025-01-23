
// company.dart


class Ntea {
  final String id;
  final String name;
  final String edad;
  final String email;

  Ntea({
    required this.id,
    required this.name,
    required this.edad,
    required this.email, 
  });

  factory Ntea.fromJson(Map<String, dynamic> json) {
    return Ntea(
      id: json['id'],
      name: json['name'],
      edad: json['edad'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'edad': edad,
        'email': email,
      };

  String getUserName() {
    return name;
  }
}


