% Directed connections between cities

road('Makkah', 'Madinah').
road('Makkah', 'Riyadh').

road('Madinah', 'Makkah').
road('Madinah', 'Taif').
road('Madinah', 'Tabuk').

road('Taif', 'Tabuk').
road('Taif', 'Dammam').

road('Tabuk', 'Taif').

road('Qatif', 'Madinah').
road('Qatif', 'Dammam').

road('Dammam', 'Qatif').
road('Dammam', 'Riyadh').

road('Riyadh', 'Dammam').


% Find a path between two cities

travel(From, To, Path) :-
    path(From, To, [From], ReversedPath),
    reverse(ReversedPath, Path).

% Destination reached

path(To, To, Visited, Visited).

% Move to a city that has not been visited

path(From, To, Visited, Path) :-
    road(From, Next),
    \+ member(Next, Visited),
    path(Next, To, [Next|Visited], Path).
