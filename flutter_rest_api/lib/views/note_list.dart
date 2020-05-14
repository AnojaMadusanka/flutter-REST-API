import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/note_for_listing.dart';
import 'package:flutter_rest_api/services/notes_service.dart';
import 'package:flutter_rest_api/views/note_delete.dart';
import 'package:flutter_rest_api/views/note_modify.dart';
import 'package:get_it/get_it.dart';

class NoteList extends StatefulWidget {

  @override
  _NoteListState createState() => _NoteListState();
    
}


class _NoteListState extends State<NoteList> {

  //final service = NotesService();   // if have multiple pages need to have implement every pages that the service need
  NotesService get service => GetIt.I<NotesService>();

  //create an empty List
  List<NoteForListing> notes = [];

  String formatDateTime(DateTime dateTime) {    //Helper function for format Date Time
    return  '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  //This is the method call when we open our stateful page
  @override
  void initState() {
    notes = service.getNotesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green), 
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey(notes[index].noteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {

            },
            confirmDismiss: (direction) async{
              final result = await showDialog(    //showDialog is future so it doesnot given boolean, 
                context: context,           //for that  we use async for sufficient
                builder: (_) => NoteDelete()
              );
              print(result);
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left:16),
              child: Align(child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.centerLeft,),
            ),
            child: ListTile(
              title: Text(
                notes[index].noteTitile,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text('Last edited on ${formatDateTime(notes[index].latestEditedDAteTime)}'),
              onTap: () {
                Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => NoteModify(noteID: notes[index].noteID,)));
              },
            ),
          );  
        } ,
        itemCount: notes.length),
    );
  }
}