class UserData {
  final String? name;
  final String id;
  final String email;

  UserData({
    this.name = '',
    required this.id,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'email': email,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'] as String,
      id: map['id'] as String,
      email: map['email'] as String,
    );
  }
}
