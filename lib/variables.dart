import 'dart:async';

List<String> exitText = ["Let's call it a day 😌", "Leaving already? 🤔", "That's a wrap! 💪", 
                          "Goodbye 👋", "Goodjob 🙌", "Work done ✅"];
String currentFolder = 'Notes';
StreamController<String> folderStream = StreamController.broadcast();