import 'package:equatable/equatable.dart';

class Message extends Equatable{
  final int id;
  final int messageOrder;
  final String sender;
  final int sessionId;
  final int userId;
  final String messageText;

  Message(this.id, this.messageOrder, this.sender, this.sessionId, this.userId, this.messageText);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}