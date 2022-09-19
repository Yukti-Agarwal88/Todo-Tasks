import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'todo_action.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // text field controller for editable text field
  final _textFieldController = TextEditingController();
  String newTask = '';
  TodoProvider todoProvider = TodoProvider();

  @override
  void initState() {
    //insert
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  @override
  void dispose() {
    // to remove
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    // to add a new task in the list we have to click submit button & then this function will call
    Provider.of<TodoProvider>(context, listen: false).addTask(newTask);
    Navigator.pop(context);
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // alertdialog box for adding text related new task in it
              title: const Text("Add a new Task"),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Add New Task"),
                // to add a new task in the list we have to click submit button & then submit function will call
                onSubmitted: (_) => _submit(),
              ),
              actions: [
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Submit"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40)),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo App"),
      ),
      body:
          TodoAction(), // this will call todo action where we created listview for tasks
      floatingActionButton: FloatingActionButton(
        //FAB for adding new tasks
        onPressed: (() {
          _showAddTextDialog();
        }),
        child: const Icon(Icons.add),
        tooltip: "Add a todo",
      ),
    );
  }
}
