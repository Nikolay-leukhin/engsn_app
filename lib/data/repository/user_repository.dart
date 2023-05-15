import 'package:dio/src/dio.dart';
import 'package:engsn_corected/data/api/user_repository_api.dart';
import 'package:engsn_corected/data/models/message.dart';
import 'package:engsn_corected/data/repository/abstract_user_repository.dart';
import 'package:hive/hive.dart';

import '../models/session.dart';
import '../models/user.dart';


enum RepositoryResponseCodes{
  succes,
  failure,
  incorrectData
}


class UserRepository implements AbstractUserRepository{
  final Box userBox;

  @override
  String? email;

  @override
  String? englishLevel;

  @override
  String? nickname;

  @override
  String? password;

  @override
  int? userId;

  UserRepositoryAPI api = UserRepositoryAPI(dio: Dio());

  UserRepository(this.userBox);

  @override
  Future<dynamic> addUser() async {
    if (nickname == null || password == null || email == null || englishLevel == null){
      print("one of the required isnt filled");
      throw ArgumentError.value("Fill all fields");
    }
    var userModel = User.transformUserModelToRegistration(nickname, email, password, englishLevel);
    var response = await api.registerUserRequest(userModel);

    print("User add reauset sended : $response");

    Map<String, dynamic> rawAddedUser = response['added_user'];
    return RepositoryResponseCodes.succes;
  }

  @override
  Future login(String userEmail, String userPassword) async{
    final Map<String, dynamic> existing = await isUserExist(userEmail, userPassword);
    if (existing['is_exist'] == false){
      return RepositoryResponseCodes.incorrectData;
    }
    Map<String, dynamic> rawUser = existing['user'];
    processCachingUser(rawUser);
    return RepositoryResponseCodes.succes;
  }

  @override
  Future addUserSession(String sessionName) async {
    int userId = userBox.get("user").id;

    var response = await api.registerSessionRequest(
      sessionName: sessionName,
      userId: userId,
    );
    return(response);
  }

  @override
  Future<Map<String, dynamic>> isUserExist(String userEmail, String userPassword) async {
    if (userEmail == "" || userPassword == "") {
      print("one of the required isnt filled");
      throw ArgumentError.value("Fill all fields");
    }
    var response = await api.getUserExistingRequest(userEmail, userPassword);
    Map<String, dynamic> responseData = response['content'];
    return responseData;
  }

  Future<void> processCachingUser(Map<String, dynamic> requsetWithUser) async{
    // request has to contain all information from user from the DB
    print("----------------KASHING STARTED-------------");
    try{
      User user = User(
        id: requsetWithUser['id'],
        latitude: requsetWithUser['latitude'],
        longitude: requsetWithUser['longitude'],
        role: requsetWithUser['role'],
        isActive: requsetWithUser['is_active'],
        avatarPath: requsetWithUser['avatar_path'],
        isSuperUser: requsetWithUser['is_superuser'],
        phone: requsetWithUser['phone'],
        tgContact: requsetWithUser['tg_contact'],
        vkContact: requsetWithUser['vk_contact'],
        name: requsetWithUser['nickname'],
        password: requsetWithUser['password'],
        email: requsetWithUser['email'],
        englishLevel: requsetWithUser['english_level'],
      );

      userBox.put("user", user);
      print("user kashed $user");
      print("----------------KASHING ENDED-------------");
    }catch(ex){
      throw ex;
    }

  }

  @override
  Future<List<Session>> loadUserSessions() async {
    List rawSessions = await api.getRawUserSessionList(userBox.get("user").id);
    List<Session> sessionList = [];
    for(int i = 0; i < rawSessions.length; i++){
      Map<String, dynamic> item = rawSessions[i];
      String itemName = item['session_name'];
      int itemId = item['id'];
      bool itemIsEnded = item['is_ended'];
      DateTime itemTime = DateTime.parse(item['created_at']);
      sessionList.add(Session(itemId, itemName, itemTime, itemIsEnded));
    }

    return sessionList;
  }

  @override
  Future<List<Message>> loadMessages(int sessionId, int userId) async {
    List<dynamic> rawMessages = await api.getRawUserSessionMessages(userId, sessionId);
    List<Message> messages = [];
    for (int i = 0; i < rawMessages.length; i++) {
      Map<String, dynamic> item = rawMessages[i];
      int itemId = item['id'];
      int itemOrder = item['message_order'];
      String itemSender = item['sender'];
      int itemSessionId = item['session_id'];
      int itemUserId = item['user_id'];
      String itemText = item['message_text'];
      messages.add(Message(itemId, itemOrder, itemSender, itemSessionId, itemUserId, itemText));
    }
    return messages;
  }


  Future<dynamic> sendMessage(int userId, int sessionId, int order, String text, String sender) async{
    print("-------MESSAGE SENDING...-------");
    Map<String, dynamic> rawResponse = await api.sendMessageRequest(userId, sessionId, order, text, sender);
    print("-------MESSAGE SENDED-------");
  }
}