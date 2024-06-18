import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/services/database_services.dart';

import '../models/notes.dart';

class HomePage extends StatelessWidget {
  DatabaseServices _dbservice= DatabaseServices();
  HomePage({super.key});
  //controller
  final _fieldController = TextEditingController();

  //dialog box
  void _dialogBox(BuildContext context,{String? noteID, Note? note}) async {
    return showDialog(context: context, builder: (context){
      return Container(child: AlertDialog(
        title: Text("Add a note"),
        content: TextField(controller: _fieldController,),
        actions: [MaterialButton(onPressed: (){
          if(noteID==null){
            Note newNote=Note(notename: _fieldController.text, createdOn: Timestamp.now());
            _dbservice.addNote(newNote);
          }else{
            Note updatedNote= note!.copyWith(notename: _fieldController.text);
            _dbservice.updateNote(updatedNote, noteID);
          }
          _fieldController.clear();
          Navigator.pop(context);
        },
          color: Colors.blue,child: Text("Add"),)],
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes"),backgroundColor: Colors.blue,),
      body: _notesListView(),
      floatingActionButton: FloatingActionButton(onPressed: ()=>_dialogBox(context),
          child: Icon(Icons.add),backgroundColor: Colors.blue,elevation: 0,),
    );
  }
  //
  // Widget buildUI(){
  //   return SafeArea(child: Column(
  //     children: [_notesListView()],
  //   ));
  // }
  Widget _notesListView(){
    return SizedBox(
      child: StreamBuilder<QuerySnapshot>(
          stream: _dbservice.getNotes(),
          builder: (context, snapshot) {
            List Notes = snapshot.data?.docs ?? [];
            return ListView.builder(
                itemCount: Notes.length,
                itemBuilder: (context, index){
                  Note note = Notes[index].data();
                  String noteID= Notes[index].id;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 5, 0),
                    child: Container(
                      color: Colors.blue,
                      child: ListTile(
                        title: Text(note.notename),
                        subtitle: Text(note.createdOn.toDate().toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(child: Icon(Icons.delete),
                              onTap: ()=>_dbservice.deleteNote(noteID),
                            ),
                            GestureDetector(child: Icon(Icons.edit),
                              onTap: ()=>_dialogBox(context,noteID: noteID,note: note),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          }),
    );
  }

}
