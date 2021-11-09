import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/database_helper.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/screens/widgets.dart';

class Taskpage extends StatefulWidget {
  // const Taskpage({Key? key, required Task task}): super(key: key);

  final Task? task;
  Taskpage({this.task});

  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  String _taskTitle = "";
  @override
  void initState() {
    if (widget.task != null) {
      _taskTitle = widget.task!.title!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/back_arrow_icon.png'),
                            ),
                          ),
                        ),
                        Expanded(
                            child: TextField(
                                onSubmitted: (value) async {
                                  // check if the field is not empty
                                  if (value != "") {
                                    //check if the task is null
                                    if (widget.task == null) {
                                      DatabaseHelper _dbHelper =
                                          DatabaseHelper();

                                      Task _newTask = Task(
                                        title: value,
                                        description: value,
                                      );

                                      await _dbHelper.insertTask(
                                          _newTask, _newTask);
                                    } else {
                                      print('update the existing task');
                                    }

                                    print('new task has been created');
                                  }
                                },
                                controller: TextEditingController()
                                  ..text = _taskTitle,
                                decoration: InputDecoration(
                                  hintText: "Enter Task Title",
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF960440),
                                )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Enter description for the task...",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            bottom: 6.0,
                            left: 24.0,
                          )),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                        child: Row(
                          children: [
                            Container(
                                width: 24.0,
                                height: 24.0,
                                margin: EdgeInsets.only(
                                  right: 12.0,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(6.0),
                                    border: Border.all(
                                      color: Color(0xFFAA6481),
                                      width: 1.5,
                                    )),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/check_icon.png'),
                                )),
                            Expanded(
                                child: TextField(
                              onSubmitted: (value) async {
                                // check if the field is not empty
                                if (value != "") {
                                  //check if the task is null
                                  if (widget.task != null) {
                                    DatabaseHelper _dbHelper = DatabaseHelper();

                                    Todo _newTodo = Todo(
                                      title: value,
                                      isDone: 0,
                                      taskId: widget.task!.id,
                                    );

                                    await _dbHelper.insertTodo(
                                        _newTodo, _newTodo);
                                    print('creating new todo');
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter to do item...',
                                border: InputBorder.none,
                              ),
                            )),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 24.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Taskpage(task: null)),
                    );
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF8649BB),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Image(
                        image: AssetImage(
                      "assets/images/delete_icon.png",
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
