class StudentModel {
  int? id;

  String? name;

  int? age;

  String? standard;

  String? address;

  String profile;

  StudentModel(
      {required this.name,
      required this.age,
      required this.standard,
      required this.address,
      this.id,
      required this.profile});

  static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final age = map['age'] as int;
    final std = map['standard'] as String;
    final address = map['address'] as String;
    final profile = map['profile'] as String;

    return StudentModel(
        id: id,
        name: name,
        age: age,
        standard: std,
        address: address,
        profile: profile);
  }
}
