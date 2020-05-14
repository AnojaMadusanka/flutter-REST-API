import 'package:flutter_rest_api/models/note_for_listing.dart';

class NotesService {

  List<NoteForListing> getNotesList() {
    return [
      new NoteForListing(
        noteID: "1",
        createdDateTime: DateTime.now(),
        latestEditedDAteTime: DateTime.now(),
        noteTitile: "Note 1"
      )
    ];

  }

}