g(0,1). 
g(0,2). 
g(1,3). 
g(1,4). 
g(1,8). 
g(3,5). 
g(2,6). 
g(5,7). 
g(6,8). 
goal(8).
 
breadthfirst(Next, _ ) :- 
	bfs([[Next]], _). 

bfs([[Next|Path]|_], [Next|Path]) :- 
	goal(Next). 

bfs([Path|Ps],_) :-   
	traverse(Path, Np),  append(Ps, Np, Pp),  bfs(Pp, _). 

head([[H1|_], [H2|_]]) :- 
	write(H1), write(' '), write(H2). 

traverse([Next|Path], Np) :-  
	bagof([Nn, Next|Path], (g(Next, Nn), not(member(Nn, [Next|Path]))), Np),  write(Np), nl, !.  

traverse(_, []) :- true. 
