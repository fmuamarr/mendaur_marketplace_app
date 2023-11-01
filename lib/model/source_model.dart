//source model Json parse

class Source {
  String id;
  String name;

  //constructor
  Source({required this.id, required this.name});

  //factory to map Json

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
