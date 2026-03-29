import 'package:flutter/material.dart';
import 'package:todo/models/tasks.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) => SingleChildScrollView(
            child: SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Add Task',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 76, 181, 241),
                      ),
                    ),
                    TextField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      onChanged: (newText) {
                        newTaskTitle = newText;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        context.read<TaskData>().addTask(newTaskTitle);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          76,
                          181,
                          241,
                        ),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text(
                        'Add',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ); // ✅ showModalBottomSheet closes here
      },
      backgroundColor: const Color.fromARGB(255, 76, 181, 241),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
