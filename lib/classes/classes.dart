import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:notesclonedym/buttons/buttons.dart';
import 'package:notesclonedym/classes/boxes.dart';
import 'package:notesclonedym/classes/window.dart';
import 'package:notesclonedym/functions/functions.dart';

class WindowTitle extends StatefulWidget {
  final VoidCallback dialog;
  final VoidCallback bodydialog;
  const WindowTitle({required this.dialog, required this.bodydialog, super.key});

  @override
  State<WindowTitle> createState() => _WindowTitleState();
}

class _WindowTitleState extends State<WindowTitle> {
  Window userWindow = (windowBox.isNotEmpty) ? windowBox.getAt(0) : Window(barColor: Colors.amber, bodyColor: Colors.white);
  WindowButtonColors notesdefault = WindowButtonColors(
    iconNormal: Colors.black
  );

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Container(
            color: userWindow.barColor,
            child: Row(
              children: [
                Row(
                  children: [
                    AddNoteButton(onPressed: widget.dialog),
                    ShowInfoButton(onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (_) => const ShowInfo(),
                      );
                      return result;
                    }),
                    ChoseColorButton(onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (_) => const ChoseWindowColor(colorPart: 1),
                      ); 
                      if(result != null) {
                        if(windowBox.isEmpty){
                          setState(() {
                            userWindow.barColor = result;
                            windowBox.add(userWindow);
                          });
                        }
                        else{
                          setState(() {
                            userWindow.barColor = result;
                            userWindow.save();
                          });
                        }
                      }
                    }),
                    ChoseColorButton(onPressed: widget.bodydialog)
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: MoveWindow(
              child: Container(
                //to be made a class
                color: userWindow.barColor,
              ),
            ),
          ),
          Container(
            //to be made a class
            color: userWindow.barColor,
            child: Row(
              children: [
                Row(
                  children: [
                    MinimizeWindowButton(colors: notesdefault),
                    MaximizeWindowButton(colors: notesdefault),
                    CloseWindowButton(colors: notesdefault),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  final void Function(String)? onChanged;
  const SearchField({super.key, this.onChanged});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8),
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.black),
        prefixIcon:  Icon(
          Icons.search,
          color: Colors.black,
          size: 20
        ),
        fillColor: Colors.transparent,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
