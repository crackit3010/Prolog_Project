isGroup(S,Op):-lengthCheck(Op),isClosed(S,Op),genAssList(S,S,S,S,AssList),!,isAssociative(AssList,Op),!,idExist(S,S,S,Op,I),!,invExist(S,S,S,Op,I).
/* checks for a group */

isAbelian(S,Op):-genCommList(S,S,S,L),!,isCommutative(L,Op),isGroup(S,Op).
/* checks for an abelian */


genAssList(S,[],_,_, []).
genAssList(S, [H|T], [], _, R) :- genAssList(S, T, S, S, R).
genAssList(S, List1,[H|T],[], R) :- genAssList(S, List1, T, S, R).
genAssList(S,[H1|T1],[H2|T2],[H3|T3], [[H1, H2, H3]| T]) :- genAssList(S, [H1|T1],[H2|T2],T3, T).
/* generate a list of all permutations of elements in S , to be checked by isAssociative predicate*/

isAssociative([],Op).
isAssociative([[H1,H2,H3]|T],Op):-calculate(H1,H2,Op,R),!,calculate(R,H3,Op,P),!,calculate(H2,H3,Op,Q),!,calculate(H1,Q,Op,S),!,P=S,isAssociative(T,Op).
/* checks whether the operator is associative or not   */


lengthCheck([]).
lengthCheck([H|T]):-length(H,3),lengthCheck(T).
/* checks for the correct format of the Op list */


calculate(Op1,Op2,[[Op1,Op2,R]|_],R).
calculate(Op1,Op2,[H|T],Z):-calculate(Op1,Op2,T,Z).
/* evaluates the result of Op1 and Op2 when Operator is applied */


genCommList(S,[],_, []).
genCommList(S,[H|T],[], R) :- genCommList(S, T,S, R).
genCommList(S,[H1|T1],[H2|T2], [[H1, H2]| T]) :- genCommList(S, [H1|T1],T2, T).
/* generate a list of all permutations of elements in S , to be checked by isCommutative predicate*/


isCommutative([],Op).
isCommutative([[H1,H2]|T],Op):- calculate(H1,H2,Op,R),!,calculate(H2,H1,Op,S),!,R=S,isCommutative(T,Op).
/* checks whether the operator is commutative or not   */


memb([H|T], H).
memb([_|T], X) :- memb(T, X).
subs(List1, [Op1, Op2, Op3]) :- memb(List1, Op1), memb(List1, Op2), memb(List1, Op3).
/* checks whether Op1,Op2 and Op3 is present in List1  */

isClosed(S, []).
isClosed(S,[H|T]):-subs(S,H),isClosed(S,T).
/* checks whether the operator is closed   */


idExist(S,[H|T],[],Op,H).
idExist(S,[H1|T1],[H2|T2],Op,I):-calculate(H1,H2,Op,R),calculate(H2,H1,Op,T),R=T,T=H2,idExist(S,[H1|T1],T2,Op,I).
idExist(S,[H1|T1],[H2|T2],Op,I):-idExist(S,T1,S,Op,I).
/* checks for existence of identity element   */


invExist(S,[],_,Op,I).
invExist(S,[H1|T1],[H2|T2],Op,I):-calculate(H2,H1,Op,I),!,invExist(S,T1,S,Op,I);invExist(S,[H1|T1],T2,Op,I).
/* checks for existence of inverse for each element  */






































