import 'package:flutter/material.dart';
import 'data/jokes.dart'; 
import 'model/joke_model.dart';


Color appColor = Colors.green[300] as Color;


class JokeManagerApp extends StatefulWidget {
  const JokeManagerApp({super.key});

  @override
  State<JokeManagerApp> createState() => _JokeManagerAppState();
}

class _JokeManagerAppState extends State<JokeManagerApp> {
  
  int? _favoriteJokeId;

  
  void _setFavorite(int jokeId) {
    setState(() {
     
      if (_favoriteJokeId == jokeId) {
        _favoriteJokeId = null; 
      } else {
        _favoriteJokeId = jokeId;f
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
        
        body: ListView.builder(
          itemCount: jokeDatabase.length,
          itemBuilder: (context, index) {
            final joke = jokeDatabase[index];

            
            return FavoriteCard(
              key: ValueKey(joke.id), 
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

void main() => runApp(const JokeManagerApp());



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
                
                Text(
                  joke.title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
              
                Text(joke.description)
              ],
            ),
          ),
          IconButton(
            onPressed: () {
            
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