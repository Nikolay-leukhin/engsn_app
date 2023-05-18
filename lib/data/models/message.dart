import 'package:equatable/equatable.dart';

class Message extends Equatable{
  final int? id;
  final int messageOrder;
  final String sender;
  final int sessionId;
  final int userId;
  final String messageText;

  Message({this.id, required this.messageOrder, required this.sender, required this.sessionId, required this.userId, required this.messageText});

  @override
  // TODO: implement props
  List<Object?> get props => [this.id, this.messageText, this.sender];
}