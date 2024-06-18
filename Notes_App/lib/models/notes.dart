import 'package:cloud_firestore/cloud_firestore.dart';

class Note{
  //parameters
  String notename;
  Timestamp createdOn;

  //const
  Note({
    required this.notename,
    required this.createdOn
});
//json to Note
  Note.fromJson(Map<String, Object?> json):
        this(
        notename: json['notename'] as String,
        createdOn: json['createdOn'] as Timestamp
      );

  //copy with operation
  Note copyWith({
    String? notename, Timestamp? createdOn
}){
    return Note(notename: notename ?? this.notename, createdOn: createdOn ?? this.createdOn);
  }

  //Note to json
  Map<String, Object?> toJson(){
    return {
      'notename':notename, 'createdOn':createdOn
    };
  }
}