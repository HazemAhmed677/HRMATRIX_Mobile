class Requester {
  int? id;
  String? name;
  String? role;

  Requester({this.id, this.name, this.role});

  factory Requester.fromJson(Map<String, dynamic> json) => Requester(
    id: json['id'] as int?,
    name: json['name'] as String?,
    role: json['role'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'role': role};
}
