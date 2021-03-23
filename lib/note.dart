import 'package:flutter/material.dart';
import 'package:notes/taskData.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/taskModel.dart';

class Note extends StatefulWidget {
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  TextEditingController textTitle = TextEditingController();
  TextEditingController textContent = TextEditingController();
  TaskModel currenTask;
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  List<TaskModel> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 1.5)),
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: TextField(
                maxLength: 20,
                controller: textTitle,
                decoration: InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
                left: 10,
                right: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 1.5)),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  maxLines: null,
                  controller: textContent,
                  decoration: InputDecoration(
                    hintText: "Content",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          FlatButton.icon(
              onPressed: () async {
                Navigator.pop(context);

                currenTask = TaskModel(textTitle.text, textContent.text, 2);
                dataBaseHelper.insertTask(currenTask);
                list = await dataBaseHelper.getAllData();
                setState(() {
                  tasks = list;
                });
              },
              icon: Icon(Icons.check),
              label: Text("Save")),
          //   Text("${tasks[].title}"),
        ],
      ),
    );
  }
}
