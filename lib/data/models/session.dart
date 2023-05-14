import 'package:equatable/equatable.dart';

class Session extends Equatable{
   final int id;
   final String sessionName;
   final DateTime sessionTimeCreation;
   final bool isEnded;

  Session(this.id, this.sessionName, this.sessionTimeCreation, this.isEnded);

  @override
  // TODO: implement props
  List<Object?> get props => [this.id, this.sessionName, this.sessionTimeCreation];

}