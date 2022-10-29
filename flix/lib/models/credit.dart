class Credit {
  int? personId;
  String? id;
  String? name;
  String? character;
  String? role;

  Credit({this.personId, this.id, this.name, this.character, this.role});

  Credit.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    id = json['id'];
    name = json['name'];
    character = json['character'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['person_id'] = personId;
    data['id'] = id;
    data['name'] = name;
    data['character'] = character;
    data['role'] = role;
    return data;
  }
}
