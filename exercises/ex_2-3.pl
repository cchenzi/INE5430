% Casas
casa(branca).
casa(verde).
casa(vermelha).
casa(amarela).
casa(azul).

% Pessoas
nacionalidade(sueco).
nacionalidade(dinamarques).
nacionalidade(ingles).
nacionalidade(noruegues).
nacionalidade(alemao).

% Bebidas
bebida(cha).
bebida(cafe).
bebida(leite).
bebida(cerveja).
bebida(agua).

% Cigarros
cigarro(malboro).
cigarro(hollywood).
cigarro(charme).
cigarro(free).
cigarro(camel).

% Animais
animal(cachorro).
animal(passaro).
animal(gato).
animal(cavalo).
animal(peixe).

%X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).

%X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X),
                        nth0(IndexY,Lista,Y),
                        IndexX < IndexY.

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :-

    ListaSolucao = [
        pessoa(Nacionalidade1, Casa1, Bebida1, Cigarro1, Animal1),
        pessoa(Nacionalidade2, Casa2, Bebida2, Cigarro2, Animal2),
        pessoa(Nacionalidade3, Casa3, Bebida3, Cigarro3, Animal3),
        pessoa(Nacionalidade4, Casa4, Bebida4, Cigarro4, Animal4),
        pessoa(Nacionalidade5, Casa5, Bebida5, Cigarro5, Animal5)
    ],

     % O inglês vive na casa vermelha;
     member(pessoa(ingles, vermelha, _, _, _), ListaSolucao),

     % O sueco tem cachorros
     member(pessoa(sueco, _, _, _, cachorro), ListaSolucao),

     % O dinamarquês bebe chá
     member(pessoa(dinamarques, _, cha, _, _), ListaSolucao),

     % A casa verde fica do lado esquerdo da casa branca
     aEsquerda(pessoa(_, verde, _, _, _), pessoa(_, branca, _, _, _), ListaSolucao),

     % O homem que vive na casa verde bebe café
     member(pessoa(_, verde, cafe, _, _), ListaSolucao),

     % O homem que fuma Malboro cria pássaros
     member(pessoa(_, _, _, malboro, passaro), ListaSolucao),

     % O homem que vive na casa amarela fuma Hollywood
     member(pessoa(_, amarela, _, hollywood, _), ListaSolucao),

     % O homem que vive na casa do meio bebe leite
     Bebida3 = leite,

     % O norueguês vive na primeira casa,
     Nacionalidade1 = noruegues,

     % O homem que fuma Charme vive ao lado do que tem gatos
     aoLado(pessoa(_, _, _, charme, _), pessoa(_, _, _, _, gato), ListaSolucao),

     % O homem que cria cavalos vive ao lado do que fuma Hollywood
     aoLado(pessoa(_, _, _, hollywood, _), pessoa(_, _, _, _, cavalo), ListaSolucao),

     % O homem que fuma Free bebe cerveja
     member(pessoa(_, _, cerveja, free, _), ListaSolucao),

     % O alemão fuma Camel
     member(pessoa(alemao, _, _, camel, _), ListaSolucao),

     % O norueguês vive ao lado da casa azul;
     aoLado(pessoa(noruegues, _, _, _, _), pessoa(_, azul, _, _, _), ListaSolucao),

     % O homem que fuma Charme é vizinho do que bebe água
     aoLado(pessoa(_, _, _, charme, _), pessoa(_, _, agua, _, _), ListaSolucao),

    %Testa todas as possibilidades...
    nacionalidade(Nacionalidade1), nacionalidade(Nacionalidade2), nacionalidade(Nacionalidade3), nacionalidade(Nacionalidade4), nacionalidade(Nacionalidade5),
    todosDiferentes([Nacionalidade1, Nacionalidade2, Nacionalidade3, Nacionalidade4, Nacionalidade5]),

    casa(Casa1), casa(Casa2), casa(Casa3), casa(Casa4), casa(Casa5),
    todosDiferentes([Casa1, Casa2, Casa3, Casa4, Casa5]),

    bebida(Bebida1), bebida(Bebida2), bebida(Bebida3), bebida(Bebida4),
    bebida(Bebida5),
    todosDiferentes([Bebida1, Bebida2, Bebida3, Bebida4, Bebida5]),

    cigarro(Cigarro1), cigarro(Cigarro2), cigarro(Cigarro3),
    cigarro(Cigarro4), cigarro(Cigarro5),
    todosDiferentes([Cigarro1, Cigarro2, Cigarro3, Cigarro4, Cigarro5]),

    animal(Animal1), animal(Animal2), animal(Animal3), animal(Animal4), animal(Animal5),
    todosDiferentes([Animal1, Animal2, Animal3, Animal4, Animal5]).

%% Solução:
%% solucao(L).
%% L = [
%%    pessoa(noruegues, amarela, agua, hollywood, gato),
%%    pessoa(dinamarques, azul, cha, charme, cavalo),
%%    pessoa(ingles, vermelha, leite, malboro, passaro),
%%    pessoa(alemao, verde, cafe, camel, peixe),
%%    pessoa(sueco, branca, cerveja, free, cachorro)
%%    ].
%%
%% "Quem tem um peixe como animal de estimação?"
%% R: O alemão.
