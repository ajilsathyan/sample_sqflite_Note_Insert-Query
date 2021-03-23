import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController textTitle = TextEditingController();
  TextEditingController textContent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note Here!!"),
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
          )
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border:Border.all(
              color: Colors.green,width: 2,
            )
          ),
          child: Icon(
            FontAwesomeIcons.check,
            color: Colors.green[600],
            size: 30,
          ),
        ),
      ),
    );
  }
}
