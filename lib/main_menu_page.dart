import 'package:flutter_application_1/timetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/task.dart';
import 'package:flutter_application_1/profile_page.dart';
import 'package:flutter_application_1/mood_quiz_page.dart';
import 'package:flutter_application_1/note_list.dart';

class MainMenuPage extends StatelessWidget {
  final String username;

  const MainMenuPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Menu')),
      drawer: AppDrawer(
        username: username,
      ),
      body: Center(
        child: Text(
          'Welcome good people.\n'
          'Navigate the pages using the drawer.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final String username;

  const AppDrawer({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pages',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(height: 10),
                Text(
                  'User: $username',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Task'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Timetable'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TimetablePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.checklist),
            title: Text('Notes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteListPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profiles'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    username: username,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_reaction),
            title: Text('Mood Tracker'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MoodQuizPage(
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
