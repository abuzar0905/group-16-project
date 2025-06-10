import 'package:flutter/material.dart';
import 'note.dart';

class NoteFavoritePage extends StatelessWidget {
  final List<Note> favoriteNotes;

  const NoteFavoritePage({super.key, required this.favoriteNotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Notes')),
      body: favoriteNotes.isEmpty
          ? const Center(child: Text("No favorite notes yet"))
          : ListView.builder(
              itemCount: favoriteNotes.length,
              itemBuilder: (_, index) {
                final note = favoriteNotes[index];
                return ListTile(
                  title: Text(note.content),
                  leading: const Icon(Icons.star, color: Colors.amber),
                );
              },
            ),
    );
  }
}
