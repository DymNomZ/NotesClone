import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesclonedym/splash.dart';
import 'package:provider/provider.dart';
import 'notedata.dart';
import 'package:window_size/window_size.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Notes!');
    setWindowMinSize(const Size(400, 300));
  }

  await Hive.initFlutter("C:/Users/User/Desktop/storednotes-Notes!");
  await Hive.openBox('NotesDB');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      )
    );
  }
}