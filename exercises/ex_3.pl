%% Francisco Vicenzi
%% Sistema Especialista para indicar um album do Angra

genre(prog).
genre(power).
genre(heavy).
genre(neoclassical).
genre(speed).
genre(folk).

singer(am).
singer(edu).
singer(lione).

mood(sad).
mood(angry).
mood(melancholic).
mood(rage).
mood(lonely).
mood(excited).

concept(life).
concept(brazil).
concept(shakespeare).
concept(defeat).
concept(death).
concept(departure).
concept(everything).
concept(renewal).
concept(crusade).

album(ac, S, G, M, C) :- (S = am), (G = prog; G = power), (M = sad), (C = life), !.
album(hl, S, G, M, C) :- (S = am), (G = power; G = folk), (M = melancholic), (C = brazil), !.
album(fw, S, G, M, C) :- (S = am), (G = power; G = heavy; G = speed), (M = lonely), (C = departure), !.
album(rb, S, G, M, C) :- (S = edu), (G = power; G = prog; G = neoclassical), (M = excited), (C = renewal), !.
album(tos, S, G, M, C) :- (S = edu), (G = power; G = prog), (M = angry; M = rage; M = sad; M = excited), (C = death; C = life; C = crusade), !.
album(ar, S, G, M, C) :- (S = edu), (G = power; G = prog; G = speed), (M = angry; M = lonely), (C = death; C = departure), !.
album(aq, S, G, M, C) :- (S = edu), (G = prog; G = power), (M = rage; M = angry), (C = shakespeare; C = life), !.
album(sg, S, G, M, C) :- (S = lione), (G = prog; G = power), (M = excited), (C = life), !.
album(om, S, G, M, C) :- (S = lione), (G = prog; G = power), (M = excited; M = melancholic), (C = everything; C = brazil), !.


name(ac, 'Angels Cry').
name(hl, 'Holy Land').
name(fw, 'Fireworks').
name(rb, 'Rebirth').
name(tos, 'Temple of Shadows').
name(ar, 'Aurora Consurgens').
name(aq, 'Aqua').
name(sg, 'Secret Garden').
name(om, 'OMNI').

formatList(A, L) :- atomics_to_string(L, ', ', A).
listSingers(A) :- findall(S, singer(S), L), formatList(A, L).
listGenres(A) :- findall(S, genre(S), L), formatList(A, L).
listMoods(A) :- findall(S, mood(S), L), formatList(A, L).
listConcepts(A) :- findall(S, concept(S), L), formatList(A, L).


ask(A) :- writeln("Let's see which album from Angra you would like to listen now!"),
          listSingers(S_L),     format('What is your favorite singer? Possibilities: [~w]. Answ=', S_L), read(S),
          listGenres(G_L),      format('What is your favorite metal subgenre? Possibilities: [~w]. Answ=', G_L), read(G),
          listMoods(M_L),       format('How are you felling now? Possibilities: [~w]. Answ=', M_L), read(M),
          listConcepts(C_L),    format('Choose a concept. Possibilities: [~w]. Answ=', C_L), read(C),
          album(N, S, G, M, C), name(N, A).
