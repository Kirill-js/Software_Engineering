% темы марок
tema(fauna).
tema(flora).
tema(sport).
tema(kosmos).

% основная часть кода (предикат решения задачи)
itog(Heroes) :-
    Heroes = [_, _, _, _], % 4 "анонимных символа" - 4 персонажа задачи
    member([volk, fauna], Heroes), % волк коллекционирует фауну.
    member([nif, TemaNif], Heroes), tema(TemaNif), TemaNif \= fauna,
    member([naf, TemaNaf], Heroes), tema(TemaNaf), TemaNaf \= fauna,
    member([nuf, TemaNuf], Heroes), tema(TemaNuf), TemaNuf \= fauna,
    sleva_ot([volk, fauna], [naf, TemaNaf], Heroes), % волк слева от нафа
    sprava_ot([nif, TemaNif], [_, kosmos], Heroes), % ниф справа от собирателя космоса
    naprotiv([nuf, TemaNuf], [naf, TemaNaf], Heroes), % нуф напротив нафа
    TemaNuf \= sport, % нуф не любит спорт
    all_different([fauna, TemaNif, TemaNaf, TemaNuf]).

% наипростейшая и подробная проверка на нахождение того, что персонаж сидит слева от другого персонажа
sleva_ot(Odin, Vtoroi, [Odin, Vtoroi | _]).
sleva_ot(Odin, Vtoroi, [_ | Ostatok_spiska]) :- sleva_ot(Odin, Vtoroi, Ostatok_spiska).

% аналогично с "слева от", только теперь "справа от"
sprava_ot(Odin, Vtoroi, [Vtoroi, Odin | _]).
sprava_ot(Odin, Vtoroi, [_ | Ostatok_spiska]) :- sprava_ot(Odin, Vtoroi, Ostatok_spiska).

% персонаж напротив другого персонажа
naprotiv(Odin, Vtoroi, [Odin, _, Vtoroi, _]).
naprotiv(Odin, Vtoroi, [_, Odin, _, Vtoroi]).

% проверка на то, что каждый персонаж коллекционирует разные марки
all_different([]).
all_different([Start|End]) :- not(member(Start, End)), all_different(End).
