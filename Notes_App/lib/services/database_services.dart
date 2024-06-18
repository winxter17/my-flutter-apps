import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/models/notes.dart';


//collection reference
const String NOTES_REFEREENCE_ID = "notes";

class DatabaseServices{
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _notesRef;
  DatabaseServices(){
    _notesRef = _firestore.collection(NOTES_REFEREENCE_ID).withConverter<Note>(fromFirestore: (snapshots,_)=>Note.fromJson(snapshots.data()!),
        toFirestore: (note,_)=> note.toJson());
  }

  Stream<QuerySnapshot> getNotes(){
    return _notesRef.snapshots();
  }

  void addNote(Note note){
    _notesRef.add(note);
  }

  void deleteNote(String noteID){
    _notesRef.doc(noteID).delete();
  }

  void updateNote(Note note, String noteID){
    _notesRef.doc(noteID).update(note.toJson());
  }

}