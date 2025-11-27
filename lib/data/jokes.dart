import '../model/joke_model.dart';



const List<List<String>> newJokes = [
  
  ['Why was the JavaScript developer sad?', 'Because he didn\'t Node how to Express himself.'],
  
  ['What’s the best thing about a Boolean?', 'Even if you’re wrong, you’re only off by a bit.'],

  ['Why did the programmer quit his job?', 'Because he didn\'t get arrays.'],
  
  ['How do you comfort a JavaScript bug?', 'You console it.'],
 
  ['Why do programmers prefer dark mode?', 'Because light attracts bugs.'],
 
  ['What is a programmer\'s favorite place to hang out?', 'The Foo bar.'],
  
  ['Why do we tell actors to "break a leg?"', 'Because every play has a cast.'],
  
  ['Did you hear about the new restaurant called Karma?', 'There\'s no menu: you get what you deserve.'],
  
  ['What\'s the difference between a guitar and a fish?', 'You can tune a guitar, but you can\'t tuna fish.'],
  
  ['What do you call a fake noodle?', 'An Impasta.'],
  
  ['Why don\'t scientists trust atoms?', 'Because they make up everything.'],
  
  ['Where do all the bad rainbows go?', 'To prism.'],
  
  ['What kind of tea is hard to swallow?', 'Reality.'],
  
  ['I have a joke about time travel.', 'But I\'m not going to tell it to you. You missed it.'],
  
  ['I was wondering why the frisbee was getting bigger.', 'Then it hit me.'],
  
  ['Why can’t a bicycle stand on its own?', 'It’s two tired.'],
  
  ['What do you call a lazy kangaroo?', 'Pouch potato.'],
  
  ['What does a cloud wear under its raincoat?', 'Thunderwear.'],
  
  ['What do you call an alligator in a vest?', 'An investigator.'],
  
  ['What do you call a fish with no eyes?', 'Fsh.'],
 
];


final List<Joke> jokeDatabase = List.generate(
  
  newJokes.length, 
  (index) {
 
    final title = newJokes[index][0];
    final description = newJokes[index][1];

   
    return Joke(
      id: index,
      title: title,
      description: description,
    );
  },
);