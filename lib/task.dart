import 'package:flutter/material.dart'; 
 
class Task {
  String title;
  String priority;
  bool isDone;

  Task({required this.title, this.priority = 'Normal', this.isDone = false});
}

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<Task> _tasks = [];
  final TextEditingController _controller = TextEditingController();
  String _selectedPriority = 'Normal';

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(Task(title: _controller.text, priority: _selectedPriority));
        _controller.clear();
        _selectedPriority = 'Normal';
      });
    }
  }

  void _editTask(int index) {
    showDialog(
      context: context,
      builder: (ctx) {
        TextEditingController editController = TextEditingController(
          text: _tasks[index].title,
        );
        String editPriority = _tasks[index].priority;

        return AlertDialog(
          title: Text("Edit Task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: editController),
              DropdownButton<String>(
                value: editPriority,
                items:
                    ['Low', 'Normal', 'High']
                        .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                        .toList(),
                onChanged: (val) {
                  setState(() => editPriority = val!);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: Text("Save"),
              onPressed: () {
                setState(() {
                  _tasks[index].title = editController.text;
                  _tasks[index].priority = editPriority;
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteTask(int index) {
    setState(() => _tasks.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks & Assignments")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'New Task'),
                  ),
                ),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: _selectedPriority,
                  items:
                      ['Low', 'Normal', 'High']
                          .map(
                            (p) => DropdownMenuItem(value: p, child: Text(p)),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() => _selectedPriority = val!);
                  },
                ),
                IconButton(icon: Icon(Icons.add), onPressed: _addTask),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration:
                          task.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Text("Priority: ${task.priority}"),
                  leading: Checkbox(
                    value: task.isDone,
                    onChanged: (val) {
                      setState(() => task.isDone = val!);
                    },
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editTask(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteTask(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
     ),
    );
  }
}