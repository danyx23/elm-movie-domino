Elm movie domino
================

This is a simple sample application to query the movie database for actors.
At some later point, this will be a little game to create chains of actors that
starred together in movies where the goal is to make a long chain but come back
to the starting point, like this, only longer:

* Angelina Jolie -> Brad Pitt (By the Sea)
* Brad Pitt -> Antonio Banderas (Interview with a Vampire)
* Antonio Banderas -> Angelina Jolie (Original Sin)

So far, only a simple actor search is implemented. You can enter a name, click
a button, and get a list of actors, sorted by popularity (using themoviedb.org
API as a backend).

Running the program
-------------------

To run the program clone this repository and execute `elm reactor` which
will get you compile-on-reload.

Then open [http://localhost:8000/src/Main.elm](http://localhost:8000/src/Main.elm).

Challenges
----------

This repository is designed as a starting point for small refactorings as part
of the Elm Hackathon in Berlin in June 2016.

Here are 5 challenges, in increasing complexity (but feel free to come up with
your own!):

1. Add a button that can be used in debugging to see the display of an error
message that is shown when the api request fails (as a second step, add another
3 buttons to cover all possible error cases)

2. There is currently no way to distinguish between the state when no search has
been started and when a search is in progress but no results have arrived and also
no visual indication if the text field changes after a search has been performed,
thus potentially invalidating the results. Model these states and visually represent
them.

3. The server response of the movie db api [contains an image](http://docs.themoviedb.apiary.io/#reference/search/searchperson/get)
Display that image in the list next to the actors name.

4. Extract the search for an actor into a component and display two such search fields
next to each other. Add another server query to find movies two actors starred
in together using the [discover endpoint](http://docs.themoviedb.apiary.io/#reference/discover/discovermovie/get).
Add a new button that lets the user search for movies using this api, using the
most popular actor from each of the two lists.

5. Like 4, but let the user choose any actor from either list, and perform the
search for movies automatically every time a new actor is chosen.

Hints for each challenge
------------------------

1. Add a button to the top level view function. In the onClick handler, what is
the message that would have to be sent?

2. Instead of a Maybe (List Actor) in the model, create your own union type
similar to how Maybe is defined but with more states. Think about which states
need payload (and what kind) and which don't.

3. You need to add a field in the Actor record to store the image url, add/modify
the json decoder to extract it from the api result and then display the image
in the view function that displays the actors name

4. Components in Elm are a bit different than in OO languages - they are Like
a small nested elm architecture, with their own Model and Message data types, and
their own init, update and view functions. Use the [pair of counters example](http://guide.elm-lang.org/architecture/modularity/counter_pair.html) from
the Elm Architecture Guide as a template on how to proceed.

5. For a component to communicate back to the main app, one good strategy is to
change the component's update function to return a 3-tuple instead of a 2-tuple
where the third part is a new custom message type to signal changes back to the
component
