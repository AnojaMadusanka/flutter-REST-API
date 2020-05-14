import 'dart:core';

class NoteForListing {
  String noteID;
  String noteTitile;
  DateTime createdDateTime;
  DateTime latestEditedDAteTime;

  NoteForListing({
    this.noteID,
    this.noteTitile,
    this.createdDateTime,
    this.latestEditedDAteTime
  });

}