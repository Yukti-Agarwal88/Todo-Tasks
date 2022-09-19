import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

class TodoAction extends StatelessWidget {
  const TodoAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            // added this to know all no. of tasks that are in the list
            "Task List: " + task.allTasks.length.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          //ui for list of tasks
          child: ListView.builder(
            itemCount: task.allTasks.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: Checkbox(
                    //checkbox to check if the task is done or not
                    value: task.allTasks[index].completed,
                    onChanged: ((_) => task.toggleTask(task.allTasks[index])),
                  ),
                  // text of a task we'll add
                  title: Text(task.allTasks[index].todoTitle),
                  // delete icon for deleting the particular task
                  trailing: IconButton(
                      onPressed: () {
                        // deleteTask will get called & then that particular task will be deleted
                        task.deleteTask(task.allTasks[index]);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red)),
                )),
          ),
        ),
      ],
    );
  }
}
