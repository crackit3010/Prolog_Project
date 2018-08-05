# Prolog_Project
Query Format

Query for checking a group is given as:

isGroup(S,Op).

such that S is the finite set and Op is the binary operation list on S

S is a list
and Op is a list of list.

e.g 
isGroup([0,1],[[0,0,0],[0,1,1],[1,0,1],[1,1,0]]).
here, 
S=[0,1],
Op=[[0,0,0],[0,1,1],[1,0,1],[1,1,0]]
//Output = true.

and another query for checking abelian is given as:

isAbelian(S,Op)

such that S is the finite set and Op is the binary operation list on S

S is a list
and Op is a list of list.

e.g.
isAbelian([a,b,c],[[a,a,a],[a,b,b],[a,c,c],[b,a,b],[b,b,c],[b,c,a],[c,a,c],[c,b,a],[c,c,b]]).

here,
S=[a,b,c]
Op=[[a,a,a],[a,b,b],[a,c,c],[b,a,b],[b,b,c],[b,c,a],[c,a,c],[c,b,a],[c,c,b]]
//output: true


Note: rest of the predicates are defined using comments in the program file.
