import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'user.g.dart';


@HiveType(typeId: 1)
class User extends Equatable{
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String password;

  @HiveField(3)
  String? avatarPath;

  @HiveField(4)
  String email;

  @HiveField(5)
  String? phone;

  @HiveField(6)
  String? vkContact;

  @HiveField(7)
  String? tgContact;

  @HiveField(8)
  String? longitude;

  @HiveField(9)
  String? latitude;

  @HiveField(10)
  String englishLevel;

  @HiveField(11)
  String? role;

  @HiveField(12)
  bool? isActive;

  @HiveField(13)
  bool? isSuperUser;

  User({
    this.id,
    this.latitude,
    this.longitude,
    this.role,
    this.isActive,
    this.avatarPath,
    this.isSuperUser,
    this.phone,
    this.tgContact,
    this.vkContact,
    required this.name,
    required this.password,
    required this.email,
    required this.englishLevel
  });


  int? get userId => this.id;
  String? get userName => this.name;
  String? get userPassword => this.password;
  String? get userEmail => this.email;
  String? get userEnglishLevel => this.englishLevel;

  @override
  // TODO: implement props
  List<Object?> get props => [this.id, this.name, this.password, this.email, this.englishLevel];

  static Map<String, Object> transformUserModelToRegistration(name, email, password, engLevel){
    return {
      "nickname": name,
      "email": email,
      "password": password,
      "english_level": engLevel
    };
  }

}
