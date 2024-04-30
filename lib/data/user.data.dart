class User {
  String id;
  String? name;
  String? surname;
  String email;
  List favorites;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.favorites,
  });

  factory User.fromMap(map) {
    return User(
      id: map['_id'],
      name: map['name'],
      surname: map['surname'],
      email: map['email'],
      favorites: map['favorites']
    );
  }
}