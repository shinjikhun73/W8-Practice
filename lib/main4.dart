import 'package:flutter/material.dart';
import 'data/jokes.dart'; // Import the joke list
import 'model/joke_model.dart'; // Import the Joke model

// The global color variable remains here
Color appColor = Colors.green[300] as Color;

// 1. Create a Stateful Widget to manage the global 'favorite' state
class JokeManagerApp extends StatefulWidget {
  const JokeManagerApp({super.key});

  @override
  State<JokeManagerApp> createState() => _JokeManagerAppState();
}

class _JokeManagerAppState extends State<JokeManagerApp> {
  // STATE: Stores the ID of the currently favorite joke. Null means no favorite.
  int? _favoriteJokeId;

  // CALLBACK: Function to be passed down and executed when a heart is tapped.
  void _setFavorite(int jokeId) {
    setState(() {
      // Logic: If the tapped joke is ALREADY the favorite, unfavorite it (set to null).
      // Otherwise, set the tapped joke as the new favorite (only 1 can be set).
      if (_favoriteJokeId == jokeId) {
        _favoriteJokeId = null; // Unfavorite
      } else {
        _favoriteJokeId = jokeId; // Set new favorite
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
          actions: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 10),
              child: const Text(
                'Only 1 favorite joke!',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        // 2. Use ListView.builder for scrolling and looping over the data
        body: ListView.builder(
          itemCount: jokeDatabase.length, // Total number of jokes (25)
          itemBuilder: (context, index) {
            final joke = jokeDatabase[index];

            // 3. Pass the joke data, the current state, and the callback down
            return FavoriteCard(
              key: ValueKey(joke.id), // Add key for better performance/stability
              joke: joke,
              isFavorite: joke.id == _favoriteJokeId,
              onFavoriteClick: _setFavorite,
            );
          },
        ),
      ),
    );
  }
}

// 4. Refactor main to run the new Stateful App
void main() => runApp(const JokeManagerApp());


// 5. Refactor FavoriteCard to be StatelessWidget and accept data/callback
class FavoriteCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final void Function(int jokeId) onFavoriteClick;

  const FavoriteCard({
    required super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });
  
  // Note: This widget is now StatelessWidget, as its state is managed by its parent.

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BIND DATA: Use joke title
                Text(
                  joke.title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                // BIND DATA: Use joke description
                Text(joke.description)
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // CALL UP: Execute the callback function, passing the ID of the current joke
              onFavoriteClick(joke.id);
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ))
        ],
      ),
    );
  }
}