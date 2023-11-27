meals([
    ['Labania', ['Yogurt','Rice','Meat','Spices','Garlic', 'Egges']],
    ['Kebbah', ['Spices', 'Meat', 'Onion', 'Bulgur']],
    ['Bamia', ['Spices', 'Meat', 'Tomato Souce', 'Okra', 'Bread']],
    ['Safargeliah', ['Spices', 'Meat', 'Tomato Souce', 'Quince']],
    ['Mehshi', ['Spices', 'Meat', 'Vegetables', 'Rice']],
    ['Mulukhiyah', ['Spices', 'Meat', 'Garlic', 'Mulukhiyah Leaves']],
    ['Fasolia', ['Spices', 'Meat', 'Tomato Souce', 'Garlic', 'Beans']],
    ['Mjadarah', ['Onion', 'Rice', 'Lentil']],
    ['Spaghetti', ['Spices', 'Tomato Souce', 'Vegetables', 'Macaroni']],
    ['Yabraq', ['Spices', 'Meat', 'Garlic', 'Rice', 'Grape Leaves']],
    ['Orman-Blaban', ['Spices', 'Meat', 'Butter', 'Yogurt', 'Corn Starch', 'Egges']]
]).

run :-
    print_welcome,
    meals(Meals),
    check_meals(Meals),
    exit.


print_welcome :-
    write('*******************'), nl,
    write('*   B-C-R-I-T-W   *'), nl,
    write('*******************'), nl,
    nl.


check_meals([]) :-
    write('You cannot cook anything else!'), nl,
    nl.
check_meals([H|T]) :-
    check_meal(H),
    check_meals(T).

check_meal([MealName, Ingredients]) :-
    check_ingredients(Ingredients),
    nl,
    write('* You can cook '), write(MealName), write(' *'), nl,
    ask_to_complete.

check_meal(_). % it will always return `true`, even if `check_ingredients` returns `false`.

check_ingredients([]).
check_ingredients([H|T]) :-
    check_ingredient(H),
    check_ingredients(T).

check_ingredient(Ingredient) :-
    yes(Ingredient) -> true ;
    no(Ingredient) -> fail ;
    ask_about(Ingredient).

ask_about(Ingredient) :-
    write('Do you have '), write(Ingredient), write('? [y/n]: '),
    read(Reply),
    (
        (Reply == y; Reply == yes) -> assert(yes(Ingredient)), true ;
        (Reply == n; Reply == no) -> assert(no(Ingredient)), fail ;
        write('Invalid answer! (write \'yes.\' or \'no.\')'), nl,
        ask_about(Ingredient)
    ).

ask_to_complete :-
    write('* Do you want to complete? [y/n]: '),
    read(Reply),
    (
        (Reply == y; Reply == yes) -> true ;
        (Reply == n; Reply == no) -> exit ;
        write('Invalid answer! (write \'yes.\' or \'no.\')'), nl,
        ask_to_complete
    ).

:- dynamic yes/1, no/1.

undo :-
    retract(yes(_)),
    fail.
undo :-
    retract(no(_)),
    fail.
undo.

exit :-
    undo,
    halt.