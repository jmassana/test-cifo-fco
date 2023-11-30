class User {
  final String id;
  final String name;
  final String? surname; // Nullable since it's not required
  final String? bio; // Nullable as it's not a required field in your Node.js model
  final String nick;
  final String? email;
  final String? password;
  final String role;
  final String image;

  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    this.surname,
    this.bio,
    required this.nick,
    this.email,
    this.password,
    this.role = 'role_user', // Default value
    this.image = 'default.png', // Default value
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now(); // Default value

  // Deserialize from JSON
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    surname: json['surname'],
    bio: json['bio'],
    nick: json['nick'],
    email: json['email'],
    password: json['password'],
    role: json['role'] ?? 'role_user',
    image: json['image'] ?? 'default.png',
    createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
  );

  // Serialize to JSON
  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'bio': bio,
    'nick': nick,
    'email': email,
    'password': password,
    'role': role,
    'image': image,
    'created_at': createdAt.toIso8601String(),
  };
}