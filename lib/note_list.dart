import 'package:flutter/material.dart';
import 'note.dart';
import 'note_favorite_page.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  final List<Note> notes = [];

  void _showNoteDialog({Note? note, int? index}) {
    final TextEditingController controller = TextEditingController(
      text: note?.content ?? '',
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(note == null ? 'Add Note' : 'Edit Note'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter note content'),
          autofocus: true,
          maxLines: null,
        ),
        actions: [
          if (note != null)
            TextButton(
              onPressed: () {
                setState(() {
                  notes.removeAt(index!);
                });
                Navigator.pop(context);
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final content = controller.text.trim();
              if (content.isNotEmpty) {
                setState(() {
                  if (note == null) {
                    notes.add(Note(content: content));
                  } else {
                    notes[index!] = Note(
                      content: content,
                      isFavorite: note.isFavorite,
                    );
                  }
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _toggleFavorite(int index) {
    setState(() {
      notes[index].isFavorite = !notes[index].isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            tooltip: 'View Favorites',
            onPressed: () {
              final favoriteNotes =
                  notes.where((note) => note.isFavorite).toList();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NoteFavoritePage(favoriteNotes: favoriteNotes),
                ),
              );
            },
          ),
        ],
      ),
      body: notes.isEmpty
          ? const Center(child: Text("No notes yet"))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (_, index) {
                final note = notes[index];
                return ListTile(
                  title: Text(note.content),
                  trailing: IconButton(
                    icon: Icon(
                      note.isFavorite ? Icons.star : Icons.star_border,
                      color: note.isFavorite ? Colors.amber : null,
                    ),
                    onPressed: () => _toggleFavorite(index),
                  ),
                  onTap: () => _showNoteDialog(note: note, index: index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNoteDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
