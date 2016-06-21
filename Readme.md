Elm movie domino
================

This is a simple sample application to query the universal movie database for actors.
At some later point, this will be a little game to create chains of actors that
starred together in movies where the goal is to make a long chain but come back
to the starting point, like this, only longer:

* Angelina Jolie -> Brad Pitt (By the Sea)
* Brad Pitt -> Antonio Banderas (Interview with a Vampire)
* Antonio Banderas -> Angelina Jolie (Original Sin)

So far, only a simple actor search is implemented. You can enter a name, click
a button, and get a list of actors, sorted by popularity (using themoviedb.org
API as a backend).

Compiling the program
---------------------

To compile, make sure you can run the elm compiler, then:
```
git clone
cd ...
elm package install
elm make src/Main.elm --output elm-movie-domino.js
```

Then open elm-movie-domino.html in a browser. You can also use `elm repl` which
will get you compile-on-reload but no styles.

Challenges
----------

This repository is designed as a starting point for small refactorings as part
of the Elm Hackathon in Berlin.

Here are 3 challenges, in increasing complexity (but feel free to come up with
  your own!):

1. Add a button that can be used in debugging to force the display of an error
message (or maybe 4 buttons to cover all possible error cases)

2. There is currenlty no way to distinguish between the state when no search has
been started and when a search is in progress but no results have arrived and also
no visual indication if the text field changes after a search has been performed,
thus potentially invalidating the results. Model these states and visually represent
them.

3. The server response of the movie db api [contains an image](http://docs.themoviedb.apiary.io/#reference/search/searchperson/get)
Display that image in the list next to the actors name.

4. Extract the search for an actor into a component and display two such fields
next to each other. Add another server query to find movies two actors starred
in together using the discover endpoint. Whenever two actors have been searched
and are selected, trigger a search for the movies those two starred in together.
(Or, to simplify it a little, just picke the most popular actor from each of
the two lists)

Hints for each challenge
-----

1. Add a button to the top level view function. In the onClick handler, what is
the message that would have to be sent?

2. Instead of a Maybe (List Actor) in the model, create your own union type
similar to how Maybe is defined but with more states. Think about which states
need payload (and what kind) and which don't.

3. You need to add a field in the Actor record to store the image url, add/modify
the json decoder to extract it from the api result and then display the image
in the view function that displays the actors name
