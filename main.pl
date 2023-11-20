run :-
    write('*******************'), nl,
    write('*   B-C-R-I-T-W   *'), nl,
    write('*******************'), nl
    nl,
    checkMeal(Meal),
    write('You can cook '), write(Meal), write('.'), nl,
    undo.

checkMeal(kebbah) :- kebbah.
% checkMeal(safarjaliah) :- safarjaliah, !.
% checkMeal('arman blaban') :- armanBlaban, !.
% checkMeal(mehshi) :- mehshi, !.
% checkMeal(mlukhiah) :- mlukhiah, !.
checkMeal(bamia) :- bamia.
% checkMeal(fasoliah) :- fasoliah, !.
% checkMeal(mjadarah) :- mjadarah, !.
% checkMeal(hamees) :- hamees, !.

checkMeal(noting).

kebbah :-
    checkIngredient(burghol),
    checkIngredient(meat),
    checkIngredient(onion),
    checkIngredient(spices).

bamia :-
    checkIngredient(meat),
    checkIngredient(okra),
    checkIngredient(bread),
    checkIngredient(tomato),
    checkIngredient(spices).

askAbout(Ingredient) :-
    write('Do you have '), write(Ingredient), write('? '), read(Reply),
    (
        /* assert yes to the ques add to wroking memory */
        (Reply == yes ; Reply == y ; Reply == no) -> 
            assert(yes(Ingredient));
        /* assert no to ques and fail*/
        assert(no(Ingredient)),
        fail
    ).  

/* yes or no will change dynamically according to the conditions */
:-
    dynamic yes/1, no/1.

checkIngredient(I) :-
    (
        yes(I) -> true ;
        no(I) -> fail ;
        askAbout(I)
    ).

/* clearing all the memory assigned using undo statements */
undo :-
    retract(yes(_)),
    fail.
undo :-
    retract(no(_)),
    fail.
undo.
