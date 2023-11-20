run :-
    write('*******************'), nl,
    write('*   B-C-R-I-T-W   *'), nl,
    write('*******************'), nl,
    nl,
    checkMeal(Meal),
    write('Dude,You can cook '), write(Meal), write('.'), nl,
    undo.

checkMeal(kebbah) :- kebbah.
checkMeal(bamia) :- bamia.
checkMeal(safargeliah) :- safargeliah.
checkMeal(mehshi) :- mehshi.
checkMeal(mulukhiyah) :- mulukhiyah.
checkMeal(fasolia) :- fasolia.
checkMeal(mjadarah) :- mjadarah.
checkMeal(spaghetti) :- spaghetti.
checkMeal(yabraq) :- yabraq.
checkMeal(orman_blaban) :- orman_blaban.


checkMeal("noting with this ingredients").

kebbah :-
    checkIngredient(meat),
    checkIngredient(onion),
    checkIngredient(spices),
    checkIngredient(bulgur).

bamia :-
    checkIngredient(meat),
    checkIngredient(tomato_souce),
    checkIngredient(okra),
    checkIngredient(bread),
    checkIngredient(spices).

safargeliah :-
    checkIngredient(meat),
    checkIngredient(tomato_souce),
    checkIngredient(spices),
    checkIngredient(quince).

mehshi :- 
    checkIngredient(meat),
    checkIngredient(vegetables),
    checkIngredient(rice),
    checkIngredient(spices).

mulukhiyah :- 
    checkIngredient(meat),
    checkIngredient(garlic),
    checkIngredient(spices),
    checkIngredient(mulukhiyahs).

fasolia :- 
    checkIngredient(meat),
    checkIngredient(tomato_souce),
    checkIngredient(garlic),
    checkIngredient(spices),
    checkIngredient(beans).

mjadarah :- 
    checkIngredient(onion),
    checkIngredient(bulgur),
    checkIngredient(lentil).

spaghetti :- 
    checkIngredient(tomato_souce),
    checkIngredient(vegetables),
    checkIngredient(spices),
    checkIngredient(macaroni).

yabraq :- 
    checkIngredient(meat),
    checkIngredient(rice),
    checkIngredient(garlic),
    checkIngredient(spices),
    checkIngredient(grape_leaves).

orman_blaban :- 
    checkIngredient(meat),
    checkIngredient(spices),
    checkIngredient(butter),
    checkIngredient(yogurt),
    checkIngredient(corn_starch).

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
