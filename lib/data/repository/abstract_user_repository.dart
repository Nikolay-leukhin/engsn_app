
import 'package:dio/dio.dart';

abstract class AbstractUserRepository{
  int? userId;
  String? nickname;
  String? email;
  String? password;
  String? englishLevel;

  Future<dynamic> login(String userEmail, String userPassword);

  Future<dynamic> addUser(String nickname, String email, String password, String englishLevel);

  Future<dynamic> isUserExist(String userEmail, String userPassword);

  Future<dynamic> loadUserSessions();

  Future<dynamic> addUserSession(String sessionName);

  Future<dynamic> loadMessages(int sessionId, int userId);

  Future<void> clearUserCache();
}