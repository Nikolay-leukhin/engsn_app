
import 'package:dio/dio.dart';

abstract class AbstractUserRepository{
  int? userId;
  String? nickname;
  String? email;
  String? password;
  String? englishLevel;

  Future<dynamic> login();

  Future<dynamic> addUser();

  Future<dynamic> isUserExist();

  Future<dynamic> loadUserSessions();

  Future<dynamic> addUserSession(String sessionName);

  Future<dynamic> loadMessages(int sessionId, int userId);
}