import 'package:flutter/material.dart';
import 'package:flutter_rest_api/services/notes_service.dart';
import 'package:flutter_rest_api/views/note_list.dart';
import 'package:get_it/get_it.dart';

/*Service locator with get_it package
  use registerLazySingleton because don't need more than one instance of the notes service
*/
void setupLocator() {
  GetIt.instance.registerLazySingleton(() => NotesService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}

