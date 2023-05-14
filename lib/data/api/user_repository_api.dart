
import 'package:dio/dio.dart';
import 'package:engsn_corected/data/models/user.dart';
import 'package:engsn_corected/data/repository/user_repository.dart';

import '../models/session.dart';

enum ApiMethods {
  registerUser,
  existingRequest,
  loadSession,
  registerSession,
  getMessages
}


class UserRepositoryAPI{
  final Dio dio;

  UserRepositoryAPI({required this.dio});


  static const String host = "https://engsnapi.onrender.com";
  Map<ApiMethods, String> apiURL = {
    ApiMethods.registerUser: "$host/user/add_user",
    ApiMethods.existingRequest: "$host/user/is_exist",
    ApiMethods.loadSession: "$host/session/user_session",
    ApiMethods.registerSession: "$host/session/add_session",
    ApiMethods.getMessages: "$host/message/get_messages"
  };


  Future<List> getRawUserSessionList(int userID) async{
    Map<String, dynamic> reqData = {
      "user_id": userID
    };

    try{
      final Response response = await dio.get(apiURL[ApiMethods.loadSession]!, queryParameters: reqData);
      List<dynamic> rawSessionList = response.data;
      return(rawSessionList);
    }catch(e){
      throw e;
    }
  }

  Future<List<dynamic>> getRawUserSessionMessages(int userID, int sessionID) async{
    Map<String, dynamic> reqData ={
      "user_id": userID,
      "session_id": sessionID,
    };

    try{
      final Response response = await dio.get(apiURL[ApiMethods.getMessages]!, queryParameters: reqData);
      print("-------USER MESSAGES DATA---------");
      print(response.data);
      print("-------USER MESSAGES DATA---------");
      return response.data;
    }catch(ex){
      throw ex;
    }
  }

  Future<dynamic> registerUserRequest(Map<String, Object> user) async{
    try {
      final Response response = await dio.post(apiURL[ApiMethods.registerUser]!, data: user);
      return response.data;
    }
    catch(ex){
      throw ex;
    }
  }

  Future<RepositoryResponseCodes> registerSessionRequest({required String sessionName, required int userId}) async{
    Map<String, dynamic> reqData = {
      "session_name": sessionName,
      "user_id": userId
    };

    try{
      final Response response = await dio.post(apiURL[ApiMethods.registerSession]!, data:reqData);
      return RepositoryResponseCodes.succes;
    }catch(ex){
      throw ex;
    }

  }

  Future<dynamic> getUserExistingRequest(String email, String password) async{
    Map<String, String> userData = {
      'email': email,
      'password': password
    };
    try{
      final Response response = await dio.post(apiURL[ApiMethods.existingRequest]!, queryParameters: userData);
      print(response.data);
      return response.data;
    }catch(ex){
      throw ex;
    }

  }
}