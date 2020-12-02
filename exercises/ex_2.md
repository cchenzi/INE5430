1) Método da Resolução

a) (P ^ ~Q) -> ~(P -> Q)

    1. ~((p ^ ~q) -> ~(p -> q)), negando tudo
    2. ~(~(p ^ ~q) V ~(~p V q)), substituindo "->"
    3. (p ^ ~q) ^ (~p V q), aplicando negação.
    4. (p), (~q), (~p V q), CNF.
    5. Resolução:
       p ------ ~p V q,  c1 vs c3.
         q ------ ~q,       vs c2.
            {}              contradição.


b) (p ^ (~q V r)) -> ((p ^ ~q) V (p ^ r))

    1. ~((p ^ (~q V r)) -> ((p ^ ~q) V (p ^ r))), negando tudo.
    2. ~((p ^ (~q V r)) V ~((p ^ ~q) V (p ^ r))), substituindo "->"
    3. (p ^ (~q V r)) ^ ((~p V q) ^ (~p V ~r)), aplicando negação.
    4. (p), (~q V r), (~p V q), (~p V ~r), CNF.
    5. Resolução:
        p ------ ~p V q,    c1 vs c3.
          q ------ ~q V r,     vs c2.
            r ------ ~p V ~r   vs c4.
                ~p ------ p    vs c1.
                    {}         contradição.


c) ∃x.∀y.P(x, y) -> ∀y.∃x.P(x, y)

    1. ~(∃x.∀y.P(x, y) -> ∀y.∃x.P(x, y)), negando tudo.
    2. ~(~(∃x.∀y.P(x, y)) V ∀y.∃x.P(x, y)), substituindo "->".
    3. ∃x.∀y.P(x, y) ^ ∃y.∀x.~P(x, y), aplicando negação.
    4. ∃x1.∀y1.P(x1, y1) ^ ∃y2.∀x2.~P(x2, y2), arrumando variáveis.
    5. ∃x1.∀y1.∃y2.∀x2.(P(x1, y1) ^ ~P(x2, y2)), arrumando quantificadores existenciais.
    6. ∀y1.∃y2.∀x2.(P(a, y1) ^ ~P(x2, y2)), {x1/a}.
    7. (P(a, y1) ^ ~P(a, f(y1))), {y2/f(y1), x2/a}
    8. (P(a, y1) ^ ~P(a, y1)), {f(y1) / y1}, CNF.
    9. {}, contradição.

d) ∃x.P(x) ∧ ∀x.Q(x)) -> ∃x.(P(x) ∧ Q(x))

    1. ~(∃x.P(x) ∧ ∀x.Q(x)) -> ∃x.(P(x) ∧ Q(x))), negando tudo.
    2. ~(~(∃x.P(x) ∧ ∀x.Q(x))) V (∃x.(P(x) ∧ Q(x)))), substituindo "->".
    3. (∃x.P(x) ∧ ∀x.Q(x)) ^ ∀x.~(P(x) ^ Q(x)), aplicando negação.
    4. P(a) ^ Q(b) ^ ~P(c) V ~Q(d), arrumando quantificadores existenciais. Em ordem, {x/a, x/b, x/c, x/d}.
    5. P(a) ^ Q(b) ^ ~P(a) V ~Q(b), {c/a, d/b}.
    6. P(a), Q(b), ~P(a) V ~Q(b), CNF.
    7. Resolução:
        P(a) ------ ~P(a) V ~Q(b),       c1 vs c3.
            ~Q(b) ------ Q(b),              vs c2.
                {}                          contradição.


2) Tableux

a) ¬(¬P∧ ¬Q)→(¬P→Q)

    Negar...
    1. ~(~(~p ^ ~q) -> (~p -> q))
    2. ~(~p ^ ~q) = p V q, de 1.
    3. ~(~p -> q) = ~(p V q) = ~p ^ ~q, de 1.
    4. ~p, de 3.
    5. ~q, de 3
    6. p | q, de 2.

    Contradição entre ~p e p (4, 6); entre ~q e q (5, 6).

b) ((P→Q)∧(Q→R))→ ¬(¬R∧P)

    1. ~((p -> q) ^ (q-> r)) -> ~~(~r ^ p) = ((p -> q) ^ (q -> r)) ^ (~r ^ p) .
    2. (p -> q) = ~p V q, de 1.
    3. (q -> r) = ~q V r, de 1
    4. (~r ^ p), de 1
    5. ~r, de 4
    6. p, de 4
    7. ~p | q, de 2
    8. {}  ~q | r, de 3

    Contradição entre p e ~p (6, 7), q e ~q (7, 8), r e ~r (5, 8).

c) (∀x.P(x)→ ∃x.Q(x))→ ∃x.(P(x)→Q(x))

    1. ~((∀x.P(x)→ ∃x.Q(x)) → ∃x.(P(x)→Q(x))), negando tudo.
    2. ~(~(∃x.~P(x) V ∃x.Q(x)) V (∃x.(~P(x) V Q(x)))), substituindo "->".
    3. (∃x.~P(x) V ∃x.Q(x)) ^ (∀x.~(~P(x) V Q(x))), aplicando negação.
    4. (∃x.~P(x) V ∃x.Q(x)) ^ (∀x.(P(x)) ^ ∀x.~(Q(x)))), aplicando negação.
    5. (∃x1.~P(x1) V ∃x2.Q(x2)) ^ (∀x3.(P(x3)) ^ ∀x4.~(Q(x4)))), arrumando variáveis.
    5. (~P(a) V Q(b)) ^ P(f(c)) ^ ~Q(f(d)), arrumando quantificadores existenciais.
    6. (~P(a) V Q(b)) ^ (P(a)) ^ (~Q(b)), {f(c)/a, f(d)/b}, CNF.
    7. P(a), de 6.
    8. ~Q(b), de 6.
    9. ~P(a) | Q(b), de 6.


    Contradição entre P(a) e ~P(a) (7, 9), Q(a) e ~Q(a) (8, 9).

d) ∃x.(P(x)∧Q(x))→(∃x.P(x)∧ ∃x.Q(x))

    1. ~(∃x.(P(x)∧Q(x))→(∃x.P(x)∧ ∃x.Q(x))), negando tudo.
    2. ~(~∃x.(P(x)∧Q(x)) V (∃x.P(x)∧ ∃x.Q(x))), substituindo "->".
    3. (∃x.(P(x)∧Q(x))) ^ (∀x.~P(x) V ∀x.~Q(x)), aplicando negação.
    4. (∃x1.(P(x2))∧ ∃x2.Q(x2))) ^ (∀x3.~P(x3) V ∀x4.~Q(x4)), arrumando variáveis.
    5. (P(a)) ∧ (Q(b)) ^ (~P(f(x3)) V ~Q(f(x4))), arrumando quantificadores existenciais.
    6. (P(a)) ∧ (Q(b)) ^ (~P(a) V ~Q(b)), {f(x3)/a, f(x4)/b}.
    7. P(a), de 6.
    8. Q(b), de 6.
    9. P(a) | Q(b), de 6.

    Contradição entre P(a) e ~P(a) (7, 9); Q(a) e ~Q(a) (8, 9).

e) ∀x.(P(x)∨Q(x))→(∃x.P(x)∨ ∀x.Q(x))

    1. ~(∀x.(P(x)∨Q(x))→(∃x.P(x)∨ ∀x.Q(x))), negando tudo.
    2. ~(~(∀x.(P(x)∨Q(x))) V (∃x.P(x)∨ ∀x.Q(x))), substituindo "->".
    3. (∀x.(P(x)∨Q(x)) ^ (∀x.~P(x) ^ ∃x.~Q(x)), aplicando negação.
    4. (∀x1.P(x1) ∨ ∀x2.Q(x2)) ^ (∀x3.~P(x3) ^ ∃x4.~Q(x4)), arrumando variáveis.
    5. P(f(x1)) V Q(f(x2)) ^ ~P(f(x3)) ^ ~Q(x4), arrumando quantificadores existenciais.
    6. P(a) V Q(b) ^ ~P(a) ^ ~Q(b), substituindo: {f(x3)/f(x1), f(x1)/a; f(x2)/b, x4/b}.
    7. ~P(a), de 6.
    8. ~Q(b), de 6.
    9. P(a) | Q(b), de 6.

    Contradição entre P(a) e ~P(a) (7,9); Q(a) e ~Q(a) (8, 9).
