import 'package:flutter/material.dart';
import 'package:notes/editScreen.dart';
import 'package:notes/note.dart';
import 'package:notes/taskData.dart';
import 'package:notes/taskModel.dart';

class MyHomePge extends StatefulWidget {
  @override
  _MyHomePgeState createState() => _MyHomePgeState();
}

class _MyHomePgeState extends State<MyHomePge> {




  TaskModel currenTask;
  DataBaseHelper dataBaseHelper = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return Note();
          }));

          // showbottomTextKeys(context);
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.lightBlue,
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
          ),
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) {
                    return EditScreen();
                  }));
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1.5),
                      borderRadius: BorderRadius.circular(13)),
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        child: Center(child: Text("${tasks[index].title}")),
                      ),
                      Container(
                        child: Center(
                          child: Text("${tasks[index].content}"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
