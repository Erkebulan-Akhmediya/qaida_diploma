class User {
  String id;
  String? name;
  String? surname;
  String? fatherName;
  String email;
  List favorites;
  String gender;
  String? messengerOne;
  String? messengerTwo;
  String password;
  String? imageId;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.fatherName,
    required this.email,
    required this.favorites,
    required this.gender,
    required this.messengerOne,
    required this.messengerTwo,
    required this.password,
    required this.imageId,
  });

  factory User.fromMap(map) {
    return User(
      id: map['_id'],
      name: map['name'],
      surname: map['surname'],
      fatherName: map['father_name'],
      email: map['email'],
      favorites: map['favorites'],
      gender: map['gender'],
      messengerOne: map['messenger_one'],
      messengerTwo: map['messenger_two'],
      password: map['password'],
      imageId: map['image_id'],
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