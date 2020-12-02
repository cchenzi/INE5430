### Exercícios Parte I - Lógica e Prova Automáticade Teoremas


1) Represente-os em lógica proposicional. Demonstre utilizando algum tipo de inferência lógica que o técnico é culpado.

    Via __modus ponens__: ((P -> Q) ^ P) -> Q. "P implica Q; P é verdade, logo Q".

    1)
    - Se a seleção brasileira jogar bem, os torcedores fazem festa.
    - Os torcedores não fazem festa.
    - Logo, a seleção brasileira não joga bem.

    2)
    Dos conhecimentos apresentados:
    - Se a seleção brasileira não jogar bem, a culpa é do técnico da seleção.

    Conhecimento derivado em 1):
    - A seleção não joga bem.
    - Logo, a culpa é do técnico da seleleção (**o técnico é culpado**).

    Outra forma...
    s = seleção, g = ganhar copa, c = culpa do técnico, f = festa dos torcedores

    Fatos:
        s -> g
        ~s -> c
        s -> f
        ~f

    Inferência:
        por MT
            ~f ^ (s -> f) -> ~s
        por MP
            ~s ^ (~s -> c) -> c
            c (o técnico é culpado)

2) Represente os seguintes conhecimentos em lógica de predicados:

    a) Toda a criança gosta de chocolate. Adultos não gostam de chocolate. Pedro é criança. Raquel é adulta. Carla gosta de chocolate. João não gosta de chocolate.

        criança(Pedro), adulto(Raquel)
        1) ∀X[criança(X) -> gosta(X, chocolate)]
        2) ∀X[~criança(X) -> ~gosta(X, chocolate)]


        criança(Pedro), ~criança(Raquel), gosta(Carla, chocolate), ~gosta(Joao, chocolate).

         Desse modo,
            - por 1), Pedro gosta de chocolate e Carla é criança.
            - por 2), João é adulto já que não gosta de chocolate

    b) Tdas as pessoas gostam de alguma coisa. Homens e mulheres sãopessoas. Todos os homens gostam de futebol ou de corridas de au-tomóveis. Mulheres gostam de filmes românticos e seriados. Carla émulher. João gosta de futebol. Pedro é homem.

    pessoa(X),
    genero(X, homem).
    genero(X, mulher)
    ∀X[(pessoa(x) ^ genero(x, homem)) -> gosta(x, futebol) || gosta(x, automovel)]
    ∀X[(pessoa(x) ^ genero(x, mulher)) -> gosta(x, filme_romantico) && gosta(x, seriados)]

    pessoa(Carla), genero(Carla, mulher) -> gosta(Carla, filme_romantico) && gosta(Carla, seriados).
    por MP, se Carla é uma pessoa mulher, ela gosta de filme romântico e seriados.

    pessoa(João), genero(Joao, ?), gosta(Joao, futebol).
    Desse modo, João é homem.

    pessoa(Pedro), genero(Pedro, homem). Logo, ele gosta ou de futebol ou de automóveis.
