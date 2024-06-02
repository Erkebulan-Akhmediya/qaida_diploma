class User {
  String id;
  String? name;
  String? surname;
  String email;
  List favorites;
  String gender;
  String? messengerOne;
  String? messengerTwo;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.favorites,
    required this.gender,
    required this.messengerOne,
    required this.messengerTwo,
  });

  factory User.fromMap(map) {
    return User(
      id: map['_id'],
      name: map['name'],
      surname: map['surname'],
      email: map['email'],
      favorites: map['favorites'],
      gender: map['gender'],
      messengerOne: map['messenger_one'],
      messengerTwo: map['messenger_two']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'messengerOne': messengerOne,
      'messengerTwo': messengerTwo,
      'email': email,
    };
  }
}